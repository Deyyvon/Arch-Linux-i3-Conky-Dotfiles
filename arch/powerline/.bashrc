#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -a --color=auto'
alias lll='ls -al --color=auto'
alias grep='grep --color=auto'
alias vncviewer='vncviewer -dotwhennocursor -fullscreen'
PS1='[\u@\h \W]\$ '
