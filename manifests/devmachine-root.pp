$mainUser = "alexishevia"

$desiredPackages = [
  'curl',
  'build-essential',
  'git',
  'git-core',
  'gitk',
  'ack-grep',
  'ncurses-term',
  'xclip',
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
  'screenruler',
  'vim-gtk',
  'android-tools-adb',
  'android-tools-fastboot',
  'tmux',
  'rbenv',
  'tidy'
]

$undesiredPackages = ['avahi-daemon', 'vim', 'vim-gnome', 'terminator']

package { $desiredPackages:
  ensure => installed
}

package { $undesiredPackages:
  ensure => purged
}
