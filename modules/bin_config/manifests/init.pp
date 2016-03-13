class bin_config {

  file { "/home/$id/bin/tmux_ave":
    owner => "$id",
    group => "$id",
    mode => "755",
    source => "puppet:///modules/bin_config/tmux_ave",
  }

}
