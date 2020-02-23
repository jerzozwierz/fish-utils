#!/bin/bash
# appreciate the irony

mkdir -p ~/.config/fish/conf.d
mkdir -p ~/.config/fish/functions
cp ./conf.d/*.fish ~/.config/fish/conf.d/
cp ./functions/*.fish ~/.config/fish/functions/

