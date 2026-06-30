##### PATH / ENV #####

# Base paths
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# Homebrew PostgreSQL
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Neovim
export PATH="$HOME/nvim-osx64/bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"

# Volta
export VOLTA_HOME="$HOME/.volta"
export VOLTA_FEATURE_PNPM=1
export PATH="$VOLTA_HOME/bin:$PATH"

# Misc tools
export PATH="$HOME/.opencode/bin:$PATH"

# macOS fork safety
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES


##### OH MY ZSH #####

export ZSH="$HOME/.oh-my-zsh"

# Plugins (only ones actually used)
plugins=(
  git
  rails
  ruby
  node
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# OMZ update reminder
zstyle ':omz:update' mode reminder

# Case-sensitive completion (you explicitly enabled this)
CASE_SENSITIVE="true"

# Load Oh My Zsh
source "$ZSH/oh-my-zsh.sh"


##### SYNTAX HIGHLIGHTING THEME #####
# (keep this since you explicitly use Catppuccin)
# source "$ZSH/catppuccin_mocha-zsh-syntax-highlighting.zsh"


##### EDITOR #####

export EDITOR="nvim"
export VISUAL="nvim"

##### ALIASES #####

alias vim="nvim"
alias vi="nvim"
alias mvim="nvim"

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias lg="lazygit"

alias cat='bat --paging=never'

##### TMUX #####

export TMUX_CONFIG="$HOME/.config/tmux/.tmux/.tmux.conf"
alias tn="tmux -u -f $TMUX_CONFIG new"
alias ta="tmux -u -f $TMUX_CONFIG attach"


##### FZF #####

if command -v rg >/dev/null; then
  export FZF_DEFAULT_COMMAND="rg --files"
  export FZF_DEFAULT_OPTS="-m --height 50% --border"
fi


##### PURE PROMPT #####

# Homebrew-installed Pure
fpath+=("$(brew --prefix)/share/zsh/site-functions")

autoload -Uz prompt_pure_setup
prompt_pure_setup

zstyle :prompt:pure:execution_time show no


##### ATUIN #####

eval "$(atuin init zsh)"

# bun completions
[ -s "/Users/mergul/.bun/_bun" ] && source "/Users/mergul/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export DD_SITE=datadoghq.eu

# Sync dotfiles to remote (stow model: edits live in repo via symlink)
alias dotpush='cd ~/Projects/dotfiles && git add -A && git commit -m "update dotfiles" && git push'
