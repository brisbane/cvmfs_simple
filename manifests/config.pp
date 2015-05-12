class cvmfs_simple::config (
  $lenspath = '/var/lib/puppet/lib/augeas/lenses',
  $cvmfs_quota_limit = '20000',
  $cvmfs_http_proxy  = 'http://mysquidserver.example.com',
  $cvmfs_cache_base  = '/var/cache/cvmfs2',
  $cms_local_site    = 'site_name',
  ){
  
  
 file {'/etc/cvmfs/config.d/cms.cern.ch.local':
    ensure => present,
    content => "export CMS_LOCAL_SITE=/cvmfs/cms.cern.ch/SITECONF/${cms_local_site}",
    owner => 'root',
    group => 'root',
    mode => '0644',
    require => Package['cvmfs-config-default'],
    } 
 
  file {'/etc/fuse.conf':
    ensure => present,
    content => "#Installed with puppet cvmfs::config\nuser_allow_other\n",
    owner => 'root',
    group => 'root',
    mode => '0644',
    }


 augeas{'cvmfs_automaster':
    context => '/files/etc/auto.master/',
    lens => 'Automaster.lns',
    incl => '/etc/auto.master',
    load_path => $lenspath,
    changes => [
    'set 01 /cvmfs',
    'set 01/type program',
    'set 01/map /etc/auto.cvmfs'
    ],
    onlyif => 'match *[map="/etc/auto.cvmfs"] size == 0',
#    notify => Service['autofs']
    }
  
  file { '/etc/cvmfs/default.local':
    content => template("${module_name}/default_local.erb"),
    owner => 'root',
    group => 'root',
    mode => '0644',

  }  

}
