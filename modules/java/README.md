puppet-java
===========

Puppet code for deploying and configuring Oracle Java on Debian-like servers. Uses the webupd8.com Java packages by default. 
See: http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html for details.

Depencendies:

    'puppetlabs/apt', '>=1.1.0'
    'klangrud/profile_d', '>=0.0.1'

Basic usage
-------------------------
To install Oracle Java JDK 1.6 and set JAVA_HOME

    include java

To install Oracle JAVA JDK 1.8

    class { 'java':
      package => 'oracle-java8-installer',
    }

To install from your own apt-repositories

    class { 'java':
      location        => 'http://apt.yourcompany.com',
      package 		  => 'oracle-java7-installer',
      repository_name => $java::params::repository_name,
      key             => 'EEAA1234,
      key_server      => 'gpg.yourcompany.com',
    }