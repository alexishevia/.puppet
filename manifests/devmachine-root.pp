$mainUser = "alexishevia"

$desiredPackages = [
  'build-essential',
  'git',
  'git-core',
  'vim-gnome',
  'ack-grep',
  'ncurses-term',
  'xclip',
  'terminator',
  'dconf-tools',
  'unzip',
  'libjpeg62',
  'libwebkitgtk-1.0-0',
]

$undesiredPackages = ['avahi-daemon']

package { $desiredPackages:
  ensure => installed
}

package { $undesiredPackages:
  ensure => purged
}

class { 'nodejs':
  version => 'v0.10.17'
}

class { 'java':
  package => 'oracle-java8-installer',
}

class { 'vagrant':
  version => '1.2.7'
}

class { 'android':
  user => $mainUser,
  group => $mainUser,
  installdir => "/home/$mainUser/.android"
}

include google-chrome
include titanium_studio
