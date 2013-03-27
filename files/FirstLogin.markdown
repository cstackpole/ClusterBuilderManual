After logging in to the system as your administrator user there are a few tweaks that need to be done.  
# Sudo
We will want to give the user access to the sudoers file for any root level commands we need to run. Open a terminal Applications -> System Tools -> Terminal and get a root shell to run visudo.  

` su -`  
`$ visudo`  

If you are not familiar with vi, then follow the instructions exactly. If you every get into the position where things are not working as you expect, then hit the 'Escape Key' several times then type ':q!' to close the file without making any changes so that you can start over and try again.  
Use the arrow keys to move the cursor to the bottom of the file. Then press the 'o' key. It will move the cursor to a new line and allow editing. Type the following line but replace USERNAMEHERE with your username.  

`USERNAMEHERE ALL=(ALL) ALL`  

Then press the "Escape Key" and type ':wq!' to save and close.  

# EPEL  
The Extra Packages project for Enterprise Linux is an incredibly useful repository to use, so install access to the repository and update the system. Don't be surprised if there are a few updates to packages like icewm.  
`$ sudo yum install epel-release`  
`$ sudo yum clean all && sudo yum update`  

# Yum
Fix the yum config files if you have a local repository. If you do not, then skip this step.  
`$ cd /etc/yum.repos.d/  
`$ sudo vi sl.conf`  
Now replace the baseurl with the information of your server as defined from the [repository building stage](BuildARepo.html). Do this for both the sl.repo, sl-other.repo, and epel.repo. Verify the repos are working.  
`$ sudo yum clean all && sudo yum update`  

Return to the [main page](StartHere.html).  
