# Noah Hefner's Terminal

# Kitty Terminal
if ! type "$kitty" > /dev/null; then
  echo "Installing Kitty\n"
  sudo apt install kitty
fi

# ZSH
if ! type "$zsh" > /dev/null; then
  echo "Installing ZSH\n"
  sudo apt install zsh
fi

# Neovim
if ! type "$nvim" > /dev/null; then
  echo "Installing Neovim\n"
  sudo apt install neovim
  echo "Installing Python support for Neovim"
  sudo apt install python-neovim
  sudo apt install python3-neovim
  
