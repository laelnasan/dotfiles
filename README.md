# laelnasan dotfiles
the  `dotfiles-install.sh` script  helps  installing dotfiles  in a  new
system.  The first  argument should  be the string `username/repo` identifying
the repository.  An optional second argument indicates the branch used.

# example installation
The following commands  install the dotfiles in this repo  for a manjaro
system

```
wget https://raw.githubusercontent.com/laelnasan/dotfiles/master/dotfiles-install.sh
bash dotfiles-install.sh "laelnasan/dotfiles" manjaro
source $HOME/.bashrc
```
