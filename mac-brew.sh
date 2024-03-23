#!/bin/bash

printf "hi, this bash script installs some brew packages, and is located at:\n$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )\nplease edit this to your preferences.\n"
read -p "if you have already carefully edited this bash script, input y to run. " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1



# common

brew install wget

brew install git

brew install tree



# cli operations on media files

brew install ffmpeg

# use ai models in cli
# brew install aichat


# autosuggestions
brew install zsh-autosuggestions



# python stuff

brew install python3
brew install poetry
brew install pypy3



# cli image operations and metadata reading
brew install imagemagick


# the most popular open source file sync tool.
# homwbrew will tell you how to open this every time you log in
# do configurations with web ui at http://localhost:8384
brew install syncthing

# lightweight disk usage analyzer in the cli
brew install dua-cli

# hugo is a static site generator
brew install hugo


# all things related to node.js
brew install nodejs
# bun is a fast node package manager
brew tap oven-sh/bun
brew install bun


# fast terminal-ui for git written in rust
brew install gitui

# other
## building c software
brew install cmake
## the go programming language
brew install go
## the rust programming language
brew install rust


# cli app for webp image format operations
brew install webp

# app fot video processing to gif
brew install gifski

# mac custom keymap settings tool
# this is very powerful input tool, but configuration can be hard. seek documentation at https://github.com/yqrashawn/GokuRakuJoudo
brew install yqrashawn/goku/goku
brew services start yqrashawn/goku/goku

# full-featured command-line application for reading and writing meta information in a wide variety of files
brew install exiftool
