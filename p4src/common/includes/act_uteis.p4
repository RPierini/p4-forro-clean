// Mark the package to be dropped at the end of ingress and skip the rest of the pipeline
action drop(){
    ig_dprsr_md.drop_ctl = 1;
    exit;
}