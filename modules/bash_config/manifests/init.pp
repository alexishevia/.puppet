class bash_config {

  file { "/home/$id/.bashrc":
    owner => "$id",
    group => "$id",
    mode => "644",
    source => "puppet:///modules/bash_config/.bashrc",
  }

  file { ["/home/$id/.profile", "/home/$id/.bash_profile",
          "/home/$id/.mkshrc", "/home/$id/.zshrc", "/home/$id/.zlogin"]:
    ensure => "absent"
  }

}
