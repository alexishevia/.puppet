class vagrant($version = "1.2.7") {

  if $::architecture == "amd64" or $::architecture == "x86_64" {
    $platid = "x86_64"
  } else {
    $platid = "i686"
  }

  $filename = "vagrant_${version}_${platid}.deb"
  $download_path = "/usr/local/src/vagrant-${version}/"

  file { $download_path:
    ensure => directory
  }

  exec { "download-${filename}" :
    path => '/usr/bin:/usr/sbin:/bin',
    command => "wget http://files.vagrantup.com/packages/7ec0ee1d00a916f80b109a298bab08e391945243/${filename} -O ${filename}",
    cwd => $download_path,
    creates => "${download_path}${filename}",
    require => File[$download_path]
  }

  package { "vagrant":
    name => "vagrant",
    ensure => latest,
    provider => dpkg,
    source => "${download_path}${filename}",
  }

}

