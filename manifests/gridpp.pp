class cvmfs_simple::gridpp {
      require cvmfs_simple::install

file {'/etc/cvmfs/keys/gridpp.ac.uk': 
    ensure => directory,
     }

file{'/etc/cvmfs/keys/gridpp.ac.uk/gridpp.ac.uk.pub':
    ensure    => file,
    source    => 'puppet:///modules/cvmfs_simple/gridpp.ac.uk.pub',
    replace   => false,
    owner     => root,
    group     => root,
    mode      => '0644',
    require   => File['/etc/cvmfs/keys/gridpp.ac.uk']
    }

file{'/etc/cvmfs/domain.d/gridpp.ac.uk.conf':
    ensure    => file,
    source    => 'puppet:///modules/cvmfs_simple/gridpp.ac.uk.conf',
    owner     => root,
    group     => root,
    mode      => '0444'
    }
}
