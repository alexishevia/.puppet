class dconf_config {
  $dconfFolder = "/home/$id/.puppet_dconf_config"

  # create a folder to hold config files
  file { "$dconfFolder":
    owner => "$id",
    group => "$id",
    mode => 755,
    ensure => directory
  }

  # copy config files to folder
  file { "$dconfFolder/input-sources":
    owner => "$id",
    group => "$id",
    mode => 754,
    source => "puppet:///modules/dconf_config/input-sources",
  }

  # run dconf load from file
  exec { 'dconfLoad':
    command => "/usr/bin/dconf load /org/gnome/desktop/input-sources/ < $dconfFolder/input-sources",
    require => [
      File["$dconfFolder/input-sources"],
    ],
  }

}
