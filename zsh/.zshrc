if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ----- Plugins & Settings -----
plugins=(macos git tenv)

# ----- p10k -----
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ----- Shell Settings -----
export ZSH="$HOME/.oh-my-zsh" # Path to your oh-my-zsh installation.
export ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
zstyle ':completion:*' menu select
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)
export EDITOR="nvim"

# ------ carapace autocomplete -------
autoload -Uz compinit && compinit
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
source <(carapace _carapace)


# ----- Alias -----
alias config='vim ~/.zshrc'
alias gs='git status --short'
alias gl='git log --graph'
alias vim='nvim'
alias lzg='lazygit'
alias lzd='lazydocker'
alias gitstats="(git ls-files -z :/ | grep -z -v -e '^.gitignore$' -e '^README.md$' | xargs -0 wc -l | grep -v total | sort -n; git ls-files -z :/ | grep -z -v -e '^.gitignore$' -e '^README.md$' | xargs -0 wc -l | grep total) | column -t"
alias format='ruff format'


# ----- Path Variables -----
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
if [[ ! ":$PATH:" == *":$HOME/.local/bin:"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi


# ----- Functions -----
function y() {
 	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function venv() {
  if [ -n "$VIRTUAL_ENV" ]; then
    if [[ "$PWD" != "$VIRTUAL_ENV"/* ]]; then
      deactivate
      echo ".venv deactivated"
    fi
  else
    # Only search for .venv if no virtual environment is currently active
    dir=$(pwd)
    while [ "$dir" != "/" ]; do
      if [ -d "$dir/.venv" ]; then
	source "$dir/.venv/bin/activate"
	echo ".venv activated: $dir"
	return 0
      fi
      dir=$(dirname "$dir")
    done
  fi
}

# ----- Auto Commands -----
autoload -Uz add-zsh-hook
add-zsh-hook chpwd venv

# ----- *Random Stuff* -----
eval "$(zoxide init zsh)"

function z() {
  if [[ "$#" -eq 0 ]]; then
    cd ~
  elif [[ "$#" -eq 1 ]] && { [[ -d "$1" ]] || [[ "$1" = '-' ]] || [[ "$1" =~ ^[-+][0-9]$ ]]; }; then
    cd "$1"
  else
    # Try the standard zoxide query first
    local result
    result=$(zoxide query -- "$@" 2>/dev/null)
    
    # If standard query fails, fall back to fuzzy finding
    if [[ -z "$result" ]]; then
      result=$(zoxide query -l | fzf --query "$*" --select-1 --exit-0 \
        --height 40% --layout=reverse --border \
        --prompt="No direct match found. Fuzzy find: ")
    fi
    
    # If we got a result (either way), cd to it
    [[ -n "$result" ]] && cd "$result"
  fi
}

function zi() {
  local dir
  dir="$(zoxide query -l | fzf --query "$*" --select-1 --exit-0 \
    --height 40% --layout=reverse --border \
    --prompt="Jump to directory > ")" && cd "$dir"
}

venv
