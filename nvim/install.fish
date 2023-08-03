#!/usr/bin/env fish

set log_prefix "  [nvim]"
set --local current_dir $(realpath $(status dirname))
source $current_dir/../utils.fish

if ! type --quiet nvim
  if type --quiet vim
    info "Removing vim"
    sudo apt remove vim -y
      or fatal "Failed to remove vim"
    sudo apt autoremove -y
  end
  info "Installing neovim"
  sudo apt install neovim -y
    or fatal "Failed to install neovim"
  info "Neovim has been installed"
end

if ! test -e $HOME/.local/share/nvim/site/autoload/plug.vim
  curl --silent --show-error --fail --location "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" --create-dirs --output $HOME/.local/share/nvim/site/autoload/plug.vim 
    or fatal "Failed to install vim-plug"
  info "vim-plug has been installed"
end

create_link $current_dir/init.vim ~/.config/nvim/init.vim

vim +'PlugUpdate --sync' +qa
