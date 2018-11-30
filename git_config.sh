#!/usr/bin/with-contenv bash

## Source: Derick Powell
## http://www.derekmpowell.com/posts/2018/02/docker-tutorial-3/

## Setup git user information
GIT_USER=${GIT_USER:=none}
GIT_EMAIL=${GIT_EMAIL:=none}

if [ "$GIT_USER" != none ]; then
	git config --global user.name $GIT_USER
	git config --global email $GIT_EMAIL
	git config --global credential.helper cache
fi
