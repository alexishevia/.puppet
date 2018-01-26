class { 'nvm':
  user => "$id",
  manage_profile => false,
}

include vim_config
include git_config
include ack_config
include postgres_config
include bash_config
include tmux_config
include bin_config
include rbenv_config
