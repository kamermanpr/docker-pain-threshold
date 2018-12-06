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

#-- Install extra packages --#

RUN install2.r --error
	--deps TRUE \
	knitr \
	magrittr \
	readxl \
	skimr
