# Infiniband

Basic MPI benchmarks using OSU tools described here:

http://mvapich.cse.ohio-state.edu/benchmarks/

See script at `./infiniband/osu-mpi-benchmarks/initial/ib-pt2pt.sh`

## BiBW

***OSU MPI Bi-Directional Bandwidth (MB/s) Test v5.3.2***

Source |  Destination |  Bandwidth (MB/s) |  Latency (us)
-------|--------------|-------------------|--------------
openhpc |  compute001  |     		20136   |    		103       	 
openhpc |  compute002  |     		20939   |   		104       	 
openhpc |  compute003  |     		24187   |   		96        	 
openhpc |  compute004  |     		23974   | 		100       	 
openhpc |  compute005  |     		24208   | 		97        	 
openhpc |  compute006  |     		20749   | 		97        	 
openhpc |  compute007  |     		24120   | 		96        	 
openhpc |  compute008  |     		24312   | 		95        	 
openhpc |  bigmem001   |     		23688   | 		98        	 
openhpc |  gpu001      |     		24317   | 		95        	 
openhpc |  gpu002      |     		24323   | 		95        	 
openhpc |  gpuv100001  |     		24331   | 		96        	 
openhpc |  gpuv100002  |     		24303   | 		96        	 
openhpc |  stor3       |     		24358   | 		95        	 

## Latency

### Latency

`[HPL@openhpc ~]$ mpirun -np 2 -ppn 1 -hosts compute001,compute002 /opt/ohpc/pub/mpi/mvapich2-gnu7/2.2/libexec/osu-micro-benchmarks/mpi/pt2pt/osu_multi_lat `

<pre>
# OSU MPI Multi Latency Test v5.3.2
# Size          Latency (us)
0                       0.98
1                       1.03
2                       1.03
4                       1.04
8                       1.03
16                      1.06
32                      1.06
64                      1.07
128                     1.12
256                     1.56
512                     1.63
1024                    1.79
2048                    2.18
4096                    2.88
8192                    4.02
16384                   6.60
32768                   8.13
65536                  12.27
131072                 18.95
262144                 29.98
524288                 52.71
1048576                95.41
2097152               180.75
4194304               351.53
</pre>

