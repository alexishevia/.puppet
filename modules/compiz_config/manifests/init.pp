class compiz_config {
  $compizFolder = "/home/$id/.puppet_compiz_config"

  # Create a folder to hold all module files
  file { "$compizFolder":
    owner => "$id",
    group => "$id",
    mode => 755,
    ensure => directory
  }

  # Copy export script
  file { "$compizFolder/exportCompizProfile.py":
    owner => "$id",
    group => "$id",
    mode => 755,
    source => "puppet:///modules/compiz_config/exportCompizProfile.py",
  }

  # Copy import script
  file { "$compizFolder/importCompizProfile.py":
    owner => "$id",
    group => "$id",
    mode => 755,
    source => "puppet:///modules/compiz_config/importCompizProfile.py",
  }

  # Copy my expected compiz profile
  file { "$compizFolder/compiz.profile":
    owner => "$id",
    group => "$id",
    mode => 754,
    source => "puppet:///modules/compiz_config/compiz.profile",
  }

  # Export current compiz profile
  exec { "exportCompizProfile":
    command => "/usr/bin/python $compizFolder/exportCompizProfile.py $compizFolder/compiz.profile.bkp",
    require => File["$compizFolder/exportCompizProfile.py"],
  }

  # Compare current and expected profiles. If they're different, import expected.
  exec { 'importCompizProfile':
    command => "/usr/bin/python $compizFolder/importCompizProfile.py $compizFolder/compiz.profile",
    unless => "/usr/bin/diff $compizFolder/compiz.profile.bkp $compizFolder/compiz.profile",
    require => [
      File["$compizFolder/compiz.profile"],
      Exec["exportCompizProfile"],
    ],
  }

}
