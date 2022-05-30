# Noah Hefner's Terminal

# bashrc
echo "Copying .bashrc to home directory"
cp .bashrc ~/.bashrc
echo ".bashrc copied. Reloading .bashrc"
source ~/.bashrc
echo ".bashrc setup complete!"

# Neovim
if ! command -v nvim &> /dev/null
then
  echo "Installing Neovim"
  sudo dnf install neovim
fi

echo "Neovim is installed!"

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
