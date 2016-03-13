class tmux_config {

  file { "/home/$id/.tmux.conf":
    owner => "$id",
    group => "$id",
    mode => "644",
    source => "puppet:///modules/tmux_config/.tmux.conf",
  }

}
