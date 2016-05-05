#!/bin/bash


# code bundling
if [ "$NODE_ENV" != "production" ]
then
    DEV_PARAM=-d
fi
flow-pack $DEV_PARAM .

# also bundle flow-app 
BUNDLE_NAME=flow-app
echo "Manual bundle: $BUNDLE_NAME"
browserify node_modules/$BUNDLE_NAME $DEV_PARAM -o .bundles/$BUNDLE_NAME -t [ babelify --presets [ es2015 ] ]
gzip -f -S .js .bundles/$BUNDLE_NAME
