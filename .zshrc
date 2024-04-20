# Below are custom settings

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# init pure prompt
autoload -U promptinit; promptinit
prompt pure

# Enable syntax highlighting (like fish)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bindkey to move cursor
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
