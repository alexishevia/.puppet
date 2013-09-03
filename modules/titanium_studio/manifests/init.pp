class titanium_studio {

  if $::architecture == "amd64" or $::architecture == "x86_64" {
    $platid = "x86_64"
  } else {
    $platid = "x86"
  }

  $filename = "titanium.linux.gtk.${platid}.zip"
  $download_path = "/opt/titanium_studio/"

  file { $download_path:
    ensure => directory
  }

  exec { "download-${filename}" :
    path => '/usr/bin:/usr/sbin:/bin',
    command => "wget http://titanium-studio.s3.amazonaws.com/latest/${filename} -O ${filename}",
    cwd => $download_path,
    creates => "${download_path}${filename}",
    require => File[$download_path]
  } ->
  exec { 'unpack-${filename}':
    path => '/usr/bin:/usr/sbin:/bin',
    command => "unzip ${filename}",
    creates => "${download_path}Titanium_Studio",
    cwd     => "${download_path}",
  }

}
