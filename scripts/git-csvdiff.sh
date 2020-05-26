#!/bin/bash

SCRIPTROOT=$(cd `dirname $0` && pwd)

# See https://git-scm.com/docs/git-difftool 
git difftool -y --extcmd="$SCRIPTROOT/git-csvdiff-wrapper.sh" $@