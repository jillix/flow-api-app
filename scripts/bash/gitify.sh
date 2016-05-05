#!/bin/bash

TARGET_DIR=$1
CLONE_URL=$2

pushd $TARGET_DIR > /dev/null
ABS_TARGET_DIR=`pwd`
popd > /dev/null

function printHelp {
    echo "    Usage:" >&2
    echo "        gitify <target_dir> [<git_clone_url>]" >&2
    echo "" >&2
    echo "    If git_clone_url is not provided, we will try to read it from the package.json installed by npm inside the module." >&2
}

if [ ! -d "$TARGET_DIR" ]
then
    echo "Please provide the target_dir of the module to clone" >&2
    printHelp
    exit 1
fi

if [ -d "$TARGET_DIR/.git" ]
then
    echo "$TARGET_DIR is already a git repo" >&2
    exit 2
fi

# check or autodetect the git_clone_url
if [ -z "$CLONE_URL" ]
then
    if [ ! -f "$TARGET_DIR/package.json" ]
    then
        echo "Please provide the git_clone_url of the module to clone" >&2
        printHelp
        exit 3
    fi

    CLONE_URL=$(node --eval "console.log(require('$ABS_TARGET_DIR/package.json')._requested.hosted.ssh)")
    if [ $? -gt 0 -o -z $CLONE_URL ]
    then
        echo "Could not determine the git_clone_url based on the npm installed module package.json" >&2
        printHelp
        exit 4
    fi
fi

TEMP_DIR="$TARGET_DIR/../temp_$RANDOM"
git clone "$CLONE_URL" "$TEMP_DIR"
if [ $? -gt 0 ]
then
    exit 5
fi

mv "$TEMP_DIR/.git" "$TARGET_DIR"
rm -Rf "$TEMP_DIR"

pushd "$TARGET_DIR" > /dev/null

# .gitignore is transformed into .npmignore by npm
git checkout .gitignore
rm -f .npmignore

# package.json is changed by npm
git checkout package.json

popd > /dev/null
