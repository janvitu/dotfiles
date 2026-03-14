#!/bin/bash
workdir="/Users/"$(whoami)""
currdir="$(pwd)/.zshrc"
zshCust="$workdir/.oh-my-zsh/custom"

#check for machine system
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine="Linux";;
    Darwin*)    machine="Mac";;
    CYGWIN*)    machine="Cygwin";;
    MINGW*)     machine="MinGw";;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [[ ! -f "$workdir/.oh-my-zsh" ]]; then

	#Check if custom plugins are installed
	#check zsh-autosuggestions
	if [[ -f "$zshCust/plugins/zsh-autosuggestions" ]]; then
		git clone https://github.com/zsh-users/zsh-autosuggestions.git "$zshCust/plugins/zsh-autosuggestions"
	fi
	#check zsh-syntax-highlighting
	if [[ -f "$zshCust/plugins/zsh-syntax-highlighting" ]]; then
		git clone git://github.com/zsh-users/zsh-syntax-highlighting.git "$zshCust/plugins/zsh-syntax-highlighting"
	fi
else
	if ["$machine"=="Mac"]; then
		brew install zsh zsh-completions	
		chsh -s /bin/zsh
	elif ["$machine"=="Linux"]; then
		sudo apt-get install zsh
	fi
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	git clone https://github.com/zsh-users/zsh-autosuggestions.git "$zshCust/plugins/zsh-autosuggestions"
	git clone git://github.com/zsh-users/zsh-syntax-highlighting.git "$zshCust/plugins/zsh-syntax-highlighting"
fi

if [[ ! -f "$workdir/.zshrc" ]]; then
	rm -r "$workdir/.zshrc"
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
ln -s "$currdir" "$workdir/.zshrc"

# Claude Code starship statusline
mkdir -p "$workdir/.claude"
ln -sf "$workdir/.dotfiles/starship-claude.toml" "$workdir/.claude/starship.toml"
chmod +x "$workdir/.dotfiles/starship-claude"
