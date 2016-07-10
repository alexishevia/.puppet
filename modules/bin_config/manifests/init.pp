class bin_config {

  $executables = [
    'tmux_hotlist',
    'tmux_skyroam',
    'sp',
  ]

  file { "/home/$id/bin":
    owner => "$id",
    group => "$id",
    mode => "755",
    ensure => directory,
  }

  each($executables) |$file| {

    file { "/home/$id/bin/$file":
      owner => "$id",
      group => "$id",
      mode => "755",
      source => "puppet:///modules/bin_config/$file",
      require => File["/home/$id/bin"],
    }

  }

  file { "/home/$id/bin/todo.txt_cli":
    owner => "$id",
    group => "$id",
    mode => "755",
    ensure => directory,
    recurse => true,
    source => "puppet:///modules/bin_config/todo.txt_cli",
    require => File["/home/$id/bin"],
  }

}
