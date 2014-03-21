#!/bin/bash

GHOST="/ghost"

GHOST_CUSTOM="/ghost-custom"
CONTENT="$GHOST_CUSTOM/content"
DEFAULT="$GHOST/content"

CONFIG="config.js"

# Make sure we're in ghost directory
cd $GHOST

# Symlink the js file
if [[ -f "$GHOST_CUSTOM/$CONFIG" ]]; then
    rm -f "$GHOST/$CONFIG"
    ln -s "$GHOST_CUSTOM/$CONFIG" "$GHOST/$CONFIG"
fi

# Removes directories from the ghost default
# if those directories are already present in
# the custom content directory.
#
# Symlinks custom directories
for i in $( ls $CONTENT ); do
    if [[ -d "$DEFAULT/$i" ]]; then
        rm -rf "$DEFAULT/$i"
        ln -s "$CONTENT/$i" "$DEFAULT/$i"
    fi
done

# Startup the blog
forever start index.js

# Start nginx
service nginx start
