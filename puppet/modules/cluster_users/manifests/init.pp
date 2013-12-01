class cluster_users(){
	mount {'home':
		name => '/home',
		ensure => "mounted",
		atboot => "true",
		fstype => "nfs",
		options => "defaults",
		device => "10.10.10.10:/home",
	}
	user {'stack':
		name => "user1",
		uid => '500',
		#gid => '500',
		ensure => "present",
		managehome => "true",
		#This is a garbltygook password for example purposes. It is a mix of 3 different passwords so if it actually has a valid password then I have no idea what it is. :-D
		password => '$6$G12Qm281$n2hc3Hlg4azpKqu987jDhShGNrLnEp97FsmCgnHatxiJlJkBcDD35Zh5ZS5Vji1sA3gP.9JkPUOIoFk4CrzBr/',
		require => Mount["home"],
	}
}
