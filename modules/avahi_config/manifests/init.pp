class avahi_config {

  file { "/etc/avahi/avahi-daemon.conf":
    owner => "root",
    group => "root",
    mode => 644,
    source => "puppet:///modules/avahi_config/avahi-daemon.conf",
  }

}
