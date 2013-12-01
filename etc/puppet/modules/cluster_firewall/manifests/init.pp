class cluster_firewall () {
	resources { "firewall": purge=>true}
	Firewall {
		before => Class['cluster_firewall::post'],
		require=> Class['cluster_firewall::pre'],
	}
	# Open SSH on all the nodes
	firewall { '22 open ssh':
		port => '22',
		proto => 'tcp',
		action => 'accept',
	}
	include cluster_firewall::pre
	include cluster_firewall::post
}
