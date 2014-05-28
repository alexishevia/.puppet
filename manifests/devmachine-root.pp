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
  's3cmd',
  'default-jre'
]

$undesiredPackages = ['avahi-daemon']

package { $desiredPackages:
  ensure => installed
}

package { $undesiredPackages:
  ensure => purged
}

include google-chrome
