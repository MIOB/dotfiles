#!/usr/bin/env bash

if [[ $(dpkg-query --show --showformat='${db:Status-Status}\n' fish 2> /dev/null) != installed ]]
then
  echo "Installing fish..."
  sudo apt-add-repository ppa:fish-shell/release-3 -y
  sudo apt update
  sudo apt install fish -y
  echo "Fish has been installed"
else
  echo "Fish is already installed"
fi

./bootstrap.fish
