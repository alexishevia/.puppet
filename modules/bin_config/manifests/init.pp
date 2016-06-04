class bin_config {

  file { "/home/$id/bin/tmux_skyroam":
    owner => "$id",
    group => "$id",
    mode => "755",
    source => "puppet:///modules/bin_config/tmux_skyroam",
  }

  file { "/home/$id/bin/sp":
    owner => "$id",
    group => "$id",
    mode => "755",
    source => "puppet:///modules/bin_config/sp",
  }

}
