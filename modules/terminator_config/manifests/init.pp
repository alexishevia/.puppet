class terminator_config {
  file { "/home/$id/.config/terminator":
    ensure => "directory",
  }

  file { "/home/$id/.config/terminator/config":
    owner => "$id",
    group => "$id",
    mode => 755,
    source => "puppet:///modules/terminator_config/terminator_config",
  }
}
