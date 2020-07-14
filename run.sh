#!/bin/sh

# only /tmp will be writeable
XDG_CACHE_HOME=/tmp/.cache factor -roots=/solution -run=app "$@" || echo "run error code: $?"
