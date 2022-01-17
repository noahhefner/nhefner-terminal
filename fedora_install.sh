# Noah Hefner's Terminal

# Kitty Terminal
if ! command -v kitty &> /dev/null
then
  echo "Installing Kitty"
  sudo dnf install kitty
fi

echo "Kitty is installed!"

# Neovim
if ! command -v nvim &> /dev/null
then
  echo "Installing Neovim"
  sudo dnf install neovim
fi

echo "Neovim is installed!"

echo "Configuring Kitty"
# If kitty config file exists, copy it to the current directory
if [ -e ~/.config/kitty/kitty.conf ]
then
  echo "kitty.conf file found. Making a copy in this directory."
  cp ~/.config/kitty/kitty.conf ./old_kitty.conf
fi

echo "Copying kitty.conf to ~/.config/kitty"
cp ./kitty.conf ~/.config/kitty/kitty.conf


# Kitty theme
if [ -e ~/.config/kitty/theme.conf ]
then
  echo "Kitty theme file found. Making a copy in this directory."
  cp ~/.config/kitty/theme.conf ./old_theme.conf
fi

echo "Copying theme.conf to ~/.config/kitty"
cp ./theme.conf ~/.config/kitty/theme.conf

echo "Configuring Neovim"
# vim-plug
echo "Installing vim-plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# If neovim config file exists, copy it to the current directory
if [ -e ~/.config/nvim/init.vim ]
then
  echo "init.vim found. Making a copy in this directory."
  cp ~/.config/nvim/init.vim ./old_init.vim
fi

# Make ~/.config/nvim if said directory does not exist
if [ ! -d "~/.config/nvim" ]
then
  echo "~/.config/nvim directory does not exist. Creating it now."
  mkdir ~/.config/nvim
fi

echo "Copying init.vim to ~/.config/nvim"
cp ./init.vim ~/.config/nvim/init.vim
# Install plugins
echo "Installing Neovim plugins"
nvim +'PlugInstall --sync' +qa

echo "All done!"
