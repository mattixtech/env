if [ -d ~/.bash_completion.d ]; then
    for file in ~/.bash_completion.d/*; do
        . $file
    done
fi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
