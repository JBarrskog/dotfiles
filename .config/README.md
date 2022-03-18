# How to set up
(https://www.atlassian.com/git/tutorials/dotfiles)

1. git clone --bare https://github.com/JBarrskog/dotfiles.git $HOME/dotfiles
2. alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
3. config checkout
4. Change default shell

Optional:
5. config config --local status.showUntrackedFiles no

