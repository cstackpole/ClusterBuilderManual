These instructions are using Scientific Linux 6.3 as the base OS for this cluster. Why? Well Red Hat Enterprise Linux is ridiculously stable and widely regarded as a good OS for enterprise and big computing. So why not Red Hat Enterprise Linux? Well, because I can't afford it for home use. Professionally I do have uses for RHEL and the nice thing about these build instructions is that they interact with RHEL so closely that switching OS's is easy. So why not CentOS? Again, the instructions are close enough that you can follow along easily. I just like Scientific Linux.

1. Turn on a box and insert the Scientific Linux 6 CD or USB stick.  
* Select 'Install or upgrade an existing system'  
![FirstScreen](images/Frontend_FirstScreen.png)  
* Feel free to skip the media test but if you have any problems, this is usually a good place to start looking.  
![DiscFound](images/Frontend_DiscFound.png)  
* Select Next  
![SplashScreen](images/Frontend_SplashScreen.png)  
* Select your appropriate language and keyboard.  
![LanguageScreen](images/Frontend_LanguageScreen.png)  
![KeyboardScreen](images/Frontend_KeyboardScreen.png)  
* Select basic storage devices unless you know specifically that you need to do something specific.  
![BasicGraphicScreen](images/Frontend_BasicGraphicScreen.png)  
* Enter a hostname.  
![HostScreen](images/Frontend_HostScreen.png)  
* Select 'Configure Network'.  
* Select 'System eth0' and click edit.  
![Network1Screen](images/Frontend_Network1Screen.png)  
* In the 'IPv4 Settings' tab select manual unless you know your network supports DHCP.  
![Network2Screen](images/Frontend_Network2Screen.png)  
* If you are using a manual configuration then click add and enter your Address, Netmask, Gateway, and DNS servers.  
![Network3Screen](images/Frontend_Network3Screen.png)  
* Make sure the IPv4 checkbox is required.  
* If everything looks good, hit apply.  
* Click 'Close' to exit out of 'Network Connections' and 'Next' to move on.  
* Now find your timezone and click next.  
![TimeZoneScreen](images/Frontend_TimeZoneScreen.png)  
* Create a root password.  
![PasswdScreen](images/Frontend_PasswordScreen.png)  
* Select a 'Create Custom Layout' and click 'Next'.  
![DiskSpaceScreen](images/Frontend_DiskSpaceScreen.png)  
* Delete all the partitions on the box.  
![DiskPartitionScreen](images/Frontend_DiskPartitionScreen.png)  
* Select the disk and click 'Create' so that we can make a new partitions.  
![DiskDeviceScreen](images/Frontend_DiskDeviceScreen.png)  
* Select standard partition and create.  
![CreateStorageScreen](images/Frontend_CreateStorageScreen.png)  
* Select the root mount point.  
![RootPartition1](images/Frontend_RootPartition1.png)  
* We are going to use EXT4 File System Type for /, /home, and /tmp partitions.  
* Enter the size of the partition. If possible reserve 20-50GB for /, 4GB for swap, and 10-25GB for /tmp. If this is a training/educational build then 15GB is plenty for / but if this is going to be used for any kind of research more should be allocated. Select 'Fixed size' and 'Force to be a primary partition' before selecting 'OK'. Just be aware that you can only have 4 primary partitions.  
![RootPartition2](images/Frontend_RootPartition2.png)  
![SwapPartition](images/Frontend_SwapPartition.png)  
On the /home partition allocate as much space as possible by selecting 'Fill to maximum allowable size'. Some choose to even have a seperate disk for /home, a RAID of many disks, or even a big SAN. It all depends on your needs.  
![HomePartition](images/Frontend_HomePartition.png)  
* Repeat steps 19-23 until all partitions are created. After the partitions are created click 'Next'.  
* A warning will pop up asking if you really want to format the partitions. Select OK.  
![FormatWarning](images/Frontend_FormatWarning.png)  
* Another warning will appear asking if you want to 'Write storage configuration to disk', select OK.  
![WriteChangesToDisk](images/Frontend_WriteChangesToDisk.png)  
* Make sure the bootloader is installed. I highly recommend adding a boot loader for extra security. This will help prevent an attacker from changing the boot parameters and gaining access to the frontend through the GRUB boot loader.  
![BootLoader](images/Frontend_BootLoader.png)  
* Select 'Minimal Desktop'. If you have a lot of Linux experience selecting 'Minimal Install' is what I prefer. However, having access to a basic GUI can come in handy every once in a while.  
![MinimalDesktop](images/Frontend_MinimalDesktop.png)  
* If you have a local repository, then modify the repositories to use them. If you are building this cluster for fun and learning, then just use the offical repository. If have a LOT of nodes or are planning to do this frequently, then please consider hosting a local repository. First it shifts the load from the main community servers to local servers and second it will be much faster for your installs. See the [main page](StartHere.html) for building a repo. Enable the repositories for the main repo, fastbugs, and security so that you get the latest patches now instead of having to update the cluster later. The repos you want are below but if you are not using a 64bit OS, then change 'x86\_64' to i386:  
Main OS: 'http://ftp1.scientificlinux.org/linux/scientific/6.3/x86\_64/os/'  
Fastbugs: 'http://ftp1.scientificlinux.org/linux/scientific/6.3/x86\_64/updates/fastbugs/'  
Security: 'http://ftp1.scientificlinux.org/linux/scientific/6.3/x86\_64/updates/security/'  
* Select 'Customize Now' and 'Next'.  
![CustomizeNow](images/Frontend_CustomizeNow.png)  
* Click 'Desktop' on the left, then 'Graphical Administration Tools', and click 'Optional packages'. This will open a new window.  
![GraphicalAdminTools](images/Frontend_GraphicalAdminTools.png)  
* The installation of the Graphical SELinux tools is very useful for beginners. SELinux helps protect a Linux box from attacks. When you have a bunch of users compiling software on your cluster, it opens your system up to a lot of potential problems. SELinux is a must. The other package we want to install is a graphical kickstart utility. The packages we want to install are policycoreutils-gui and system-config-kickstart. Click 'Close' and then 'Next'.  
![PackagesInGraphicalAdminTools](images/Frontend_PackagesInGraphicalAdminTools.png)  
* The install will now begin.  
![InstallScreen](images/Frontend_InstallScreen.png)  
* When the install is done, reboot.  
![RebootScreen](images/Frontend_RebootScreen.png)  
* The first boot option will present a screen if you installed a GUI. Click 'Forward'.  
![Forward](images/Frontend_Forward.png)  
* Create a user. This user will be used as the non-root admin for compiling packages and administering the cluster. Click 'Forward'.  
![CreateUser](images/Frontend_CreateUser.png)  
* Point your system to a NTP server. If you don't have one, just use the defaults. Time is important.  
![DateAndTime](images/Frontend_DateAndTime.png)  
* Chances are you will get a error about KDump. Whether you do or don't, disable and ignore.  
![Kdump1](images/Frontend_Kdump1.png)  
![Kdump2](images/Frontend_Kdump2.png)  
* You may need to reboot again. At the screen, log in as the user you just created.  
![LoginScreen](images/Frontend_LoginScreen.png)  
Now continue with the setup on the [main page](StartHere.html).
