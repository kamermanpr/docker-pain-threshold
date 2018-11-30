###############################################################################
# 									                                                          #
# KAMERMANPR/HIVSN-INCIDENCE  				                                        #
#									                                                            #
###############################################################################

#-- Get the verse rocker image --#

FROM rocker/verse:3.5.1

MAINTAINER Peter Kamerman <peter.kamerman@gmail.com>

#-- Run shell scripts --#
# Copying git_config.sh into /etc/cont-init.d sets it to run at startup

COPY git_config.sh /etc/cont-init.d/gitconfig
COPY set_theme.sh /etc/cont-init.d/theme

#-- Install extra packages --#

RUN install2.r --error --deps TRUE \
	boot \
	car \
	coin \
	glmnetUtils \
	knitr \
	lmerTest \
	LogisticDx \
	lubridate \
	magrittr \
	patchwork \
	readxl \
	rcompanion \
	skimr \
	survival \
	survminer \
