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

# <-- Add GitHub package -->
# Lock thomasp85/patchwork installation to 22 September 2018 commit: fd7958bae3e7a1e30237c751952e412a0a1d1242

RUN Rscript -e "devtools::install_github('thomasp85/patchwork', ref = 'fd7958bae3e7a1e30237c751952e412a0a1d1242')"

#-- Install extra packages --#

RUN install2.r --error --deps TRUE \
	boot \
	car \
	coin \
	ggplot2 \
	glmnetUtils \
	knitr \
	lmerTest \
	LogisticDx \
	lubridate \
	magrittr \
	readxl \
	rcompanion \
	skimr \
	survival \
	survminer \
