alias vim="/home/nasan/.local/bin/nvim.appimage"
alias t=tmux
alias to='tmux set-option'

#
### dotfiles alias and lazy completion
#
alias dotfiles='git --git-dir=/home/nasan/.config/dotfiles --work-tree=/home/nasan'

if declare -f __load_completion > /dev/null; then
   __load_completion 'git'
   __git_complete dotfiles __git_main
fi
