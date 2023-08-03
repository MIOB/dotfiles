#!/usr/bin/env fish

set log_prefix "  [exa]"
set --local current_dir $(realpath $(status dirname))
source $current_dir/../utils.fish

if ! type --quiet exa
  info "Installing exa"
  sudo apt install exa 
    or fatal "Failed to install exa"
  info "Exa has been installed"
end

create_link $current_dir/conf.d/exa.fish $__fish_config_dir/conf.d/exa.fish
