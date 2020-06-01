# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# export ZSH="$HOME/.oh-my-zsh"

source $HOME/antigen.zsh

export TERMINAL="kitty"

# Export sync script thingy
export already_setup=true

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle git
antigen bundle command-not-found
antigen bundle ael-code/zsh-colored-man-pages
antigen bundle httpie
antigen bundle docker
antigen bundle git-extras
antigen bundle zsh-users/zsh-completions

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# antigen theme geometry-zsh/geometry
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Tell Antigen that you're done.
antigen apply

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# -------------------------------- Git Aliases ------------------------------- #

alias gd="git diff --color-words"
alias gl="git log --oneline --decorate"
alias glog="git log --oneline --all --graph --decorate -n 30"
alias gslog="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Custom cd functinallity
#custom_cd() {
#    cd $1
#    ls --color=auto
#}
#alias cd="custom_cd"

chpwd() {
    ls --color=auto
}

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export PATH="$HOME/tools/cubemx/STM32CubeMX/:$PATH"
export PATH="$HOME/tools/android-studio/bin:$PATH"
export PATH="$HOME/tools/flutter/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"
export PATH="$HOME/tools/flutter/bin:$PATH"
export PATH="${PATH}:${HOME}/.local/bin/"
# export JAVA_HOME="/usr/lib/jvm/java-8-openjdk/"
export ANDROID_HOME="$HOME/Android/Sdk"
# export IDF_PATH="$HOME/esp/esp-idf"
export IDF_PATH="$HOME/esp/ESP8266_RTOS_SDK"
export TERM=xterm-256color
# export TERM=xterm-kitty
# export TERM=xterm

# Aliases
alias cl="clear"
# alias cubemx="tools/cubemx/STM32CubeMX"
alias zcon="vi $HOME/.zshrc"
alias cfi="vi $HOME/.config/i3/config"
alias dot="$HOME/repos/dotfiles/"
alias userpackages="comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)"
alias sync="bash $HOME/repos/dotfiles/sync.sh"
alias pip="pip3"
alias mexec="chmod a+x"
alias vi="vim"
alias vim="nvim"

### file browsing
# list files
alias ll="ls -Ahl"

# fast find
ff() {
    find . -name "$1"
}

### file manipulation
# remove
alias rm="rm -rfv"
alias rmi="rm -rfvi"

# copy
alias cp="cp -rfv"

# move
alias mv="mv -fv"
alias mvi="mv -fvi"

alias tmux="tmux -u"

alias bgset="feh --bg-fill --auto-zoom"

# History directory navigation
d='dirs -v | head -10'
1='cd -'
2='cd -2'
3='cd -3'
4='cd -4'
5='cd -5'
6='cd -6'
7='cd -7'
8='cd -8'
9='cd -9'

wal-tile() {
    wal -n -i "$@"
    feh --bg-tile "$(<"${HOME}/.cache/wal/wal")"
}

# Open files with zathura and disown
za() {
    zathura $1 &
    disown
    kill $PPID
}

# . $HOME/esp/esp-idf/export.sh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] &&
    [ -s "$BASE16_SHELL/profile_helper.sh" ] &&
    eval "$("$BASE16_SHELL/profile_helper.sh")"

PATH="/home/stavrosfil/perl5/bin${PATH:+:${PATH}}"
export PATH
PERL5LIB="/home/stavrosfil/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL5LIB
PERL_LOCAL_LIB_ROOT="/home/stavrosfil/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_LOCAL_LIB_ROOT
PERL_MB_OPT="--install_base \"/home/stavrosfil/perl5\""
export PERL_MB_OPT
PERL_MM_OPT="INSTALL_BASE=/home/stavrosfil/perl5"
export PERL_MM_OPT

# Automatically start a tmux session when connecting with SSH
if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
    tmux -u attach-session -t ssh_tmux || tmux -u new-session -s ssh_tmux
fi

# Fix repeating characters on tab completion
export LC_ALL="en_US.UTF-8"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Used to spawn a terminal in the same working directory
export PROMPT_COMMAND="pwd > /tmp/whereami"
