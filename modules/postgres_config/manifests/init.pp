class postgres_config {

  file { "/home/$id/.psqlrc":
    owner => "$id",
    group => "$id",
    mode => 644,
    source => "puppet:///modules/postgres_config/.psqlrc",
  }

}
