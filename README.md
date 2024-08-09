# P4-forro
P4 implementation of the Forro Cipher

Implementação em P4 para TNA (*Tofino Native Architecture*) do algoritmo de cifra de fluxo Forro14 desenvolvido na UnB.

Esta é uma versão do repositório sem arquivos de propriedade intelectual da Intel, conforme NDA de alunos do ICA (*Intel Communications Academy*).

A referência para implementação é o artigo [Latin Dances Reloaded: Improved Cryptanalysis Against Salsa and ChaCha, and the Proposal of Forró
](https://link.springer.com/chapter/10.1007/978-3-031-22963-3_9) e o repositório [forro_cipher](https://github.com/murcoutinho/forro_cipher) do autor Murilo Coutinho, onde há um código em C.

O algoritmo Forro14 traz algumas modificações no algoritmo ChaCha20 proposto por Bernstein, com uma melhor difusão do estado entre os quarter-rounds através de um processo chamado de "polenização" (Pollenization) e através de um método empírico para escolha dos melhores valores de shifts para o algoritmo. Esse processo torna Forro uma cifra mais resistente a ataques diferenciais e permite que um número menor de rodadas possa prover uma segurança similar ao ChaCha, melhorando o desempenho do algoritmo. Proporcionalmente, o Algoritmo Forró pode executar 2 rodadas a menos a cada 7 rodadas do algoritmo ChaCha mantendo o mesmo nível de segurança, por isso a opção de utilizar 14 rodadas do algoritmo Forró contra 20 rodadas do algoritmo ChaCha20.

# Requisitos para usar o modo TNA:

- Instalar o BF-SDE 9.9.0 ou superior
- adicionar a linha de carregamento do BF-SDE no fim do bashrc do usuário:
    > cd; . ~/tools/set_sde.bash; sde
- instalar o scapy no venv do SDE:
    ```
    source ~/bf-sde-9.9.0/install/lib/python3.8/venv/scripts/common/activate
    sudo python3 -m pip install --upgrade pip
    sudo python3 -m pip install scapy
    ```

# Orientações para uso

Atenção às seguintes suposições:
- os scripts de ferramentas do ICA estao em ~/tools
- o bf_sde está no home do usuario e a versão 9.9.0 está instalada. Caso use uma versão diferente, atualize na linha 3 do control.sh

Usar o script control.sh para fazer as operações.

- ./control.sh p4_build: realiza o build do arquivo P4
- ./control.sh topo_start: inicia a topologia (NetNS h1, 08:00:00:00:01:01@10.0.1.1, conectado na porta 1 do tofino-model, NetNS h2, 08:00:00:00:01:02@10.0.1.2 conectado na porta 2 do tofino-model)
- ./control.sh topo_stop: para a topologia (remove processos do bf e os NetNS)
- ./control.sh shell [h1|h2]: abre o shell (Bash) do host h1 ou h2

Use os script "receive.py" em um host para receber os pacotes e o script "send.py \<ip destino\> \<mensagem\>" para enviar um pacote com a mensagem a ser cifrada.
O script bfrt_python/setup.py faz a inserção das regras nas tabelas do switch, para que o algoritmo possa ser rodado corretamente.
A chave (elementos K0 a K7) e o Nonce (elementos N0 e N1) são definidos no arquivo p4src/tofino/p4_forro.p4

Para a geração do tráfego para testes, recomendo o [PIPO-TG](https://github.com/intrig-unicamp/PIPO-TG). O pacote deve ter o formato \<Ethernet\>\<Mensagem\>