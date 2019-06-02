# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/sbin:/sbin:/home/marav/Programmes:$PATH

export XDG_CONFIG_HOME=$HOME/.config
export SCRIPT_DIR=$XDG_CONFIG_HOME/i3/scripts
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export PANEL_FIFO="/tmp/panel-fifo"
export EDITOR="vim"

eval $(thefuck --alias)
#
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="clean"
#
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
#
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
#
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
#
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
#
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
#
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
#
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
#
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
#
# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
#
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
#
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
#
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
#
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
#  zsh-completions
  compleat
  ansible
  )
#
  source $ZSH/oh-my-zsh.sh
#
  # User configuration
#
  # export MANPATH="/usr/local/man:$MANPATH"
#
  # You may need to manually set your language environment
  # export LANG=en_US.UTF-8
#
  # Preferred editor for local and remote sessions
  # if [[ -n $SSH_CONNECTION ]]; then
  #   export EDITOR='vim'
  # else
  #   export EDITOR='mvim'
  # fi
#
  # Compilation flags
  # export ARCHFLAGS="-arch x86_64"
#
  # ssh
  # export SSH_KEY_PATH="~/.ssh/rsa_id"
#
  # Set personal aliases, overriding those provided by oh-my-zsh libs,
  # plugins, and themes. Aliases can be placed here, though oh-my-zsh
  # users are encouraged to define aliases within the ZSH_CUSTOM folder.
  # For a full list of active aliases, run `alias`.
  #
  # Example aliases
  # alias zshconfig="mate ~/.zshrc"
  # alias ohmyzsh="mate ~/.oh-my-zsh"


alias ls='ls --color=always --group-directories-first'
alias lla='ls -al'
alias la='ls -a'
alias ll='ls -lh'
alias tc="echo $(sensors | awk '/Package/ {print $4}')"
#temp=$(sensors | awk '/Package/ {print $4}')
#alias tc='echo ${temp}'
alias wget='wget -c'


alias slu='sudo slackpkg update && sudo slackpkg update gpg && sudo slackpkg install-new && sudo slackpkg upgrade-all'
alias slup='sudo slackpkg update'
alias slug='sudo slackpkg update gpg'
alias slcu='sudo slackpkg check-updates'
alias slcs='sudo slackpkg clean-system'
alias slua='sudo slackpkg upgrade-all'
#alias slu='sudo slackpkg upgrade'
alias sls='sudo slackpkg search'
alias slrm='sudo slackpkg remove'
alias slit='sudo slackpkg install'
alias slrt='sudo slackpkg reinstall'
alias sli='sudo slackpkg info'
alias slin='sudo slackpkg install-new'
