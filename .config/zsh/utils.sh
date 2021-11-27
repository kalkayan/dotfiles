# Log
function print () {
    [ $# -eq 2 ] && echo -e "$1$2\033[0m" || echo "$1"
}