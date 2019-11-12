#!/bin/bash

module swap gnu8 gnu7
module load mvapich2

rm -rf bibw latency; mkdir bibw latency

echo "Started at `date` " > summary.dat
echo "OSU MPI Bi-Directional Bandwidth (MB/s) Test v5.3.2" >> summary.dat
echo "Source |  Destination |  Bandwidth (MB/s) |  Latency (us)" >> summary.dat

for node in `cat nodelist`
   do 
   mpirun -np 2 -ppn 1 -hosts openhpc,$node /opt/ohpc/pub/mpi/mvapich2-gnu7/2.2/libexec/osu-micro-benchmarks/mpi/pt2pt/osu_bibw > bibw/$node.log
   mpirun -np 2 -ppn 1 -hosts openhpc,$node /opt/ohpc/pub/mpi/mvapich2-gnu7/2.2/libexec/osu-micro-benchmarks/mpi/pt2pt/osu_latency > latency/$node.log
   #echo -n "openhpc  $node" >> summary.dat
   printf "openhpc %-15s\t" "$node" >> summary.dat
   grep 1048576 bibw/$node.log latency/$node.log |awk '{printf "\t%-10d\t", $2}' >> summary.dat
   echo " " >> summary.dat
   done   
  
echo "Ended at `date` " >> summary.dat
