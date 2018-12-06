###############################################################################
# 									                                                          #
# KAMERMANPR/PAIN-THRESHOLD  				                                        #
#									                                                            #
###############################################################################

#-- Get the verse rocker image --#

FROM rocker/verse:3.5.1

MAINTAINER Peter Kamerman <peter.kamerman@gmail.com>

#-- Run shell scripts --#
# Copying git_config.sh into /etc/cont-init.d sets it to run at startup

COPY git_config.sh /etc/cont-init.d/gitconfig

#-- Install rgl (required for boot) package dependencies --#

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    	xorg \
	ibx11-dev \
    	libglu1-mesa-dev \
	libfreetype6-dev

#-- Install extra packages --#

RUN install2.r --error
	--deps TRUE \
	boot \
	knitr \
	magrittr \
	readxl \
	skimr
