class google-chrome {

  # Google repository configuration based on
  # http://www.google.com/linuxrepositories/apt.html

  file { "/etc/apt/sources.list.d/google.list":
    owner => "root",
    group => "root",
    mode => 444,
    source => "puppet:///modules/google-chrome/google.list",
    notify => Exec["Google apt-key"],
  }

  # Add Google's apt-key.
  # Assumes definition elsewhere of an Exec["apt-get update"] - or
  # uncomment below.
  exec { "Google apt-key":
    command => "/usr/bin/wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | /usr/bin/apt-key add -",
    refreshonly => true,
    notify => Exec["apt-get update"],
  }

  ## If not defined elsewhere, uncomment:
  exec { "apt-get update":
    command => "/usr/bin/apt-get update",
    refreshonly => true,
  }

  # Install latest stable; remove beta first, if present:
  package { "google-chrome-beta":
    ensure => absent,
  }

  package { "google-chrome-stable":
    ensure => latest, # to keep current with security updates
    require => [ Exec["apt-get update"], Package["google-chrome-beta"], ],
  }

}

