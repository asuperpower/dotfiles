#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.bashrc_private ]] && source ~/.bashrc_private
[[ -f /usr/share/git/completion/git-completion.bash ]] && source /usr/share/git/completion/git-completion.bash

# alias'
alias ls='ls --color=auto'
alias upgrade='sudo pacman -Syu'
alias please='sudo $(history -p !!)'
alias lyrics='clyrics'
#dotfiles git sync alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias sudotfiles='sudo /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/'
alias gc='git clone' 
#alias gd='git diff --color=always | more' #useless
#alias aur='git clone'
alias .aur='cd ~/.aur'
#swallow
alias fork='setsid -f'
alias weather='curl wttr.in'
alias work='source ~/.scripts/work.sh'
alias wifi='sudo ~/.scripts/openap.sh'
alias rss='newsboat'
alias core='corefreq-cli'
alias new='(setsid kitty </dev/null &>/dev/null &)'
alias gcmsg='gitmoji -c'

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
alias i3config="vim ~/.config/i3/config"

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'
alias chx='chmod +x'

# docker
alias dock="sudo docker"
alias dockc="sudo docker container"

alias info="pacman -Qi "

# kubernetes
source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k

kc()
{
  kubectl config use-context $1 || kubectl config get-contexts
}

#export
#c#
export DOTNET_ROOT=/opt/dotnet

# function to mkdir and cd to it
mcd()
{
	mkdir -p -- "$1" &&
	cd -P -- "$1"
}

# function for aur stuff
aur()
{
	cd ~/.aur &&
	git clone aur://"$1" &&
	cd -P -- "$1" &&
	vim PKGBUILD
}

# function to install python packages
py()
{	
	pip install --user "$1"
}

# function to start win10 vm
win10()
{
	cd /etc/libvirt/qemu
	sudo virsh start win10
	cd ~/
}

# function to use work git
jc()
{
	cd ~/code/work
	git clone jc://"$1" &&
	cd -P -- "$1" &&
  echo "Done!"
}

decimal()
{
  short="${1:0:2}"
  [[ "$short" == "0x" ]] && echo $(("$1")) ||
  echo $((0x"$1"))
}

hex()
{
  printf '%x\n' "$1"
}

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
[[ -f ~/.cache/wal/colors-tty.sh ]] && source ~/.cache/wal/colors-tty.sh

# nodejs nvm
[[ -f /usr/share/nvm/init-nvm.sh ]] && source /usr/share/nvm/init-nvm.sh

PS1='[\u@\h \W]\$ '
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh

[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
