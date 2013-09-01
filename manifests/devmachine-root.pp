package { 'build-essential':
  ensure => installed
}

package { 'git':
  ensure => 'installed'
}

package { 'git-core':
  ensure => installed
}

package { 'vim':
  ensure => 'installed'
}

package { 'ack-grep':
  ensure => 'installed'
}

package { 'xclip':
  ensure => 'installed'
}

include google-chrome

class { 'nodejs':
  version => 'v0.10.17'
}

class { 'java':
  package => 'oracle-java8-installer',
}
