# kalkayan's linux configs - the seperation of this from bashrc was done on purpose
for file in ~/.{path,exports,aliases,functions,extra}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
