class profile_d {

  file {'/etc/profile.d':
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '0755',
  }

}
