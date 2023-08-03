#!/usr/bin/env fish

set log_prefix "  [fisher]"
set --local current_dir $(realpath $(status dirname))
source $current_dir/../utils.fish

if ! type --quiet fisher
  info "Installing fisher"
  curl --silent --location https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source 
    and fisher install jorgebucaran/fisher 
    or fatal "Failed to install fisher"
  info "Fisher has been installed"
end

create_link $current_dir/fish_plugins $__fish_config_dir/fish_plugins

info "Updating fisher"
fisher update > /dev/null
  or fatal "Failed to update fisher"
info "Fisher has been updated"
