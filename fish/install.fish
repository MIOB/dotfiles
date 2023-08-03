#!/usr/bin/env fish

set log_prefix "  [fish]"
set --local current_dir $(realpath $(status dirname))
source $current_dir/../utils.fish

if ! grep $(command --search fish) /etc/shells > /dev/null
  command --search fish | sudo tee --append /etc/shells
    or fatal "Failed to add fish into /etc/shells"
  info "Fish has been added into /etc/shells"
end

if test $(awk -F : -v user=$USER '$1 == user {print $7}' /etc/passwd) != $(command --search fish)
  info "Setting fish as default shell"
  chsh --shell $(command --search fish)
    or fatal "Failed to set fish as default shell"
  info "Fish has been set as default shell"
end



create_link $current_dir/conf.d/fish.fish $__fish_config_dir/conf.d/fish.fish
