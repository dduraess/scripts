# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

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
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -l -Rt'
alias tl='tree -tDhL'
alias open=xdg-open
alias kjb=kill_jboss
alias kosql=kill_sqldeveloper
alias robot='python -m robot'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# minhas funções
function kill_jboss() { kill -9 $(ps -aux | grep jboss | grep java | awk '{print $2}'); }
function kill_sqldeveloper() { kill -9 $(ps -aux | grep sqldev | grep java | awk '{print $2}'); }
function clear_selenium_trace() { rm -rf selenium-screenshot-*.png geckodriver-*.log log.html report.html output.xml; }
function fo() { find "$1" -iname "*$2*" -exec xdg-open {} \;; }
function fd() { find "$1" -iname "*$2*" -exec rm -ri {} \;; }
function fmm() { find "$1" -iname "*$2*" -exec mv -t "$3" {} \;; }
function fmu() { find "$1" -iname "*$2*" -exec mv -i {} "$3" \;; }
function fdt() { find "$1" -type f -newermt $(date -d "-$2 days" "+%Y-%m-%d") -ls; }
function fp() { find "$1" -iname "*$2*" -exec echo {} \;; }
function ftx() { egrep -ir --include=*."$1" "$2" "$3"; }
function ftc() { egrep -r --include=*."$1" "$2" "$3"; }
function fdo() { find "$1" -type f -newermt $(date -d "-$2 days" "+%Y-%m-%d") -exec xdg-open {} \;; }
function cnsa() { python /home/s273524038/Software/serpro/scripts/sqlada.py "$1" "$2" "$3"; }
function cno() {
    echo "$2" >/home/s273524038/Software/serpro/scripts/listaNI
    python /home/s273524038/Software/serpro/scripts/consulta-ni.py "$1"
}


# caminhos
export apf=/home/s273524038/Software/serpro/APF/
export tst=/home/s273524038/Software/serpro/cobint-ti/
export batch2=/home/s273524038/Software/serpro/cobint-11472/cobra-batch2-build
export ws=/home/s273524038/Software/serpro/cobint-11472/cobra-ws/
export jboss6=../configuracao/jboss-6.4.20/
export jbeap=../configuracao/jboss-eap-6.3.0/
export est=/home/s273524038/Software/serpro/sic-21118/
export intra=/home/s273524038/Software/serpro/cobint-11472/cobra-web-build/

# data hora no history
export HISTTIMEFORMAT="%F %T "

# Load pyenv automatically by appending
# the following to 
# ~/.bashrc (for interactive shells) :

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

