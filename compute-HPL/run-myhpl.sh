#!/bin/bash

source ~/intel/bin/compilervars.sh -arch intel64 -platform linux

for n_nodes in 1 2 4 8 10; do
   case $n_nodes in
      1) NB=141312; P=1; Q=1 ;;
      2) NB=200448; P=1; Q=2 ;;
      4) NB=283392; P=2; Q=2 ;;
      8) NB=400896; P=2; Q=4 ;;
      10) NB=448512; P=2; Q=5 ;;
   esac
   echo "NB = $NB ; P=$P ; Q= $Q "
   mpirun --perhost 1 -n $n_nodes -hostfile ./hostfiles/hostfile-$n_nodes ./xhpl_intel64_dynamic -p $P -q $Q -b 384 -n $NB > ./logs/$n_nodes-nodes.log
done
