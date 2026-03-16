eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# Added by Obsidian
export PATH="$PATH:/Applications/Obsidian.app/Contents/MacOS"
