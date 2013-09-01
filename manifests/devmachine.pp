vcsrepo { 'dotfiles':
  path     => "/home/$id/.dotfiles",
  ensure   => present,
  provider => git,
  source   => 'https://github.com/alexishevia/.dotfiles.git'
}

# VIM

file { '.vim':
  path   => "/home/$id/.vim",
  ensure => link,
  target => '.dotfiles/.vim',
  require => Vcsrepo['dotfiles']
}

file { '.vimrc':
  path   => "/home/$id/.vimrc",
  ensure => link,
  target => '.dotfiles/.vimrc',
  require => Vcsrepo['dotfiles']
}

file { '.local.vimrc':
  path   => "/home/$id/.local.vimrc",
  ensure => link,
  target => '.dotfiles/.local.vimrc.using_spaces',
  require => Vcsrepo['dotfiles']
}

# GIT

file { '.gitconfig':
  path   => "/home/$id/.gitconfig",
  ensure => link,
  target => '.dotfiles/.gitconfig.personal',
  require => Vcsrepo['dotfiles']
}

# Ack / Grep

file { '.ackrc':
  path   => "/home/$id/.ackrc",
  ensure => link,
  target => '.dotfiles/.ackrc',
  require => Vcsrepo['dotfiles']
}

# Postgres

file { '.psqlrc':
  path   => "/home/$id/.psqlrc",
  ensure => link,
  target => '.dotfiles/.psqlrc',
  require => Vcsrepo['dotfiles']
}

# Terminator

include terminator_config

# GTK

include gtk_config
