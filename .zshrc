# If you come from bash you might have to change your $PATH.
  export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/stavrosfil/.oh-my-zsh"

  source /home/stavrosfil/antigen.zsh

# Load the oh-my-zsh's library.
  antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
  antigen bundle zsh-users/zsh-autosuggestions  
  antigen bundle git
  antigen bundle command-not-found

# Syntax highlighting bundle.
  antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
  antigen theme geometry-zsh/geometry

# Tell Antigen that you're done.
  antigen apply


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="aphrodite"
# ZSH_THEME="geometry/geometry"
# POWERLEVEL9K_MODE='awesome-fontconfig'
# ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
source $ZSH/oh-my-zsh.sh

# User configuration
DEFAULT_USER=$USER
POWERLEVEL9K_ALWAYS_SHOW_USER=true

POWERLEVEL9K_VCS_CLEAN_FOREGROUND='blue'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_USER_DEFAULT_FOREGROUND="214"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="000"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="007"
POWERLEVEL9K_DIR_HOME_BACKGROUND="008"
POWERLEVEL9K_DIR_HOME_FOREGROUND="007"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="008"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="007"
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=('context' 'dir' 'vcs')
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=('node_version' 'load' 'ram_joined' 'time')
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B0'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0B2'

# Prompt
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir vcs status)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir root_indicator vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

# Custom cd functinallity
custom_cd() {
    cd $1;
    ls;
}
alias cd="custom_cd"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export PATH="/home/stavrosfil/tools/android-studio/bin:$PATH"
export PATH="/home/stavrosfil/tools/flutter/bin:$PATH"
export PATH="/home/stavrosfil/.scripts:$PATH"
export PATH="${PATH}:${HOME}/.local/bin/"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias cl="clear"
alias cubemx="tools/cubemx/STM32CubeMX"
alias zcon="vi $HOME/.zshrc"
alias cfi="vi $HOME/.config/i3/config"
alias ser="ssh stavrosfil@23.97.181.92 -p 1999"
alias userpackages="comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)"

wal-tile() {
    wal -n -i "$@"
    #feh --bg-fill --auto-zoom "/home/stavrosfil/Pictures/firewatch.png"
    feh --bg-fill --auto-zoom "$(< "${HOME}/Pictures/firewatch.png")"
}

# Open files with zathura and disown
za() {
	zathura $1 &
	disown
}

export already_setup=true
