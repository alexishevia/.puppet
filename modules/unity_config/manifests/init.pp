
class unity_config {
  $moduleFolder = "/home/$id/.puppet_unity_config"

  # Create a folder to hold all module files
  file { "$moduleFolder":
    owner => "$id",
    group => "$id",
    mode => 755,
    ensure => directory
  }

  # Copy my expected unity configuration
  file { "$moduleFolder/dconf_unity.dat":
    owner => "$id",
    group => "$id",
    mode => 754,
    source => "puppet:///modules/unity_config/dconf_unity.dat",
  }

  # Import my unity configuration
  exec { "importUnityConfig":
    command => "/usr/bin/dconf load /desktop/unity/ < $moduleFolder/dconf_unity.dat",
    require => File["$moduleFolder/dconf_unity.dat"],
  }

}
