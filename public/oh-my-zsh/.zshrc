# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cxc"
# 自动更新
DISABLE_UPDATE_PROMPT=true

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git mercurial wd urltools web-search vi-mode)

source $ZSH/oh-my-zsh.sh
#自动提示插件
#source $ZSH/plugins/incr/incr*.zsh

export EDITOR=vim
# Customize to your needs...
GO_HOME="/usr/local/go"
ECLIPSE_HOME='/home/cxc/Workspace/eclipse/'
ADB_HOME='/home/cxc/Workspace/android/adt-bundle-linux-x86_64-20131030/sdk/platform-tools'
PHP_HOME='/usr/local/php/bin/'
export PATH=$PATH:$GO_HOME/bin:$ECLIPSE_HOME:$ADB_HOME:$PHP_HOME
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/sbin/:/usr/local/wpsoffice/

#history
HISTFILESIZE=50000
HISTIGNORE=':cd:ls:cat'
HISTCONTROL=erasedups
HISTTIMEFORMAT='%F %T'
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY

#alias
alias ll="ls -lh"
alias l="ls -a"
alias lah="ls -alh"
alias pps="ps aux | grep "
alias cache="memcached -d -u cxc -m 32 -l 0.0.0.0 -p "
alias brs="hg brs | grep "
alias his="history | grep "
alias grep="grep -n --color"
alias pps="ps aux | grep "
alias tailf="tail -f"
alias ic=ifconfig
alias crontab="VIM_CRONTAB=true crontab"
alias mycp=/usr/local/bin/CP
alias tatt='tmux att -t'
alias tnew='tmux new -s'

#if [[ $TERM == xterm* ]] || [[ $TERM == *rxvt* ]]; then # {{{2 设置光标颜色
#      cursorcolor () { echo -ne "\e]12;$*\007" }
#elif [[ $TERM == screen* ]]; then
#    if [[ -n "$TMUX" ]]; then
#        cursorcolor () { echo -ne "\ePtmux;\e\e]12;$*\007\e\\" }
#    else
#        cursorcolor () { echo -ne "\eP\e]12;$*\007\e\\" }
#    fi
#fi

bindkey '^R' history-incremental-pattern-search-backward 
# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/cxc/Workspace/cocos2d-x-3.2/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/share/java/ant-1.8.2/bin
export PATH=$ANT_ROOT:$PATH

