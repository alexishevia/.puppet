# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# enable 256-color support in terminal
TERM=xterm-256color

# user vim as the default editor
export EDITOR=/usr/bin/vim

# multi-line prompt
PS1='$PWD
==> '

# add ~/bin to PATH
PATH=$PATH:~/bin

# add FOX binaries to PATH
PATH=$PATH:~/Dropbox/clients/FOX/bin

# fix perl locale warning
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# add alias for nordvpn
alias nordvpn_la='sudo openvpn --config /etc/openvpn/ovpn_tcp/us357.nordvpn.com.tcp.ovpn --auth-user-pass ~/.nordvpnpass'
alias nordvpn_ny='sudo openvpn --config /etc/openvpn/ovpn_tcp/us327.nordvpn.com.tcp.ovpn --auth-user-pass ~/.nordvpnpass'

#---------------------------------------
# JAVA
#---------------------------------------
# define JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-8-oracle

#---------------------------------------
# Android
#---------------------------------------
# add android tools to path
PATH=$PATH:~/android-sdk/tools
PATH=$PATH:~/android-sdk/platform-tools

#---------------------------------------
# Docker
#---------------------------------------
# remove volumes which are both dangling and have no custom name
alias dockerRemoveUntaggedVolumes='docker volume rm $(docker volume ls -qf dangling=true | grep ".\{64\}")'

#---------------------------------------
# Node
#---------------------------------------
# add nvm to path
source ~/.nvm/nvm.sh

# add local node_modules binaries to PATH
PATH=./node_modules/.bin:$PATH

# save ~/.npmrc authToken value into an NPM_TOKEN env variable
export NPM_TOKEN=$(grep -oP 'authToken=\K.*' ~/.npmrc)

# create an nvm-use function that automatically installs global npm packages
function nvm-use {
  nvm use $1 && install_global_packages
}

#---------------------------------------
# MongoDB
#---------------------------------------
PATH=$PATH:~/bin/robomongo-0.9.0/bin

#---------------------------------------
# Python
#---------------------------------------
WORKON_HOME=~/.virtualenvs
. /usr/local/bin/virtualenvwrapper.sh

#---------------------------------------
# PHP
#---------------------------------------
# source ~/.phpbrew/bashrc

#---------------------------------------
# Ruby
#---------------------------------------
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)" # load rbenv automatically

#---------------------------------------
# FOX specific projects
#---------------------------------------
if [[ $PWD/ = $HOME/Projects/FOX/* ]];
  then
    source $HOME/Projects/FOX/.aws_keys;
    nvm-use;
fi
