# Standard Benchmarks
The three main components of an HPC cluster are the compute engine, the storage and network. The standard benchmarks below explore performance of each. For more specific application bencharks, please see the `example runs` repository.

# Compute
## Intel HPL benchmarks

Here we benchmark the performance of different nodes individually as well as as a larger cluster unit.
These include

- 10 40-core stdmem nodes
- 1 80-core bigimem node
- 2 24-core gpu-containing nodes



<pre>
An explanation of the input/output parameters follows:
T/V    : Wall time / encoded variant.
N      : The order of the coefficient matrix A.
NB     : The partitioning blocking factor.
P      : The number of process rows.
Q      : The number of process columns.
Time   : Time in seconds to solve the linear system.
Gflops : Rate of execution for solving the linear system.
</pre>


 T/V                         | N<sub>cores</sub> | MEM/node (GB) |  N  |  NB | P | Q | Time(secs)  |  Gflops |
|:---------------------------|----------:|-------:|-----:|-----:|---:|---:|---------:|-------------:|
| 1-gpuv100-node:WC00C2R2    | 24   | 192        | 141312 | 384 | 1 | 1 | 1182 |  1,591 |
| 1-stdmem-node:WC00C2R2     | 40   | 192        | 141312 | 384 | 1 | 1 | 823  |  2,285 |
| 2-stdmem-nodes:WC00C2R2    | 80   | 192        | 200448 | 384 | 1 | 2 | 1200 |  4,474 |
| 1-bigmem-node:WC00C2R2     | 80   | 1536       | 400896 | 384 | 1 | 1 | 10607 |  4,050 |
| 4-stdmem-nodes:WC00C2R2    | 160  | 192        | 283392 | 384 | 2 | 2 | 1699 |  8,931 |
| 8-stdmem-nodes:WC00C2R2    | 320  | 192        | 400896 | 384 | 2 | 4 | 2415 |  17,785|
| 10-stdmem-nodes:WC00C2R2   | 400  | 192        | 448512 | 384 | 2 | 5 | 2707 |  22,219 |

Please see the `compute-HPL` directory for details.

# Storage
## Devices
### NSS-HA 7.3 
This is a 512TB NFS-shared long-term storage composed of 
- an ME4084 storage array with 80 8TB drives in 8 8+2 RAID6 LUNs
- attached to two HA NFS servers via redundant 12Gbps SAS cables

### NVMe-SSD-based scratch storage
This is a 38TB NFS-shared short-term storage composed of 
- 24 1.6TB mixed-use NVMe SSDs 
- forming a large, striped logical volume 

## IOzone Benchmarks
We'll test the performance of the different storage solutions when 
- writing 512GB of data in 1MB blocks over a number of clients or processes ranging from 1 to 13. That is 
   - 512GB over 1 client/process
   - 256GB each over 2 clients or processes
   - .
   - .
   - 39GB each over 13 clients or processes
    
The benchmarks will yield the per-client/process and overall throughput for  
- the sequential write speed 
- the sequential read speed
- the random write IOPS  (I/O operations per second)
- the random read IOPS  (I/O operations per second)
### Local (direct-attached)

#### NSS-HA 7.3 

##### Average throughput per process
| # clients or processes  | Sequential write rate (MB/s)  | Sequential read rate (MB/s)?  | 
|:------------------------|:----------------|:-----------|
| 1       |    1660 |    1937 |
| 2       |    1488 |    1340 |
| 4       |    1029 |     927 |
| 8       |     617 |     590 |
| 13      |     408 |     411 |


##### Total throughput
| # clients or processes  | Sequential write rate (MB/s)  | Sequential read rate (MB/s)?  | 
|:------------------------|:----------------|:-----------|
| 1    |       1660 |    1937 |
| 2    |       2977 |    2680 |
| 4    |       4117 |    3710 |
| 8    |       4940 |    4720 |
| 13   |       5315 |    5353 |

#### NVME-SSD Scratch Server

##### Average throughput per process
| # clients or processes  | Sequential write rate (MB/s)  | Sequential read rate (MB/s)?  | Random Write (IOPS) | Random Read (IOPS)  
|:------------------------|:----------------|:-----------|:----------------|:-----------|
| 1     |      1168474  |   1145639  |      7755   |    13822 |
| 2     |      1043387  |   1071096  |      7305   |    13724 |
| 4     |       929801  |    995405  |      7146   |    12651 |
| 8     |       516795  |    739848  |      6762   |    11619 |
| 13    |       318603  |    527772  |      6073   |    11332 |

<pre>
Total throughput
1           1168474     1145639        7755       13822
2           2086774     2142193       14611       27448
4           3719207     3981622       28585       50607
8           4134362     5918791       54097       92955
13          4141840     6861047       78951      147316
</pre>

#### Average throughput per process
| # clients or processes  | Sequential write rate (MB/s)  | Sequential read rate (MB/s)?  | 
|:------------------------|:----------------|:-----------|
|  |  | 

#### Total throughput
| # clients or processes  | Sequential write rate (MB/s)  | Sequential read rate (MB/s)?  | 
|:------------------------|:----------------|:-----------|
| | |


# Network
## EDR Infiniband (100 Gbps)


Basic MPI benchmarks using OSU tools described here:

http://mvapich.cse.ohio-state.edu/benchmarks/

See script at `./infiniband/osu-mpi-benchmarks/initial/ib-pt2pt.sh`

### Bi-Directional Bandwidth (BiBW)

`[HPL@openhpc ~]$ mpirun -np 2 -ppn 1 -hosts compute001,compute003 /opt/ohpc/pub/mpi/mvapich2-gnu7/2.2/libexec/osu-micro-benchmarks/mpi/pt2pt/osu_bibw`

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
