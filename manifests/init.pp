# == Class: cvmfs_simple
#
# Full description of class cvmfs_simple here.
#
# === Parameters
#
# Document parameters here.
# Parameters are supposed to pass directly to sub-class through hiera. Defaults are provided for all parameters. 
# $cvmfs_http_proxy should be changed to site squid server. 

# ===List of all variables with default value which can be overwritten from hiera
#     cvmfs_simple::repo::cvmfs_yum: 'http://cern.ch/cvmrepo/yum/cvmfs/EL/${::operatingsystemmajrelease}/${::architecture}'
#     cvmfs_simple::repo::cvmfs_yum_testing: 'http://cern.ch/cvmrepo/yum/cvmfs-testing/EL/${::operatingsystemmajrelease}/${::architecture}'
#     cvmfs_simple::repo::cvmfs_yum_testing_enabled: 'false'
#     cvmfs_simple::install::cvmfs_version: 'latest'
#     cvmfs_simple::config::lenspath: '/var/lib/puppet/lib/augeas/lenses'
#     cvmfs_simple::config::cvmfs_quota_limit: '20000'
#     cvmfs_simple::config::cvmfs_http_proxy: 'http://mysquidserver.example.com'
#     cvmfs_simple::config::cvmfs_cache_base: '/var/cache/cvmfs2'
#     cvmfs_simple::extra::repo: ['gridpp']
#
# 
# 
#
# === Examples
#
#  class { 'cvmfs_simple':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class cvmfs_simple {
class { '::cvmfs_simple::repo':} ->
class { '::cvmfs_simple::install':} ->
class { '::cvmfs_simple::extra':} ->
class { '::cvmfs_simple::config':} ~>
class { '::cvmfs_simple::service':}

}
