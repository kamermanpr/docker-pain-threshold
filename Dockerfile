###############################################################################
# 									      #
# KAMERMANPR/DOCKER-PAIN-THRESHOLD					      #
#									      #
# Build an image with the environment required to run the pain thresholds     # # analysis                                                                    #
#                                                                             #
# <-- Build command -->                                                       #
# docker build -t kamermanpr/docker-pain-threshold:<version>                  #
#                                                                             #
# <-- The build image can be downloaded from Docker Hub -->                   #
# docker pull kamermanpr/docker-pain-threshold:<version>                      #
#									      #
# <-- Run command -->                                                         #
# docker run --name pain -d -p 8787:8787 -v </PATH>:/home/user \              #
# -e USER=user -e PASSWORD=password kamermanpr/docker-pain-threshold:<version>#
#									      #
# <-- Login to RStudio -->                                                    #
# In your browser, navigate to: localhost:8787			              #
# Username: user							      #
# Password: password							      #
#                                                                             #
###############################################################################
#
# <-- Base image -->
# Debian:stretch
# R v3.5.1
# RStudio server:v1.1.456
# LaTex (TinyTex distribution, https://yihui.name/tinytex/)
# tidyverse (MRAN 2019-01-12 R v3.5.1 snapshot)
#
#-- Get the verse rocker image --#
#
FROM rocker/verse:3.5.1
#
MAINTAINER Peter Kamerman <peter.kamerman@gmail.com>
#
#-- Run shell scripts --#
# Copying git_config.sh into /etc/cont-init.d sets it to run at startup
#
COPY git_config.sh /etc/cont-init.d/gitconfig
#
# <-- Add MRAN packages -->
#
RUN Rscript -e "install.packages(c('magrittr', 'readxl', 'knitr', 'skimr', 'boot'))"