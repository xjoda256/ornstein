##################################################
## ╭──────────────────────────────────────────╮ ##
## │another                                   │ ##
## │       _____              __              │ ##
## │      /\___ \            /\ \             │ ##
## │ __  _\/__/\ \    ___    \_\ \     __     │ ##
## │/\ \/'\  _\ \ \  / __`\  /'_` \  /'__`\   │ ##
## │\/>  </ /\ \_\ \/\ \L\ \/\ \L\ \/\ \L\.\_ │ ##
## │ /\_/\_\\ \____/\ \____/\ \___,_\ \__/.\_\│ ##
## │ \//\/_/ \/___/  \/___/  \/__,_ /\/__/\/_/│ ##
## │                               masterpiece│ ##
## ╰──────────────────────────────────────────╯ ##
###×Joda™#########################################
[[ $- != *i* ]] && return

PS1='\n╭$(gitprompt-rs)(\[\e[38;5;3m\]@\[\e[38;5;2m\]\h\[\e[0m\])(\[\e[38;5;6m\]\w\[\e[0m\])\n╰─ '

## ╭ ╮ ╰ ─ ╯ ┌ ┐ ┴ ┬ └ ┘ │    ##

shopt -s progcomp_alias
shopt -s histappend

export PATH=$PATH:~/bin/
export LESSUTFCHARDEF=E000-F8FF:p,F0000-FFFFD:p,100000-10FFFD:p
export EDITOR='/usr/bin/nvim'
export PAGER='/usr/bin/bat'
export GIT_PAGER='/usr/bin/bat'
export GRIM_DEFAULT_DIR='$HOME/Pictures/Screenshots/'

export HISTSIZE=
export HISTFILESIZE=
export HISTIGNORE=cl:exit:history
export HISTCONTROL=ignoreboth:ignorespace:erasedups
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }history -a"

source ~/.bash_completion
source ~/.bash_functions

alias hyprpicker='hyprpicker -la'
alias le='eza --icons auto --group-directories-first'
alias la='eza -a --icons auto --group-directories-first'
alias ll='eza -l --icons auto --group-directories-first'
alias grep='grep --color=auto'
alias wgetod='wget -e robots=off -r -nc -np --show-progress'
alias snvim='sudo nvim -u ~/.config/nvim/init.lua'
alias cl='clear; source ~/.bashrc '
alias wan='curl -4 icanhazip.com'
alias today='date +"%Y-%m-%d-%H:%M:%S"'
alias kkc='kitty +kitten clipboard'

if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi

if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# [[ $- != *i* ]] && return
# [[ -z "$TMUX" ]] && exec tmux

eval "$(zoxide init bash --cmd z)"
eval "$(batman --export-env)"
eval "$(batpipe)"
# To use batpipe, eval the output of this command in your shell init script.
LESSOPEN="|/usr/bin/batpipe %s"
export LESSOPEN
unset LESSCLOSE
# The following will enable colors when using batpipe with less:
LESS="$LESS -R"
BATPIPE="color"
export LESS
export BATPIPE

## make the compurter do magics ## ^sometimes
printf "\n\e[0m another \e[38;5;6m×Joda™\e[0m masterpiece\n\n"
if [[ $(shuf -i 1-50 -n 1 2>/dev/null) == 50 ]]; then
	fastfetch | lolcat -t -p 1 -F 0.5 -a -s 64
else
	fastfetch
fi
echo

