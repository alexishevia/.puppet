class bash_config {

  file { "/home/$id/.bashrc":
    owner => "$id",
    group => "$id",
    mode => "644",
    source => "puppet:///modules/bash_config/.bashrc",
  }

  file { "/home/$id/.bash_profile":
    owner => "$id",
    group => "$id",
    mode => "644",
    source => "puppet:///modules/bash_config/.bash_profile",
  }

  file { ["/home/$id/.profile", "/home/$id/.mkshrc",
          "/home/$id/.zshrc", "/home/$id/.zlogin"]:
    ensure => "absent"
  }

}
