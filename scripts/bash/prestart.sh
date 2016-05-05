#!/bin/bash

THIS_DIR=`dirname $0`

# ==============================================================================
# run cayley server
# ==============================================================================

APP_ROOT=`pwd`
CAYLEY_PORT=64210

CAYLEY_ROOT=bin/cayley
CAYLEY_CONFIG=bin/cayley.cfg
CAYLEY_DEFAULT_DB=bin/default.nq
DB_TYPE=mem

# check if a cayley instance is already running and kill it 
CAYLEY_PROCESS_PID=`lsof -iTCP:$CAYLEY_PORT -sTCP:LISTEN -t`
if [ "$CAYLEY_PROCESS_PID" ]
then
    echo "Found cayley process"
else
    # check if cayley is installed
    if [ -e "$CAYLEY_ROOT/cayley" ]
    then
        echo "Found Cayley installation in: $CAYLEY_ROOT"
    else
        "$APP_ROOT/scripts/bash/install_cayley.sh"
    fi

    # check for a configuration file
    if [ -e "$CAYLEY_CONFIG" ] && [ "$DB_TYPE" != "mem" ]
    then
        echo "Configuration file found in: $CAYLEY_CONFIG"

        # start cayley with config file
        cd "$CAYLEY_ROOT"
        `./cayley http --config=$APP_ROOT/$CAYLEY_CONFIG > /dev/null &`
    else
        echo "Using default"

        # start cayley with default settings
        cd "$CAYLEY_ROOT"
        `./cayley http --dbpath=$APP_ROOT/$CAYLEY_DEFAULT_DB > /dev/null &`
    fi
fi


# ==============================================================================
# watch client file changes
# ==============================================================================

#PID_FILE=.flow-pack
#INITIAL_TIMEOUT=2

#if [ "$NODE_ENV" != "production" ]
#then
#    flow-pack -d -w . &
#    echo $! > .flow-pack
#    "$THIS_DIR/stop_watchify.sh" "$PID_FILE" "$INITIAL_TIMEOUT" &
#fi
