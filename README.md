# docker-incidentHIVSN

A dockerfile to create an image of the R environment required to run the 'incidentHIVSN' data analysis scripts ([_kamermanpr/incidentHIVSN_](https://github.com/kamermanpr/SPARS)).

----

## R environment

The image is built using the [rocker/verse](https://hub.docker.com/r/rocker/verse/) image of [_base R_](https://cran.r-project.org/) _v3.4.1_, and includes [_RStudio server_](https://www.rstudio.com/products/rstudio/#Server), the [_TinyTex_](https://yihui.name/tinytex/) Latex distribution, the [_tidyverse_](https://www.tidyverse.org/) suite of R packages (with dependencies), and several R packages (with dependencies) that are required to run the markdown scripts in [SPARS](https://github.com/kamermanpr/SPARS). CRAN packages were installed from [MRAN](https://mran.microsoft.com/timemachine) using the 2017-09-01 snapshot for _R v3.4.1_. The only package installed form GitHub (_thomasp85/patchwork_) was locked to the 19 December 2017 commit: [_b5cbd3088e44f852625dc0a4160335f7aa5e4709_](https://github.com/thomasp85/patchwork/tree/b5cbd3088e44f852625dc0a4160335f7aa5e4709).

### Details
- **OS:**  
    - Debian:stretch _(all kamermanpr/docker-spars version tags < v2.0.0)_   
- **R:**  
    - v3.4.1  
- **RStudio server:**  
    - v1.1.456 _(all kamermanpr/docker-spars version tags < v2.0.0)_  
- **GitHub packages:**  
    - patchwork  
- **MRAN packages:**  
    - boot  
    - car  
    - coin  
    - epitools  
    - ggplot2  
    - lme4  
    - lmerTest  
    - ResourceSelection  
    - rms  
    - survminer  
    - survival  
    - tidyverse 
- **LaTex:**   
    - TinyTex

----

## Using Docker to run the SPARS analysis

You need to have Docker installed on your computer. To do so, go to [docker.com](https://www.docker.com/community-edition#/download) and follow the instructions for downloading and installing Docker for your operating system. Once Docker has been installed, follow the steps below, noting that Docker commands are entered in a terminal window (Linux and OSX/macOS) or command prompt window (Windows). Windows users also may wish to install [_GNU Make_](http://gnuwin32.sourceforge.net/downlinks/make.php) (required for the `make` method of running the scripts) and [_Git_](https://gitforwindows.org/) version control software (not essential). 

#### Download the latest image

Enter: `docker pull kamermanpr/docker-incidentHIVSN:v1.0.1`

#### Run the container

Enter: `docker run -d -p 8787:8787 -v </PATH>:/home/rstudio --name hivsn kamermanpr/docker-incidentHIVSN:v1.0.1`

Where `</PATH>` refers to the path to the SPARS directory on your computer, which you either cloned from GitHub ([_kamermanpr/incidentHIVSN_](https://github.com/kamermanpr/incidentHIVSN), `git clone https://github.com/kamermanpr/incidentHIVSN`), or downloaded and extracted from figshare ([DOI: 10.6084/m9.figshare.???????](https://doi.org/10.6084/m9.figshare.???????)).

#### Login to RStudio Server

- Open a web browser window and navigate to: `localhost:8787`

- Use the following login credentials: 
    - Username: _rstudio_	
    - Password: _rstudio_
    
#### Prepare the incidentHIVSN directory

The incidentHIVSN directory comes with the outputs for all the analysis scripts in the _/outputs_ directory (_html_ and *md* formats). However, should you wish to run the scripts yourself, there are several preparatory steps that are required:  

1. Acquire the data. The data required to run the scripts have not been included in the repo because participants in the studies did not consent to public release of their data. However, the data are available on request from Peter Kamerman (peter.kamerman@gmail.com). Once the data have been obtained, the files should be copied into the _/data_ subdirectory.

2. Clean the _/outputs_ directory by entering `make clean` in the _Terminal_ tab in RStudio.

#### Run the incidentHIVSN analysis scripts

To run all the scripts (including the data cleaning scripts), enter `make all` in the _Terminal_ tab in RStudio. 

To run individual RMarkdown scripts (_\*.Rmd_ files)

1. Generate the cleaned data using one of the following methods:  
    - Enter `make data-cleaned/????.rds` in the _Terminal_ tab in RStudio.  
    - Enter `source('clean-data.R')` in the _Console_ tab in RStudio.  
    - Open the _clean-data.R_ script through the _File_ tab in RStudio, and then click the **'Source'** button on the right of the _Script_ console in RStudio for each script.  
    
2. Run the individual script by:  
    - Entering `make outputs/<NAME_OF_INPUT_FILE>.html` in the _Terminal_ tab in RStudio, **OR**
    - Opening the relevant _\*.Rmd_ file through the _File_ tab in RStudio, and then clicking the **'knit'** button on the left of the _Script_ console in RStudio. 

#### Shutting down

Once done, log out of RStudio Server and enter the following into a terminal to stop the Docker container: `docker stop hivsn`. If you then want to remove the container, enter: `docker rm hivsn`. If you also want to remove the Docker image you downloaded, enter: `docker rmi kamermanpr/docker-incidentHIVSN:v1.0.1`
