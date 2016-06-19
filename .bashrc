#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

alias ls='ls --color=auto'
PS1='[\u@\h \W$(parse_git_branch)]\$ '
VISUAL=emacs
EDITOR=emacs
PATH=$PATH:/home/sean/sdks/arduino-1.6.9/hardware/tools/avr/bin:~/bin
