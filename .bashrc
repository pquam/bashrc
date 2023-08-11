#skip customization on non-interactive shells
[ -z "$PS1" ] && return

#record data and time commands were executed in history
HISTTIMEFORMAT="%F %T "

alias ll='ls -alh'
alias la='ls -A'
alias home='cd ~'
alias root='cd /'
alias push='pushd'
alias pushh='pushd ~'
alias pop='popd'
alias hg="history | grep "
alias update='sudo apt-get update && sudo apt-get upgrade'
alias python='python3'
alias ac='git add *; git commit -m'
#alias domain/ip='ssh domain/ip'

#use vim commands to navigate command history
set -o vi

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

#increase history file size limit
export HISTSIZE=1000
export HISTFILESIZE=2000

#change colors
PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

#use this instead of cd .. several times 
up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

#updates cd connad to also print working directory and list all contents immediatly after
cd ()
{
	if [ -n "$1" ]; then
		builtin cd "$@" && pwd && ls
	else
		builtin cd ~ && pwd && ls
	fi
}

#extract any common file type
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }
