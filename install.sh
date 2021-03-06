#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# vim config
echo -e "\n\033[32mConfiguring vim\033[m";
ln -sf $DIR/.vimrc $HOME/;
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim;
fi
nvim +PluginInstall +qall

# neovim config linking
if hash nvim 2>/dev/null; then
  echo -e "\n\033[32mLinking neovim\033[m";
  mkdir -p ~/.config/nvim
  ln -s $HOME/.vimrc ~/.config/nvim/init.vim
  ln -s $HOME/.vim ~/.config/nvim/
fi

# terminal patched font
echo -e "\n\033[32mInstalling powerline patched fonts\033[m";
git clone https://github.com/powerline/fonts.git $HOME/powerline-fonts;
. $HOME/powerline-fonts/install.sh;
rm -rf $HOME/powerline-fonts;

# git config
if hash git 2>/dev/null; then
  echo -e "\n\033[32mConfiguring git\033[m";
  ln -sf $DIR/.gitconfig $HOME/;
fi

# bash config
echo -e "\n\033[32mConfiguring bash\033[m";
if grep -Fxq ".bash_kit" $HOME/.bash_profile; then
  echo ".bash_kit already included"
else
  ln -sf $DIR/.bash_kit $HOME/;
  echo source \$HOME/.bash_kit >> $HOME/.bash_profile
fi
touch ~/.hushlogin
