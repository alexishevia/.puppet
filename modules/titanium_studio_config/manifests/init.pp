class titanium_studio_config {

  file { "/home/$id/.local/share/applications/TitaniumStudio.desktop":
    owner => "$id",
    group => "$id",
    mode => 644,
    source => "puppet:///modules/titanium_studio_config/TitaniumStudio.desktop",
  }

}
