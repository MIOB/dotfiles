#!/usr/bin/env fish

if status is-interactive
  stty intr ^J
  bind \cj cancel-commandline
end

set --export LANGUAGE en_US.UTF-8
set --export LC_ALL en_US.UTF-8

set --export EDITOR vim
