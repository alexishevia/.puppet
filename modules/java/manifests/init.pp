# ==== Class: java
#
# This class installs Oracle's Java from a given repository. The
# given repository is added to the Apt sources and the JAVA_HOME environment
# variable is set for the default profile. By default the package provided
# by the webupd8.com team is used. 
# See: http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html 
# for details
#
# === Parameters
#
# Document parameters here.
#
# [*location*] Apt repository location providing the java packages.
# [*package*] Package name for the to be installed java package.
# [*release*] The release version of the operating system.
# [*repos*] The repository providing the package (main, nightly, etc).
# [*key*] The GPG key for the repository.
# [*key_server*] The GPG key-server for the public key.
#
# === Variables
#
# === Examples
#
#  class { java:
#    location        => 'http://apt.your-company-repository.com/ubuntu/',
#    package         => 'sun-java6-jdk',
#    repository_name => 'your-company-repository',
#    release         => $::lsbdistcodename,
#    repos           => 'main',
#    key             => '1234567',
#    key_server      => 'keyserver.ubuntu.com',
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
class java (
    $location        = $java::params::location,
    $package         = $java::params::package,
    $repository_name = $java::params::repository_name,
    $release         = $java::params::release,
    $repos           = $java::params::repos,
    $key             = $java::params::key,
    $key_server      = $java::params::key_server,) inherits java::params {
    apt::source { $repository_name:
        location   => $location,
        release    => $release,
        repos      => $repos,
        key        => $key,
        key_server => $key_server,
    }

    package { $package:
        ensure  => held,
        require => [Apt::Source[$repository_name], Exec['accepted-oracle-license-v1-1']]
    }

    exec { 'accepted-oracle-license-v1-1':
        command => "/bin/echo ${java::params::package} shared/accepted-oracle-license-v1-1 select true | /usr/bin/sudo /usr/bin/debconf-set-selections",
        unless  => "/usr/bin/debconf-show ${java::params::package} | grep 'shared/accepted-oracle-license-v1-1: true'",
    }

    profile_d::script { 'JAVA_HOME.sh':
        ensure  => present,
        content => 'export JAVA_HOME=/usr/lib/jvm/java-6-sun/',
    }
}
