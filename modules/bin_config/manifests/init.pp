class bin_config {

  $executables = [
    'tmux_hotlist',
    'tmux_skyroam',
    'sp',
  ]

  each($executables) |$file| {

    file { "/home/$id/bin/$file":
      owner => "$id",
      group => "$id",
      mode => "755",
      source => "puppet:///modules/bin_config/$file",
    }

  }

}
