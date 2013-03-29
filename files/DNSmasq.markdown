TODO on this page: Run through the testing. Add better explinations for options

# DHCP/DNS/TFTP server
## Why DNSmasq
When there are many nodes in the cluster, installing, and managing the network infrastructure is way too much overhead for anyone to manage. Installing DNSmasq works really well for managing a TFTP boot process for automatic installations and also takes care of managing the details of IPs and name resolutions. It is very convienent, simple, and I have found that it scales well at least up to over 400 compute nodes.  

## Install DNSmasq and syslinux

>`sudo yum install dnsmasq syslinux-tftpboot`  

## Configure DNSmasq
The DNSMasq configuration file is usually stored in /etc/dnsmasq.conf. It is worth the read as it is documented rather well. Once you know what options you need you can trim the file down. This is the configuration file that this guide recommends.

>`$ sudo vi /etc/dnsmasq.conf`  
>`domain-needed`  
>`bogus-priv`  
>`no-resolv`  
>`local=/localnet/`  
>`local=/cluster.domain/`  
>`interface=eth1`  
>`except-interface=eth0`  
>`listen-address=10.10.10.10`  
>`bind-interfaces`  
>`domain=cluster.domain`  
>`dhcp-host=90:E2:BA:2C:B9:54,node01.cluster.domain,10.10.10.101`  
>`dhcp-host=90:E2:BA:2C:B9:B0,node02.cluster.domain,10.10.10.102`  
>`dhcp-host=90:E2:BA:2C:BF:D0,node03.cluster.domain,10.10.10.103`  
>`dhcp-host=90:E2:BA:2C:B9:A0,node04.cluster.domain,10.10.10.104`  
>``  
>`pxe-prompt="Press F8 for menu.", 10`  
>`pxe-service=x86PC, "Boot from local disk", 0`  
>`pxe-service=x86PC, "Show install options.", pxelinux`  
>`
>`enable-tftp`  
>`tftp-root=/var/lib/tftpboot`  

## Configure TFTP

>`$ sudo mkdir -p /var/lib/tftpboot/sl/63/x86_64`

or 

>`$ sudo mkdir -p /var/lib/tftpboot/sl/63/i386`

Now to pull the needed files for pxebooting. These files can also be found on the installation disk, but I find it easier to pull from the repository.

>`$ sudo wget http://ftp1.scientificlinux.org/linux/scientific/6.3/x86_64/os/isolinux/vmlinuz -O /var/lib/tftpboot/sl/63/x86_64/vmlinuz`  
>`$ sudo wget http://ftp1.scientificlinux.org/linux/scientific/6.3/x86_64/os/isolinux/initrd.img -O /var/lib/tftpboot/sl/63/x86_64/initrd.img`  

or

>`$ sudo wget http://ftp1.scientificlinux.org/linux/scientific/6.3/i386/os/isolinux/vmlinuz -O /var/lib/tftpboot/sl/63/i386/vmlinuz`  
>`$ sudo wget http://ftp1.scientificlinux.org/linux/scientific/6.3/i386/os/isolinux/initrd.img -O /var/lib/tftpboot/sl/63/i386/initrd.img`  


