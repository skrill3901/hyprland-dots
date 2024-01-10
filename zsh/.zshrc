export PATH="$HOME/.local/bin:$PATH"

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# supercharge  
plug "zap-zsh/supercharge"

# exa (always use it after supercharge)
plug "zap-zsh/exa"

# auto suggestions
plug "zsh-users/zsh-autosuggestions"

# syntax highlight
plug "zsh-users/zsh-syntax-highlighting" "122dc46"

# zap prompt (theme)
plug "zap-zsh/atmachine-prompt"

# zsh
plug "esc/conda-zsh-completion"

# vim
alias nvim='lvim'
alias lvimconfig='lvim ~/.config/lvim/config.lua'

# zsh 
alias zshconfig="lvim ~/.zshrc"
alias hyprconfig="lvim ~/.config/hypr/hyprland.conf"

#file manipulation
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias mkdir="mkdir -pv"
alias snan="sudo nano"

#update packages
alias upd="sudo pacman -Syu"

#show active ports
alias ports="sudo lsof -i -P -n | grep LISTEN"

#torrserve
alias toron="systemctl start torrserver.service"
alias toroff="systemctl stop torrserver.service"

#wireguard
alias wgon="wg-quick up wg0"
alias wgof="wg-quick down wg0"

# cat
# alias cat='bat'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'

# ls
alias ls="exa -la --icons"
alias lst="exa -a --icons --tree -I .git"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/rorschach/.bun/_bun" ] && source "/home/rorschach/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
