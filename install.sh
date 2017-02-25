#!/bin/bash

# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-which-directory-it-is-stored-in
# Gets original bash script
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

if [[ ":$PATH:" == *":$DIR:"* ]] || grep -e "$DIR" "$HOME/.bashrc" > /dev/null ; then
    echo "your PATH already contains $DIR"
else
    echo "adding $DIR to end of PATH"
    echo >> "$HOME/.bashrc"
    echo "# This line was automatically added by install.sh from" >> "$HOME/.bashrc"
    echo "# $DIR" >> "$HOME/.bashrc"
    echo "export PATH=\"\$PATH:$DIR\"" >> "$HOME/.bashrc"
    echo "done. now run this to finish: source ~/.bashrc"
fi
    

