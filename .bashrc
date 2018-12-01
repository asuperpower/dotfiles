#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias'
alias ls='ls --color=auto'
alias upgrade='sudo pacman -Syu'
alias please='sudo $(history -p !!)'

#dotfiles git sync alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias sudotfiles='sudo /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/'
alias gc='git clone'
alias aur='git clone'
alias .aur='cd ~/.aur'

# alias from paulirish dotfiles
# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

#more navigation stuff
alias conf="cd ~/.config/"
alias config="cd ~/.config/"
alias bashrc="vim ~/.bashrc"
alias i3conf="vim ~/.config/i3/config"

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'
alias chx='chmod +x'

# reload xresources
alias xr='xrdb ~/.Xresources'

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

PS1='[\u@\h \W]\$ '
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
