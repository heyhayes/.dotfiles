# If you come from bash you might have to change your $PATH.
export PATH="$HOME/.local/bin:$PATH"
export GOPATH="$HOME/go"

# Platform-specific paths
if [[ "$(uname)" == "Darwin" ]]; then
    # macOS paths
    export PATH="$HOME/Library/Application Support/Herd/bin:$PATH"
    export PATH="$PATH:/opt/homebrew/bin"
    export PATH="$PATH:/opt/homebrew/opt/mysql@8.4/bin"
    export PATH="$PATH:$HOME/software/nvim-macos-arm64/bin"
    export PATH="$PATH:$HOME/software/emacs30/build/nextstep"
else
    # Linux paths
    export PATH="$PATH:/usr/local/bin"
    export PATH="$PATH:$HOME/software/nvim-linux64/bin"
    export PATH="$PATH:$HOME/software/emacs/bin"
fi

# Common paths for both platforms
export PATH="$PATH:$GOPATH/bin:$HOME/software/lua-language-server/bin:$HOME/.config/tmux/plugins/tmuxifier/bin:$HOME/scripts"
export TMUXIFIER_LAYOUT_PATH="$HOME/.config/tmux/layouts"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set editor based on what's available
if command -v nvim >/dev/null; then
    export EDITOR="$(command -v nvim)"
else
    export EDITOR="vim"
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# plugins=(zsh-vi-mode)
set -o vi

# source $ZSH/oh-my-zsh.sh

# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

setopt prompt_subst
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit

eval "$(starship init zsh)"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# Editor Commands, I use Neovim btw
if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
    alias nvim=nvr -cc split --remote-wait +'set bufhidden=wipe'
    export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
else
    export VISUAL="nvim"
    export EDITOR="nvim"
fi

alias v="nvim"
alias vim="nvim"

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'
alias lg='lazygit'
alias gm='git merge'

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

alias ..="z .."
alias ...="z ../.."
alias ....="z ../../.."
alias .....="z ../../../.."
alias ......="z ../../../../.."

bindkey jj vi-cmd-mode

alias la=tree
alias cat=bat
alias cl='clear'

# HTTP requests with xh!
alias http="xh"

# function ranger {
# 	local IFS=$'\t\n'
# 	local tempfile="$(mktemp -t tmp.XXXXXX)"
# 	local ranger_cmd=(
# 		command
# 		ranger
# 		--cmd="map Q chain shell echo %d > "$tempfile"; quitall"
# 	)
#
# 	${ranger_cmd[@]} "$@"
# 	if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
# 		cd -- "$(cat "$tempfile")" || return
# 	fi
# 	command rm -f -- "$tempfile" 2>/dev/null
# }
alias rr='ranger'

alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow'

# Check if code-insiders is installed
if command -v code-insiders &> /dev/null; then
  alias code="code-insiders"
fi

# Define the code function
function code() {
  command code "$@"
}

# navigation
cx() { cd "$@" && l; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }

eval "$(zoxide init zsh)"

export TERM=xterm-256color

bindkey -v
bindkey '^R' history-incremental-search-backward

export NVM_DIR="$HOME/.nvm"

if [ "$(uname)" = "Darwin" ]; then
  export PATH="~/.config/herd-lite/bin:$PATH"
  export PHP_INI_SCAN_DIR="~/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
  # Herd injected PHP binary.
  export PATH="~/Library/Application Support/Herd/bin/":$PATH
  # Herd injected PHP 8.4 configuration.
  export HERD_PHP_84_INI_SCAN_DIR="~/Library/Application Support/Herd/config/php/84/"
  # Herd injected PHP 8.2 configuration.
  export HERD_PHP_82_INI_SCAN_DIR="~/Library/Application Support/Herd/config/php/82/"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
  export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
else
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

# Only source if the file exists (Linux systems)
[ -f "/usr/share/nvm/init-nvm.sh" ] && source /usr/share/nvm/init-nvm.sh

nvm_auto_use() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd nvm_auto_use
nvm_auto_use
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/davidhayes/.lmstudio/bin"
# End of LM Studio CLI section



# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/davidhayes/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/davidhayes/Library/Application Support/Herd/config/php/82/"


# Herd injected PHP 8.1 configuration.
export HERD_PHP_81_INI_SCAN_DIR="/Users/davidhayes/Library/Application Support/Herd/config/php/81/"


# Herd injected PHP 7.4 configuration.
export HERD_PHP_74_INI_SCAN_DIR="/Users/davidhayes/Library/Application Support/Herd/config/php/74/"
