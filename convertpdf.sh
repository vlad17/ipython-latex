#!/bin/bash
# Convert ipynb to pdf. Should be run twice at the same time.
# creates src.pdf

set -e

if [ $# -ne 2 ]; then
    >&2 echo "Usage: convertpdf.sh title src.ipynb"
    exit 1
fi

TITLE="$1"
SRCFILE=$(readlink -f "$2")

# http://stackoverflow.com/questions/2683279/how-to-detect-if-a-script-is-being-sourced
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    >&2 echo "This script should not be sourced"
    exit 1
fi

# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-which-directory-it-is-stored-in
# Gets original bash script
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

if [ ! -f "$DIR/template.tplx" ]; then
    >&2 echo "Expected file template.tplx to exist in script dir $DIR"
    exit 1
fi

cd /tmp

TEMPLATE=template-$BASHPID.tplx

sed -e "s/<TODO INSERT TITLE HERE>/$TITLE/g" "$DIR/template.tplx" > $TEMPLATE

jupyter nbconvert --to pdf --template $TEMPLATE $SRCFILE 
