# HPL benchmarks

High-performance LINPACK (HPL) is a standard benchmark of the compute capacity of a cluster. It
generates a random matrix that fills all the available RAM in a system and performs linear algebra
operations that use up all the available CPU. 

Here we benchmark the performance of different nodes individually as well as as a larger cluster unit.
These include 

- 10 40-core stdmem nodes
- 1 80-core bigimem node
- 2 24-core gpu-containing nodes


# HPL Input files

Here's a sample HPL input file

```
HPLinpack benchmark input file
Innovative Computing Laboratory, University of Tennessee
HPL.out      output file name (if any)
6            device out (6=stdout,7=stderr,file)
1            # of problems sizes (N)
1000         Ns
1            # of NBs
192 256      NBs
1            PMAP process mapping (0=Row-,1=Column-major)
1            # of process grids (P x Q)
1 2          Ps
1 2          Qs
16.0         threshold
1            # of panel fact
2 1 0        PFACTs (0=left, 1=Crout, 2=Right)
1            # of recursive stopping criterium
2            NBMINs (>= 1)
1            # of panels in recursion
2            NDIVs
1            # of recursive panel fact.
1 0 2        RFACTs (0=left, 1=Crout, 2=Right)
1            # of broadcast
0            BCASTs (0=1rg,1=1rM,2=2rg,3=2rM,4=Lng,5=LnM)
1            # of lookahead depth
0            DEPTHs (>=0)
0            SWAP (0=bin-exch,1=long,2=mix)
1            swapping threshold
1            L1 in (0=transposed,1=no-transposed) form
1            U  in (0=transposed,1=no-transposed) form
0            Equilibration (0=no,1=yes)
8            memory alignment in double (> 0)
```

# Results

<pre>
Number of Intel(R) Xeon Phi(TM) coprocessors : 0
================================================================================
HPLinpack 2.1  --  High-Performance Linpack benchmark  --   October 26, 2012
Written by A. Petitet and R. Clint Whaley,  Innovative Computing Laboratory, UTK
Modified by Piotr Luszczek, Innovative Computing Laboratory, UTK
Modified by Julien Langou, University of Colorado Denver
================================================================================

An explanation of the input/output parameters follows:
T/V    : Wall time / encoded variant.
N      : The order of the coefficient matrix A.
NB     : The partitioning blocking factor.
P      : The number of process rows.
Q      : The number of process columns.
Time   : Time in seconds to solve the linear system.
Gflops : Rate of execution for solving the linear system.

The following parameter values will be used:

N        :  448512
NB       :     384
PMAP     : Column-major process mapping
P        :       2
Q        :       5
PFACT    :   Right
NBMIN    :       2
NDIV     :       2
RFACT    :   Crout
BCAST    :   1ring
DEPTH    :       0
SWAP     : Binary-exchange
L1       : no-transposed form
U        : no-transposed form
EQUIL    : no
ALIGN    :    8 double precision words

--------------------------------------------------------------------------------

- The matrix A is randomly generated for each test.
- The following scaled residual check will be computed:
      ||Ax-b||_oo / ( eps * ( || x ||_oo * || A ||_oo + || b ||_oo ) * N )
- The relative machine precision (eps) is taken to be               1.110223e-16
- Computational tests pass if scaled residuals are less than                16.0


</pre>

Here we benchmark the performance of different nodes individually as well as as a larger cluster unit.
These include 

- 10 40-core stdmem nodes
- 1 80-core bigimem node
- 2 24-core gpu-containing nodes

 T/V                                                |  N  |  NB | P | Q | Time(secs)  |  Gflops |
----------------------------------------------------|-----|-----|---|---|---------|-------------
| logs/gpuv100.log:WC00C2R2                        | 141312 | 384 | 1 | 1 | 1182 |  1,591 |
| logs/1-nodes.log:WC00C2R2                        | 141312 | 384 | 1 | 1 | 823  |  2,285 |
| logs/2-nodes.log:WC00C2R2                        | 200448 | 384 | 1 | 2 | 1200 |  4,474 |
| logs/bigmem.log:WC00C2R2                         | 400896 | 384 | 1 | 1 | 10607 |  4,050 |
| logs/4-nodes.log:WC00C2R2                        | 283392 | 384 | 2 | 2 | 1699 |  8,931 |
| logs/8-nodes.log:WC00C2R2                        | 400896 | 384 | 2 | 4 | 2415 |  17,785| 
| logs/10-nodes.log:WC00C2R2                       | 448512 | 384 | 2 | 5 | 2707 |  22,219 |


# Log files

You can find the log files of these benchmarks in the `logs` directory.

# Useful sites

You can get an estimate of the HPL numbers for your cluster at the site below even though you have to carefully provide the right information.
(http://hpl-calculator.sourceforge.net/)[http://hpl-calculator.sourceforge.net/]

You also have to use an optimal HPL input file which you can generate here:
(https://www.advancedclustering.com/act_kb/tune-hpl-dat-file)[https://www.advancedclustering.com/act_kb/tune-hpl-dat-file/]
