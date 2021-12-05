# Noah Hefner's Terminal

# Kitty Terminal
if ! type "$kitty" > /dev/null; then
  echo "Installing Kitty\n"
  sudo apt install kitty
fi

echo "Kitty is installed!"

# Neovim
if ! type "$nvim" > /dev/null; then
  echo "Installing Neovim\n"
  sudo apt install neovim
  echo "Installing Python support for Neovim"
  sudo apt install python-neovim
  sudo apt install python3-neovim
fi

echo "Neovim is installed!"

echo "Configuring Kitty"
# Kitty config
echo "Copying kitty.conf to ~/.config/kitty"
cp ./kitty.conf ~/.config/kitty/kitty.conf
# Kitty theme
echo "Copying theme.conf to ~/.config/kitty"
cp ./theme.conf ~/.config/kitty/theme.conf

echo "Configuring Neovim"
# vim-plug
echo "Installing vim-plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Neovim init.vim
echo "Copying init.vim to ~/.config/nvim"
cp ./init.vim ~/.config/nvim/init.vim
# Install plugins
echo "Installing Neovim plugins"
nvim +'PlugInstall --sync' +qa

echo "All done!"
