class cvmfs_simple::repo (
    $cvmfs_yum                  = "http://cern.ch/cvmrepo/yum/cvmfs/EL/${::operatingsystemmajrelease}/${::architecture}",
    $cvmfs_yum_testing          = "http://cern.ch/cvmrepo/yum/cvmfs-testing/EL/${::operatingsystemmajrelease}/${::architecture}",
    $cvmfs_yum_testing_enabled  = false,  )
    { 
    
    yumrepo{'cvmfs':
      descr => "CVMFS yum repository for el${major}",
      baseurl => $cvmfs_yum,
      gpgcheck => 1,
      gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CernVM',
      enabled => 1,
      includepkgs => 'cvmfs,cvmfs-keys,cvmfs-server,cvmfs-config-default',
      priority => 80,
      require => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-CernVM'],
      }

    yumrepo{'cvmfs-testing':
      descr => "CVMFS yum testing repository for el${major}",
      baseurl => $cvmfs_yum_testing,
      gpgcheck => 1,
      gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CernVM',
      enabled => $cvmfs_yum_testing_enabled,
      priority => 80,
      require => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-CernVM'],
      }
# Copy out the gpg key once only ever.
    file{'/etc/pki/rpm-gpg/RPM-GPG-KEY-CernVM':
    ensure => file,
    source => 'puppet:///modules/cvmfs_simple/RPM-GPG-KEY-CernVM',
    replace => false,
    owner => root,
    group => root,
    mode => '0644'
     } 
 }   
