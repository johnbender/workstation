# OPAM configuration
. /home/ubuntu/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
eval `opam config env`

PATH=$PATH:~/.local/bin

# git aliases
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gp='git push'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias grec='git-reconcile'

# battery information
alias battery="upower -i $(upower -e | grep BAT0) | grep percentage | sed 's/.*\([0-9]\{2\}\)/\1/'"

BROWN="\[\033[0;33m\]"
PS_CLEAR="\[\033[0m\]"
BLUE="\[\033[0;34m\]"

parse_git_branch() {
  git symbolic-ref HEAD 2> /dev/null | sed 's#\(.*\)\/\([^\/]*\)$# \2#'
}

prompt_color() {
  PS1="$(whoami)@$(hostname) ${BLUE}\W${BROWN}\$(parse_git_branch)${PS_CLEAR} : "
  PS2="\[[33;1m\]continue \[[0m[1m\]> "
}

# Prevent "dumb" terminals from getting colors, e.g. Tramp
if [ $TERM != "dumb" ] && [ -n "$PS1" ]; then
  prompt_color
  eval `dircolors ~/.dir_colors`
  alias ls='ls --color=auto'
fi

export TZ=America/Los_Angeles
