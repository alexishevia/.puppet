$mainUser = "alexishevia"

$desiredPackages = [
  'curl',
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
  's3cmd',
  'gnome-do',
  'gnome-do-plugins',
  'compiz-plugins',
  'sni-qt:i386',
  'gcolor2',
  'screenruler'
]

$undesiredPackages = ['avahi-daemon']

package { $desiredPackages:
  ensure => installed
}

package { $undesiredPackages:
  ensure => purged
}
