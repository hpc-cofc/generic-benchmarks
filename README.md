# generic-benchmarks
Generic compute, storage and communication benchmarks

# Compute
## Intel HPL benchmarks

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

#### Average throughput per process
| # clients or processes  | Sequential write rate (MB/s)  | Sequential read rate (MB/s)?  | 
|:------------------------|:----------------|:-----------|
| 1       |    1660 |    1937 |
| 2       |    1488 |    1340 |
| 4       |    1029 |     927 |
| 8       |     617 |     590 |
| 13      |     408 |     411 |


#### Total throughput
| # clients or processes  | Sequential write rate (MB/s)  | Sequential read rate (MB/s)?  | 
|:------------------------|:----------------|:-----------|
| 1    |       1660 |    1937 |
| 2    |       2977 |    2680 |
| 4    |       4117 |    3710 |
| 8    |       4940 |    4720 |
| 13   |       5315 |    5353 |

#### NVME-SSD Scratch Server

#### Average throughput per process
| # clients or processes  | Sequential write rate (MB/s)  | Sequential read rate (MB/s)?  | 
|:------------------------|:----------------|:-----------|
|  |  | 

#### Total throughput
| # clients or processes  | Sequential write rate (MB/s)  | Sequential read rate (MB/s)?  | 
|:------------------------|:----------------|:-----------|
| | |

