class bin_config {

  $executables = [
    'tmux_clients',
    'tmux_knowledge',
    'tmux_fox',
    'tmux_faru',
    'hotlist',
    'install_global_packages',
    'fresh-chrome',
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

  $directories = [
    'robomongo-0.9.0',
  ]

  each($directories) |$dir| {

    file { "/home/$id/bin/$dir":
      owner => "$id",
      group => "$id",
      mode => "755",
      ensure => directory,
      recurse => true,
      source => "puppet:///modules/bin_config/$dir",
      require => File["/home/$id/bin"],
    }

  }

}
