#!/bin/bash

set -e

function uuid_copy() {
    echo ${UUID} | tr -d "[:space:]" | pbcopy
}

COPY=0
while (( "$#" )); do
    case "$1" in
        -c)
            COPY=1
            shift
            ;;
        --) # end argument parsing
            shift
            ;;
        -*) # unsupported flags
            echo "Error: Unsupported flag $1" >&2
            exit 1
            ;;
        *) # preserve positional arguments
            PARAMS="$PARAMS $1"
            shift
            ;;
    esac
done

eval set -- "$PARAMS"

UUID=$(uuidgen | tr "[:upper:]" "[:lower:]")

echo $UUID

[[ ${COPY} -eq 1 ]] && uuid_copy
