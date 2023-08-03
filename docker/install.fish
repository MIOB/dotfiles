#!/usr/bin/env fish

set log_prefix "  [docker]"
set --local current_dir $(realpath $(status dirname))
source $current_dir/../utils.fish

if ! type --quiet docker
  curl --silent --show-error --fail --location https://get.docker.com | sudo sh
    or fatal "Failed to install docker"
  sudo usermod -aG docker $USER
    or fatal "Failed to add docker group to user $USER"
  info "Docker has been installed"
end
