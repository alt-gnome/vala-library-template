#!/bin/bash

HELP="
Using:
    $ sh setup-space.sh LIBRARY-NAME

LIBRARY-NAME MUST be kebsb-case string

DEVELOPER-LINK can be <email>

You can write \"--help\" or \"-h\" to show this message.
"

if [ $# -eq 0 ]; then
    echo "Nothing to do. You can write \"--help\" or \"-h\" to show help message."
    exit 1
fi

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "$HELP"
    exit 0
fi

LIB_NAME="$1"

GIR_NAME=$(echo $LIB_NAME | awk -F - '{printf "%s", $1; for(i=2; i<=NF; i++) printf "%s", toupper(substr($i,1,1)) substr($i,2); print"";}' | awk '{$1=toupper(substr($1,0,1))substr($1,2)}1')

find ./ -type f -exec sed -i "s/<<LIB-NAME>>/$LIB_NAME/g" {} +
find ./ -type f -exec sed -i "s/<<GIR-NAME>>/$GIR_NAME/g" {} +

rm ./setup-space.sh
rm ./test-template.sh
