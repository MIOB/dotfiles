#!/usr/bin/env fish

source utils.fish

set log_prefix "[init]"

if test -z (git status --short --untracked-files=all)[1]
  info "Updating .dotfiles" 
  git pull --ff
    and info ".dotfiles have been updated"
    or error "Failed to update .dotfiles"
else
  info (set_color yellow)"Cannot update .dotfiles: there are changes"(set_color normal)
end

info "Bootstraping dotfiles in $dotfiles_root"

for installer in */install.fish
  set --local name $(basename $(realpath $(dirname $installer))) 
  info "Bootstraping "$(set_color --bold blue)"$name"$(set_color normal)
  $installer
    or fatal "Failed to bootstrap $name"
  info "$name has been bootstraped"
end

info "Bootstraping dotfiles has been finished"
