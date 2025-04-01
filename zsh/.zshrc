# ----- Plugins & Settings -----
plugins=(git zsh-autosuggestions zsh-syntax-highlighting macos z)


# ----- Shell Settings -----
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh" # Path to your oh-my-zsh installation.
ZSH_THEME="powerlevel10k/powerlevel10k" # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source $ZSH/oh-my-zsh.sh
zstyle ':completion:*' menu select
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export EDITOR="nvim"

# ----- Alias -----
alias catcat='bat'
alias showvim='vim $(fzf)'
alias gs='git status --short'
alias gl='git log --graph'
alias ls='colorls -1'
alias tree='ls --tree'
alias vim='nvim'
alias lg='lazygit'
alias chat='gh copilot explain'
alias gitstats='git ls-files | xargs wc -l | column -t'


# ----- Path Variables -----
export PATH=/opt/homebrew/sbin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH="$PATH:/Users/niklas/.modular/bin"
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
      echo "Virtual environment deactivated"
    fi
  fi

  dir=$(pwd)
  while [ "$dir" != "/" ]; do
    if [ -d "$dir/.venv" ]; then
      source "$dir/.venv/bin/activate"
      echo ".venv environment activated from $dir"
      return 0
    fi
    dir=$(dirname "$dir")
  done
}

# ----- Auto Commands -----
autoload -Uz add-zsh-hook
function cd_command() {
  venv
}
add-zsh-hook chpwd cd_command



# ----- *Random Stuff* -----
venv

