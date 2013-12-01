node 'frontend01.cluster.domain'{
# Include the rules that aare common to all cluster nodes
	include cluster_firewall
	# Configure Masqurading
	firewall { '05 Masquerade':
		table => 'nat',
		chain => 'POSTROUTING',
		jump => 'MASQUERADE',
		outiface => 'eth0',
		proto => 'all',
	}
	# Configure Forwarding
	firewall { '06 Reverse Forwarding':
		table => 'filter',
		chain => 'FORWARD',
		outiface => 'eth1',
		iniface => 'eth0',
		action => 'accept',
		state => ['ESTABLISHED','RELATED'],
		proto => 'all',
	}
	firewall { '07 Forwarding':
		table => 'filter',
		chain => 'FORWARD',
		outiface => 'eth0',
		iniface => 'eth1',
		action => 'accept',
		proto => 'all',
	}
	# Open the TCP port for DNS server
	firewall {'53 DNS TCP':
		port => '53',
		proto => 'tcp',
		action => 'accept',
	}
	# Open the UDP port for DNS server
	firewall {'53 DNS UDP':
		port => '53',
		proto => 'udp',
		action => 'accept',
	}
	# Open the ports for DHCP and TFTP servers
	firewall {'67 and 68 and 69 DHCP and TFTP UDP':
		port => ['67','68','69',],
		proto => 'udp',
		action => 'accept',
	}
	# Open the port for the NFS server
	firewall {'2049 NFS server':
		port => '2049',
		proto => 'tcp',
		action => 'accept',
	}
	# Open the port for the puppet master server
	firewall {'8140 open puppet master server':
		port => '8140',
		proto => 'tcp',
		action => 'accept',
	}
}
node /^node\d+.cluster.domain$/ {
	class {'cluster_software':}
	class {'cluster_users':}
}
