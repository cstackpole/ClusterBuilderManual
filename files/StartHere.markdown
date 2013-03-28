# Why build a cluster?
This is a very broad subject. Some need computational power for research, for business, to learn parallel coding, to learn administration, or just for fun. I enjoy building clusters for fun, research, and for profit. This instructional guide will walk one through the process of building a cluster from the ground up, including the basics of administration and managemnet. I am in the process of expanding the notes to cover a variety of possibilities and configurations.
# Pre-build process
## Cluster design.
How you build a cluster can vary wildly depending on how much money you are willing to invest. This guide is going to take the assumption of a smaller cluster on a standard Gigabit network.

The frontend should have at least an 80GB hard drive, but the more room you have for your /home partition the better. As your users will be logging into the frontend to compile, launch jobs, and do work then you really should have several GB of memory and multiple cores. A section on creating a Login Node for users will come later. The frontend should also have two network cards. The first will have access to the public network or the internet while the second will have access to the private network that is reserved specifically for the nodes.

The compute nodes should be as beefy as possible. The type of nodes completely depends on the type of work. Large data set jobs may require more memory then processing power while rendering jobs may require more GPUs then anything else. If you are just doing this for the education then whatever you have works. My first personal cluster had ancient hardware because I could only afford 100$ for 5 compute nodes. My current personal playground setup consists of clearance-sale refurb boxes from Newegg; they cost me very little and are surprisingly powerful. When building a cluster for a job, tailoring the compute nodes to the job is very important but completely dependant on the job type.

In the 'simple' setup, this guide will assume that you will be exporting your /home directory from the frontend via NFS. This is not the only option that you have. It is not uncommon to have a SAN or NAS on which /home is stored. Some build their own while others buy one. This is more a more advanced topic outside the scope of this guide at this time.

## Build a repo.
If you are building a cluster of any significant size then you will be grabbing the same pacakges many times. This can be very time consuming for you over a slow internet connection and very load intensive on a community repository. In these situations it is often very useful having a local repository from which you can pull your packages from. Here is one way of building a [local repository](BuildARepo.html) (still a work in progress).

# Building a cluster.
## Operating system.
Start with the installation of the [frontend](FrontendInstallation.html).

## Configuring software on the frontend 
[First login](FirstLogin.html) to configure the new installation.

Configure [NFS](ConfigureNFS.html) for /home.

Configure a [DHCP/TFTP](DNSmasq.html) server. (still work in progress)  

Configure local repo '(coming soon)'

## Kickstarting the nodes
Kickstart '(coming soon)'

# Resource Management
Hardware resource manager [Torque](Torque.html) '(coming soon)'  
User resource manager Maui '(coming soon)'

-or-

Open Grid Scheduler '(coming soon)'

# Parallel Computing
[OpenMPI](OpenMPI.html)

# Testing and benchmarking the cluster

[Cbench](Cbench.html)  


# Administration of the cluster

[Puppet](Puppet.html) '(coming soon)'

Modules '(coming soon)'
## Configuring users
Add users and push their logins to the nodes

Add a development user for creating packages for the cluster

# Helpful Links
[Helpful Links](HelpfulLinks.html)


[Creative Commons Attribution-ShareAlike CC BY-SA license](http://creativecommons.org/licenses/by-sa/3.0/legalcode)
