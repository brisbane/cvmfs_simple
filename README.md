# cvmfs_simple

#### Table of Contents

1. [Overview](#overview)
3. [Setup ](#setup)
4. [Usage ](#usage)
5. [Limitations ](#limitations)
6. [Development ](#development)

## Overview

Module for CVMFS client setup. It is trimmed down version of CERN CVMFS modeule

## Setup
 
include cvmfs_simple

It will setup cvmfs for LHC VOs repo and GridPP repo. Requires name of squid server by setting $cvmfs_http_proxy through hiera. 

it is possible to add local cvmfs by passing name of extra repo through hiera. Oxford.pp can be used as template. Extra repo can be passed like this
cvmfs_simple::extra::add_extra_repo: ['gridpp', 'oxford']    


## Limitation

## Development
 
Please feel free to add

