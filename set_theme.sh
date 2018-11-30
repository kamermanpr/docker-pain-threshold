#!/usr/bin/with-contenv bash

## Source: Derick Powell
## http://www.derekmpowell.com/posts/2018/02/docker-tutorial-3/

## Setup Rstudio default theme
THEME=${THEME:=none}

if [ "$THEME" != none ]; then
	mkdir -p /home/rstudio/.rstudio/monitored/user-settings
	echo "uiPrefs={\"theme\" : \"$THEME\"}" > \
	/home/rstudio/.rstudio/monitored/user-settings/user-settings
	chown -R rstudio /home/rstudio
fi
