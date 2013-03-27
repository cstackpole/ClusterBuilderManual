# Building Cbench
## Prep work
* Install needed software for compiling cbench.  
>`yum install imake glibc-utils compat-glibc-headers compat-glibc glibc-static gnuplot`  

* Create a directory for you to compile in.  
>`$ mkdir ~/code`  
* Download the following software: FFTW, LAPACK, and BLAS. See the [HelpfulLinks](HelpfulLinks.html) for the download locations.  

## FFTW
These steps are approxamte as your download location will probably be different.  
>`$ cd ~/code`  
>`$ tar -zxvf ~/Downloads/fftw-2.1.5.tar.gz`  
>`$ cd fftw-2.1.5`  
>`$ ./configure --prefix=/opt/fftw-2.1.5/`  
>`$ make`  
>`$ sudo make install`

## BLAS
>`$ cd ~/code`  
>`$ tar -zxvf ~/Downloads/blas.tgz`  
>`$ cd BLAS`  
>`$ make`  
>`$ cp blas_LINUX.a  libblas_LINUX.a`
## LAPACK
>`$ cd ~/code`  
>`$ tar -zxvf ~/Downloads/lapack*.tgz`  
>`$ cd lapack*/`  
>`$ cp make.inc.example make.inc`  

Edit make.inc and replace this line:  
>`BLASLIB      = ../../librefblas.a`  

With this line:  
>`BLASLIB      = ~/code/BLAS/blas_LINUX.a`  

Configure an alternate install point and make
>`$ ./configure --prefix=/opt/fftw-2.1.5/`  
>`$ make`  

## Compiling CBench

Start off in your code directory:  
>`$ cd ~/code`  

Cbench requires you to have a source file for all the variables that need to be set and configured. This guide is going to have you store this file in your ~/code directory under the name bSource. Anytime you want to interact with the Cbench scripts, you will have to source this file. Please note that you need to have a '.' followed by a space and then the name of the file. Also, replace X.X.X with the proper versions and replace USERNAME with your user id.  
>`$ vi ~/code/bSource`  
>`export CBENCHOME='/home/USERNAME/code/cbench/'`  
>`export CBENCHTEST='/home/USERNAME/code/cbenchTest'`  
>`export MPIHOME='/usr/lib64/mpich2'`  
>`export COMPILERCOLLECTION=gcc`  
>`export LAPACKLIB='-L/home/USERNAME/code/lapack-X.X.X -llapack_LINUX'`  
>`export BLASLIB='-L/home/USERNAME/code/BLAS -lblas_LINUX -lpthread -lm -lgfortran'`  
>`export FFTW_INCLUDE='/opt/fftw-2.5.1/include/'`  
>`export FFTW_LIB='/opt/fftw-2.5.1/lib -lm'`  
>$ . ~/code/bSource  

There have been MANY changes since the release of cbench-1.2.2 over 4 years ago so this guide HIGHLY recommends pulling the latest copy from the SVN repo.  
>`$ svn co http://cbench.svn.sourceforge.net/svnroot/cbench/trunk/cbench/ cbench`  

Cbench uses a test directory to "install" to. Create it like this:  
>`$ mkdir ~/code/cbenchTest`  

Enter the cbench directory. Cbench uses a cluster.def file for determining how to run jobs. We need to edit this to fit our needs. Change the following lines from:  
>$max_nodes = 1;  
>$procs_per_node = 1;  
>$batch_method = "slurm";  

To:  
>$max_nodes = YOUR_NODE_NUMBER_HERE;  
>$procs_per_node = YOUR_PROC_PER_NODE_HERE;  
>$batch_method = "torque";  

Test the cbench linkage. If this fails, double check and resource your bSource file.
>`$ make -C opensource/maketests`  

Compile Cbench.  
If you have a GPU cluster: `$ make doitall`  
If you do not have a GPU cluster: `$ make domostall`  

Compile the NASA Parallel Benchmark.  
>`$ make -C opensource/NPB mpi`  

Get the openapps branch to compile it as well. Then check that it compiled OK before installing it into the cbench test folder. Note: There may be a few errors but as long as it is mostly green, then things should be ok.  
>`$ svn co http://cbench.svn.sourceforge.net/svnroot/cbench/trunk/openapps/ ~/code/cbench/openapps`  
>`$ make -C openapps`  
>`$ make -C openapps binstatus`  
>`$ make -C openapps install`  

Now install Cbench into the test folder.  
>`$ make itests`  

# Using Cbench
Now that Cbench has been built, it should be possible to run jobs now. The simplest way is to just run the scripts to generate and launch the jobs.  
>`$ cd ~/code/cbenchTest/`  
>`$ ./gen_jobs.pl`  
>`$ ./start_jobs.pl`  

While that is the easiest method, this guide does not recommend flooding the queue. It is possible to get some strange results because jobs were running multiple benchmarks at the same time. Instead, run the start_jobs script with the flag --serialbatch so that only one job runs at a time.  
> `$ ./start_jobs.pl --serialbatch`  

It is, of course, possible to launch only one type of benchmark at a time. Look inside the cbenchTest directory. It should look similar to this:  
>`amg...............hpccg........perllib`  
>`bandwidth.........io...........phdmesh`  
>`bin...............iosanity.....rotate`  
>`cbench_functions..irs..........sbin`  
>`cbench-init.csh...lammps.......shakedown`  
>`cbench-init.sh....latency......sppm`  
>`cbench.pl.........linpack......start_jobs.pl`  
>`cluster.def.......mpigraph.....sweep3d`  
>`collective........mpioverhead..templates`  
>`gen_jobs.pl.......mpisanity....tools`  
>`graph500..........nodehwtest...trilinos`  
>`hpcc..............npb`  

For example, linpack.
>`$ cd linpack`  
>`$ ./linpack_gen_jobs.pl`  
>`$ ./linpack_start_jobs.pl --serialbatch`  
