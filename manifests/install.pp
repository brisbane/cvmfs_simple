class cvmfs_simple::install (
   $cvmfs_version = 'latest', ) 
   {
     $package_list = ['cvmfs', 'cvmfs-config-default']
     package { $package_list :
       ensure => $cvmfs_version, 
#       creates =>     ['/etc/cvmfs/keys', '/etc/cvmfs/domain.d'],
   } 


}
