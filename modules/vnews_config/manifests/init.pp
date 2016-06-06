class vnews_config {

  file { "/home/$id/.vnewsrc":
    owner => "$id",
    group => "$id",
    mode => "755",
    ensure => directory,
    recurse => true,
    source => "puppet:///modules/vnews_config/.vnewsrc",
  }

}
