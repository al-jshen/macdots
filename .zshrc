# .zshrc
setopt autocd


### Added by Zplugin's installer
source '/Users/js/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk


# | completions | #
zplugin ice blockf wait lucid  
zplugin light zsh-users/zsh-completions

zplugin ice wait lucid atload"_zsh_autosuggest_start"
zplugin light zsh-users/zsh-autosuggestions


# | highlighting | #
zplugin ice wait lucid atinit'zpcompinit; zpcdreplay'
zplugin light zdharma/fast-syntax-highlighting


# | prompt | #
zplugin ice wait lucid pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure
prompt_newline='%666v'
PROMPT=" $PROMPT"


# | exports | #
export EDITOR='nvim'
export LSCOLORS="gxBxhxDxfxhxhxhxhxcxcx"


# | aliases | #
alias gc='git clone'
alias gp='git push -u origin master'
alias gs='git status'
alias ga='git add --all'
alias gm='git commit -m'
alias gfp='git fetch --all && git reset --hard origin/master'
alias grao='git remote add origin'
alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
alias extip='curl ipinfo.io/city; curl ipinfo.io/country; curl ipinfo.io/ip'
alias pid='while read c1 c2 c3; do echo $c2; done'
alias mpv='mpv --sub-scale=0.4'
alias l='ls -alGH'
alias ...='cd ../..'
alias ....='cd ../../..'
alias md='mkdir'
alias rd='rmdir'
alias vim='nvim'
alias v='nvim'

# | custom functions | #
vcomp() {
	ffmpeg -i $1 -vcodec libx264 -crf 20 $2
}

vtrim() {
    ffmpeg -i $1 -ss $2 -to $3 -c:v copy -c:a copy $4

}

audex() {
    ffmpeg -i $1 -vn -acodec copy $2
}

fkill() {
    for PRCS in `ps -ef | grep -e $1 | pid`; do
        kill $PRCS;
    done
}
