# .zshrc
setopt autocd # cd without typing cd
setopt rm_star_silent # dont ask to confirm rm


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

# completion when typing middle of word
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# shift tab to go through completion menu backwards
bindkey '^[[Z' reverse-menu-complete


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
alias gcmsg='git commit -m'
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
alias st='say testing sound'
alias clss='rm -r /Users/js/screenshots/*'
alias updatedb='/usr/libexec/locate.updatedb'

# | custom functions | #
vcomp() {
	ffmpeg -i $1 -vcodec libx264 -crf 20 $2
}

vconv() {
    ffmpeg -i $1 -codec copy $2
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

gitforkeven() {
    git remote add upstream $1
    git fetch upstream
    git pull upstream master
    git push
}

pdftex() {
    pdflatex -interaction=nonstopmode $1
    bname=$(basename $1 .tex)
    bname+=".pdf"
    open $bname
}
