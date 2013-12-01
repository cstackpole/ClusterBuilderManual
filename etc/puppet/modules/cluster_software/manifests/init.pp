class cluster_software (){
	include cluster_software::repos
	package { ['vim-enhanced','htop',]: ensure => installed, require => Class['cluster_software::repos'],}
}
