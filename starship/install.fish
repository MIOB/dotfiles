#!/usr/bin/env fish

set log_prefix "  [starship]"
set --local current_dir $(realpath $(status dirname))
source $current_dir/../utils.fish

if ! type --quiet starship
	info "Installing starship"
	curl --silent --show-error --fail --location https://starship.rs/install.sh | sh 
		or fatal "Failed to install starship"
	info "Starship has been installed"
end

create_link $current_dir/conf.d/starship.fish $__fish_config_dir/conf.d/starship.fish
create_link $current_dir/config.toml ~/.config/starship.toml
