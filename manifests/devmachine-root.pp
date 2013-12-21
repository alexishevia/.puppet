$mainUser = "alexishevia"

$desiredPackages = [
  'build-essential',
  'git',
  'git-core',
  'gitk',
  'vim-gnome',
  'ack-grep',
  'ncurses-term',
  'xclip',
  'terminator',
  'dconf-tools',
  'unzip',
  'libjpeg62',
  'libwebkitgtk-1.0-0',
  'unrar',
  'compizconfig-settings-manager',
  'virtualbox',
  's3cmd'
]

$undesiredPackages = ['avahi-daemon']

package { $desiredPackages:
  ensure => installed
}

package { $undesiredPackages:
  ensure => purged
}

class { 'vagrant':
  version => '1.2.7'
}

include google-chrome
