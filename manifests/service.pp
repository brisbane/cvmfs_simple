class cvmfs_simple::service {
if ! defined(Service['autofs']) {

@service { autofs :
     ensure     => running,
               hasstatus  => true,
               hasrestart => true,
               enable     => true,
#               require    => [Package['autofs']],
               name => 'autofs'

}

realize Service['autofs']

}


}
