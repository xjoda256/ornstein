#!/usr/bin/env bash
################################################
## another                                    ##
##        _____              __               ##
##       /\___ \            /\ \              ##
##  __  _\/__/\ \    ___    \_\ \     __      ##
## /\ \/'\  _\ \ \  / __`\  /'_` \  /'__`\    ##
## \/>  </ /\ \_\ \/\ \L\ \/\ \L\ \/\ \L\.\_  ##
##  /\_/\_\\ \____/\ \____/\ \___,_\ \__/.\_\ ##
##  \//\/_/ \/___/  \/___/  \/__,_ /\/__/\/_/ ##
##                                masterpiece ##
################################################

nvsh() {
	cp -i ~/docs/@sh.sh -- "$1"
	nvim "$1"
}

chasc() {
	cha "https://www.shellcheck.net/wiki/SC""$1"""
}

mkz() {
	mkdir -p -- "$1" && builtin cd -P -- "$1" || return 
}

back() {
	cp -- "$1" "$1".bak
}

bark() {
	mv -- "$1" "$1".bak
}

zl() {
	z "$1"
	eza -a --group-directories-first
}

## notes function ##
n() {
	if [ $# -eq 0 ]; then
		echo
		printf '%*s\n' "$(tput cols)" '' | sed 's/ /─/g'
		tail ~/docs/notes -n "${1:-10}"
		printf '%*s\n' "$(tput cols)" '' | sed 's/ /─/g'
	else
		echo "$@" >>~/docs/notes
		echo "note added"
	fi
}

## Flip a Coin! ##
fac() {
	local LANDED
	LANDED=$(shuf -n1 -e "heads" "tails")
	if [ "$1" == "$LANDED" ]; then
		echo -e "\e[7m$LANDED\e[0m"
	else
		echo "$LANDED"
	fi
}

extract() {
	if [ -f "$1" ]; then
		case "$1" in
		*.tar.bz2) tar xjf "$1" ;;
		*.tar.gz) tar xzf "$1" ;;
		*.bz2) bunzip2 "$1" ;;
		*.rar) unrar x "$1" ;;
		*.gz) gunzip "$1" ;;
		*.tar) tar xf "$1" ;;
		*.tbz2) tar xjf "$1" ;;
		*.tgz) tar xzf "$1" ;;
		*.zip) unzip "$1" ;;
		*.Z) uncompress "$1" ;;
		*.7z) 7z x "$1" ;;
		*.zst) zstd -d "$1" ;;
		*) echo "Unknown archive format" ;;
		esac
	else
		echo "$1 is not a valid file"
	fi
}

## cd to directory when exiting yazi with Q ##
y() {
#	local tmp
local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" 
	rm -f -- "$tmp"
}

batman() {
	BAT_THEME="Sublime Snazzy" /usr/bin/batman "$@"
  return $?
 }

fullline() {
	printf '%*s\n' "$(tput cols)" '' | sed 's/ /─/g'
}

