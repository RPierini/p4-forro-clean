#!/usr/bin/env bash

cd ~/bf-sde-9.9.0; . ~/tools/set_sde.bash; sde

function p4_build {
    ~/tools/p4_build.sh ~/p4-forro-clean/p4src/tofino/p4_forro.p4
}

#Start the topology
function topo_start {
	#p4_build
	sudo ~/tools/veth_setup.sh
    sleep 3
    sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
    sleep 2
    screen -dm -S "tofino-model" ./run_tofino_model.sh -p p4_forro --arch tofino
    sleep 5
    screen -dm -S "bf_switchd" ./run_switchd.sh -p p4_forro --arch tofino
    sleep 5
    screen -dm -S "bfshell" ./run_bfshell.sh -b ~/p4-forro-clean/bfrt_python/setup.py -i
    sleep 5

    sudo ip netns add h1
    sudo ip netns add h2

    sudo ip link set dev veth1 netns h1
    sudo ip link set dev veth3 netns h2

    sudo ip netns exec h1 ip addr add dev veth1 10.0.1.1/24
    sudo ip netns exec h1 ip link set addr 08:00:00:00:01:01 dev veth1
    sudo ip netns exec h1 ip link set up dev veth1
    sudo ip netns exec h1 ip neigh add 10.0.1.2 lladdr 08:00:00:00:01:02 dev veth1
    sudo ip netns exec h1 ip route add default via 10.0.1.2
    sudo ip netns exec h1 sysctl -w net.ipv6.conf.all.disable_ipv6=1

    sudo ip netns exec h2 ip addr add dev veth3 10.0.1.2/24
    sudo ip netns exec h2 ip link set addr 08:00:00:00:01:02 dev veth3
    sudo ip netns exec h2 ip link set up dev veth3
    sudo ip netns exec h2 ip neigh add 10.0.1.1 lladdr 08:00:00:00:01:01 dev veth3
    sudo ip netns exec h2 ip route add default via 10.0.1.1
    sudo ip netns exec h2 sysctl -w net.ipv6.conf.all.disable_ipv6=1
}

#Stop the topology
function topo_stop {
    sudo killall bfshell
    sudo killall bf_switchd
    sudo killall tofino-model
    sudo ip netns del h1
    sudo ip netns del h2
    sudo ~/tools/veth_teardown.sh
}

#Opens a shell in the current tty for the defined host. Example: "./controle.sh shell h1"
function shell {
	sudo ip netns exec ${1} bash
}

$@