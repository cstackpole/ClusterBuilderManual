# OpenMPI
In order to run parallel jobs across the cluster there needs to be a MPI library installed. The version of openmpi in the yum repositories do not link against the Torque library properly so a rebuild will be required. You can find the latest version of OpenMPI at the [main website](http://www.open-mpi.org/) in the downloads section. This guide is working against version 1.6.4.

## Building from source
It is easiest to download and use the provided source RPM.

>`$ wget http://www.open-mpi.org/software/ompi/v1.6/downloads/openmpi-1.6.4-1.src.rpm`
