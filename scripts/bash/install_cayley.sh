#!/bin/bash

TMP_DIR=tmp
mkdir -p "$TMP_DIR"

MACHINE=`uname -s`

APP_ROOT=`pwd`
CAYLEY_ROOT=bin/cayley
CAYLEY_CONFIG=bin/cayley.cfg
DB_TYPE=mem

function download_cayley {

    if [ "$MACHINE" = "Darwin" ]
    then
        CAYLEY_VERSION=cayley_0.4.1_darwin_amd64
        CAYLEY_ARCHIVE=$CAYLEY_VERSION.zip
    elif [ "$MACHINE" = "Linux" ]
    then
        CAYLEY_VERSION=cayley_0.4.1_linux_amd64
        CAYLEY_ARCHIVE=$CAYLEY_VERSION.tar.gz
    else
        echo "No relese archive found"
        exit
    fi

    if [ -e "$TMP_DIR/$CAYLEY_ARCHIVE" ]
    then
        echo "Found Cayley relese archive: $TMP_DIR/$CAYLEY_ARCHIVE"
    else
        echo "No release archive found"
        exit 1
    fi

    echo "Removing old Cayley installation..."
    rm -Rf "$CAYLEY_ROOT"

    mkdir -p bin

    echo "Unpacking Cayley in: bin"

    pushd bin > /dev/null
    tar -xzf ../"$TMP_DIR/$CAYLEY_ARCHIVE"
    popd > /dev/null

    mv "bin/$CAYLEY_VERSION" "$CAYLEY_ROOT"
}

function install_cayley {

    if [ -e "$CAYLEY_ROOT/cayley" ]
    then
        echo "Found Cayley installation in: $CAYLEY_ROOT"
    else
        echo "Installing Cayley in: $CAYLEY_ROOT"
        download_cayley
    fi

    echo "Initializing cayley database"

    # check for a configuration file
    if [ -e "$CAYLEY_CONFIG" ] && [ "$DB_TYPE" != "mem" ]
    then
        echo "Configuration file found in: $CAYLEY_CONFIG"

        # initialize cayley
        cd "$CAYLEY_ROOT"
        `./cayley init --config=$APP_ROOT/$CAYLEY_CONFIG`
    else
        echo "Using default"
    fi
}

install_cayley