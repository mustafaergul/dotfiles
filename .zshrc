# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

export VOLTA_HOME=$HOME/.volta
export VOLTA_FEATURE_PNPM=1
export PATH=$HOME/.volta/bin:$PATH
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/Users/mergul/nvim-osx64/bin"

source ~/.oh-my-zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

# Add the bin folder to $PATH before the plugins load
PATH=$HOME/.local/bin:$PATH

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(git rails ruby node rbenv zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export EDITOR='vi'

# Example aliases
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias lg="lazygit"

# Export TMUX config file
export TMUX_CONFIG="~/.config/tmux/.tmux/.tmux.conf"

# TMUX aliases
alias tn="tmux -u -f $TMUX_CONFIG new"
alias ta="tmux -u -f $TMUX_CONFIG attach"
# alias tt="nvim $TMUX_CONFIG"

# fzf vim setup
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# default vim command to nvim command
alias vim="nvim"
alias vi="nvim"
alias mvim="nvim"

# remove duplicate entires from $PATH
deduplicate_path() {
  # Convert PATH to a list with newline-separated entries
  local old_path=$PATH
  local new_path=$(echo "$old_path" | tr ':' '\n' | awk '!seen[$0]++' | tr '\n' ':' | sed 's/:$//')

  # Export the deduplicated PATH
  export PATH=$new_path
}
# Call the function
deduplicate_path

# this is needed for the zsh-syntax-highlighting
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# pure prompter
# zstyle :prompt:pure:path color '#FF0000'
zstyle :prompt:pure:execution_time show no
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# autin setup
eval "$(atuin init zsh)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/mergul/.lmstudio/bin"

# opencode
export PATH=/Users/mergul/.opencode/bin:$PATH
