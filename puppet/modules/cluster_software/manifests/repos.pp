class cluster_software::repos(){
	yumrepo{ 'EPEL':
		name => 'EPEL',
		descr => 'Extra Packages for Enterprise Linux 6 - $basearch',
		baseurl => 'http://httpd.cluster.domain/epel/6/$basearch',
		enabled => '1',
		gpgcheck => '1',
		gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
	}
	yumrepo{ 'PuppetProduct':
		name => "PuppetProducts",
		descr => 'Puppet Labs Products El 6 - $basearch',
		baseurl => 'http://yum.puppetlabs.com/el/6/products/$basearch',
		enabled => '1',
		gpgcheck => '1',
		gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs'
	}
	yumrepo{ 'PuppetDeps':
		name => 'PuppetDeps',
		descr => 'Puppet Labs Dependencies El 6 - $basearch',
		baseurl => 'http://yum.puppetlabs.com/el/6/dependencies/$basearch',
		enabled => '1',
		gpgcheck => '1',
		gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
	}
	yumrepo{ 'SL':
		name => 'SL',
		descr => 'Scientific Linux $releasever - $basearch',
		baseurl => 'http://httpd.cluster.domain/scientificlinux/$releasever/$basearch/os/',
		enabled => '1',
		gpgcheck => '1',
		gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-sl file:///etc/pki/rpm-gpg/RPM-GPG-KEY-sl6 file:///etc/pki/rpm-gpg/RPM-GPG-KEY-cern',
	}
	yumrepo{ 'SL-Security':
		name => 'SLSecurity',
		descr => 'Scientific Linux $releasever - $basearch - security updates',
		baseurl => 'http://httpd.cluster.domain/scientificlinux/$releasever/$basearch/updates/security/',
		enabled => '1',
		gpgcheck => '1',
		gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-sl file:///etc/pki/rpm-gpg/RPM-GPG-KEY-sl6 file:///etc/pki/rpm-gpg/RPM-GPG-KEY-cern',
	}
	yumrepo{ 'SL-Fastbugs':
		name => 'SLFastbugs',
		descr => 'Scientific Linux $releasever - $basearch - fastbug updates',
		baseurl => 'http://httpd.cluster.domain/scientificlinux/$releasever/$basearch/updates/fastbugs/',
		enabled => '1',
		gpgcheck => '1',
		gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-sl file:///etc/pki/rpm-gpg/RPM-GPG-KEY-sl6 file:///etc/pki/rpm-gpg/RPM-GPG-KEY-cern',
	}
}
