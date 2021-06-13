#!/usr/bin/env bash
# Clone dotfiles repository and setup aliases for bash
# vim:expandtab:

print_help() { fmt -`tput cols` -t <<- EOF
dotfiles-install.sh -
                      Create alias and lazy completion for dotfiles.

    Usage:
           dotfiles-install [options] "username/repo" [branch]

       "username/repo":
                    Your github repository for dotfiles.

       branch:
                    The branch name for the specific configuration you are 
                    installing. This is specially useful if
                    you work with many distros.

    Options:

       -h | --help: 
                    Prints this text and exit.

       -a | --alias-file:
                    Change the file in which the alias is going to be
                    appended. Default is \$HOME/.bash_aliases.

       -g | --git-location:
                    Change the path for the .git folder used to manage
                    your dotfiles. Default is \$HOME/.config/dotfiles.
EOF
return
}

## default values
pos_args=()
alias_file=$HOME/.bash_aliases
git_path=$HOME/.config/dotfiles

while [[ $# -gt 0 ]]; do
	key="$1"
	shift # already in $key

	case $key in
		-h|--help)
			print_help
			exit 0
			;;
		-a|--alias-file)
			alias_file="$1"
			shift # the value
			;;
		-g|--git-location)
			git_path="$1"
			shift # the value
			;;
		*)
			pos_args+=("$key")
			;;
	esac
done

set -- "${pos_args[@]}"
if [[	-n $1 ]]; then

   # clone from git repository
   echo "Cloning repository https://github.com/$1.git into $git_path..."
   if git clone -q --bare https://github.com/$1.git $git_path; then
      echo "Success."
   else
      echo "Error while cloning repository. Aborting..."
      exit 1
   fi

   # checkout especific branch if given
   if [[ -n "$2" ]]; then
      git --git-dir=$git_path --work-tree=$HOME checkout -b $2
   fi

   # append alias if not found in the $alias_file
   header="### dotfiles alias and lazy completion"
   if grep -q -s -e "$header" $alias_file; then
      echo "The alias file $alias_file already has the header for dotfiles."
   else
      echo "Appending alias and lazy completion for dotfiles..."
      cat << EOF >> $alias_file

#
$header
#
alias dotfiles='git --git-dir=$git_path --work-tree=$HOME'

if declare -f __load_completion > /dev/null; then
   __load_completion 'git'
   __git_complete dotfiles __git_main
fi
EOF
      echo "Successful."
   fi
else

   # there are no positional arguements (no repo)
   print_help
   exit 1
fi

echo "Installation completed."
