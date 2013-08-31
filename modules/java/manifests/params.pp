# == Class: java::params
#
# This class manages parameters for the java Puppet class in this module.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { java::params
#  }
#
# === Authors
#
# Sander Bilo <sander@proteon.nl>
#
# === Copyright
#
# Copyright 2013 Proteon.
#
class java::params {
    $home = '/usr/lib/jvm/default-java'
    $location = 'http://ppa.launchpad.net/webupd8team/java/ubuntu'
    $package = ['oracle-java6-installer','oracle-java6-set-default']
    $repository_name = 'webupd8team'
    $release = $::lsbdistcodename
    $repos = 'main'
    $key = 'EEA14886'
    $key_server = 'keyserver.ubuntu.com'
}
