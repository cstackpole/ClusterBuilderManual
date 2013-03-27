# Installation
NFS should have been installed during the installation. If for some reason it wasn't, install the needed packages.  
`$ sudo yum install nfs-utils`.  
# Configure mounting /home
In order for the users to have access to their files during a job run, it is important for the compute nodes to access the files in the home directory. This guide accomplishes this by mounting the home directory over nfs. In the example network configuration, the private side network for the nodes is 10.10.10.1 and we are allowing access to the full network range granting both read write access. It is a bit broad and can be locked down more if needed, but those steps are more advanced than this guide goes into. After adding the line to the exports file, restart the NFS service.  
`$ echo '/home 10.10.10.1/24(rw)' | sudo tee /etc/exports`  
`sudo service nfs restart`  

# Open ports in the firewall
Now make sure NFS works through the firewall.  
`sudo system-config-firewall-tui`  
On the first menu select the 'Customize' button by using the arrow keys on the keyboard. On the next screen, use the down arrow key to find the 'NFS4' option and make the selection. Then click 'Close', 'OK', then 'Yes'.  

# Turn on the NFS server to start at boot.
Ensure that NFS starts when the frontend starts.  
`$ sudo /sbin/chkconfig nfs on`  

Once NFS is running, continue on with the installation on the [main page](StartHere.html).  

