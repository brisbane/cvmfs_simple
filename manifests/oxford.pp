class cvmfs_simple::oxford ($http_proxy = "UNDEF") {
  require cvmfs_simple::install

file {'/etc/cvmfs/keys/ox.ac.uk': 
    ensure => directory,
#    require   => [File['/etc/cvmfs/keys'] ]

}

file{'/etc/cvmfs/keys/ox.ac.uk/physics.ox.ac.uk.pub':
    ensure    => file,
    source    => 'puppet:///modules/cvmfs_simple/physics.ox.ac.uk.pub',
    replace   => false,
    owner     => root,
    group     => root,
    mode      => '0644',
    require   => [File['/etc/cvmfs/keys/ox.ac.uk'] ]
    }

file{'/etc/cvmfs/domain.d/ox.ac.uk.conf':
    ensure    => file,
    content  => template("${module_name}/ox.ac.uk.conf.erb"),
    owner     => root,
    group     => root,
    mode      => '0444'
    }
}
