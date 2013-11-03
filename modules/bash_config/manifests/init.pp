class bash_config {

  file { "/home/$id/.bashrc":
    owner => "$id",
    group => "$id",
    mode => 644,
    source => "puppet:///modules/bash_config/.bashrc",
  }

}
