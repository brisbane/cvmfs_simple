class cvmfs_simple::extra( $repo = ['gridpp', 'oxford'] )   {
 cvmfs_simple::extra::add_extra_repo { $repo: } 
 define cvmfs_simple::extra::add_extra_repo ( $reponame = $title) {
    include "cvmfs_simple::$reponame"
 }
}
