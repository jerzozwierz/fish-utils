#!/bin/bash
# appreciate the irony

if grep -q "jerzozwierz zsh" ~/.zshrc; then
	echo "source $(PWD)/zsh/functions.zsh # jerzozwierz zsh" >> ~/.zshrc
fi

