class rbenv_config {

  file { "/home/$id/.rbenv":
    owner => "$id",
    group => "$id",
    mode => "755",
    ensure => directory,
    recurse => true,
    source => "puppet:///modules/rbenv_config/rbenv",
    ignore => "versions"
  }

  file { "/home/$id/.rbenv/plugins":
    owner => "$id",
    group => "$id",
    mode => "755",
    ensure => directory,
    recurse => true,
    source => "puppet:///modules/rbenv_config/plugins",
  }

}
