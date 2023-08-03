#!/usr/bin/env fish

set log_prefix "  [git]"
set --local current_dir $(realpath $(status dirname))
source $current_dir/../utils.fish

if test -e $current_dir/../config.fish
  source $current_dir/../config.fish
end

if ! set --query git_user_email
  git config --global user.email $git_user_email
  info "Git user email is set to $git_user_email"
end

if ! set --query git_user_name
  git config --global user.name $git_user_name
  info "Git user name is set to $git_user_name"
end

git config --global core.editor vim

if ! set --query git_signing_key
  git config --global commit.gpgsign true
  git config --global gpg.format ssh
  git config --global user.signingKey $git_signing_key
end

