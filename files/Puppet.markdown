# Puppet
Puppet is a configuration management tool that is extreamly useful. It ensures that the admin just needs to manage a single resource instead of all the nodes in the cluster. It ensures that software is consistantly installed, configured, and properly started on all systems.

## Installation

The puppet version in almost every repo is way to outdated. Puppet 2.7 or better is /higly/ recommended by this guide. Thankfully Puppet Labs provides a really good resource.  

Check the Puppet Labs yum repo for the latest version. Look for the 'puppetlabs-release' rpm for the [highest release](https://yum.puppetlabs.com/el/6/products/x86_64/).

>`$ sudo yum install https://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-6.noarch.rpm`  

Once that is installed, we can now install puppet.

>`$ sudo yum install puppet`  
