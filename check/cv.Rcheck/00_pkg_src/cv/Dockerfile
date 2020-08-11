## Start with the shiny docker image
FROM rocker/tidyverse:latest

MAINTAINER "Sam Abbott" contact@samabbott.co.uk

ADD . /home/rstudio/cv

WORKDIR /home/rstudio/cv
## Install dev deps
sudo add-apt-repository -y ppa:chris-lea/libsodium
sudo apt-get update -q
sudo apt-get install -y libsodium-dev
RUN Rscript scripts/install.R

## Install the getTBinR
RUN Rscript -e 'tinytex::install_tinytex()'