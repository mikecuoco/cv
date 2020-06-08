# Mike Cuoco's Curriculum Vitae

Forked from [seabbs/cv](https://github.com/seabbs/cv)

[//]: <> (commented out below:)
[//]: <> ([![Travis-CI Build Status](https://travis-ci.org/seabbs/cv.svg?branch=master)](https://travis-ci.org/seabbs/cv))

Academic CV built using R - updated automatically from [Google Scholar](https://scholar.google.com/citations?user=GqZm90IAAAAJ&hl=en) each week. See below for repository structure, tool links and to dos. Please feel free to fork this repository for your own use but please let me know of any improvements that you make (so I can steal them).

## Structure

- `cv/cv.Rmd`: CV structure implemented as an [`{rmarkdown}`](https://rmarkdown.rstudio.com) document.
- `scripts/install.R`: Installs/loads all `R` dependencies using the [`{pacman}`](https://github.com/trinker/pacman) :package:.
- `tic.R`: Uses [`{tic}`](https://github.com/ropenscilabs/tic.website) to define the [Travis CI](https://travis-ci.org) build and deployment steps.
- `Dockerfile`: Specifies the [docker](https://www.docker.com) environment. 
- `.travis.yml`: Specifies the remote building of the CV on [Travis CI](https://travis-ci.org). Automated using [`{tic}`](https://github.com/ropenscilabs/tic.website).

## Tools

- The [`{vitae}`](https://docs.ropensci.org/vitae/) :package: is used to provide a CV template.
- [`{tidyverse}`](https://www.tidyverse.org) :tool: are used for data read in and manipulation.
- [`{here}`](https://here.r-lib.org) :package: for path management.
- [`{scholar}`](https://github.com/jkeirstead/scholar) :package: is used to pull papers from Google Scholar.
- [`{googlesheets4}`](https://github.com/tidyverse/googlesheets4) :package: is used to pull CV data from a googlesheet (must be public)
- [`{tinytex}`](https://github.com/yihui/tinytex) :package: to manage LaTex installation and additional packages.
- [`{tic}`](https://github.com/ropenscilabs/tic.website) :package: to manage CV building and deployment on [Travis CI](https://travis-ci.org).
- [Travis CI](https://travis-ci.org) is used for building the CV each week.
- [Docker](https://www.docker.com) and [Docker Hub](https://hub.docker.com) is used to ensure a reproducible environment.

## To do

- [ ] Fix Teaching, Training, and Service sections to have "WHAT" be the main header
- [ ] Fix Experience section dates
- [ ] better formatting for publications
  - [ ] list all authors
  - [ ] omit duplicates and posters
  - [ ] Paper title be item title
  - [ ] Highlight my name
- [ ] Programmatic short/long academic CVs
- [ ] Non-academic CVs
- [ ] Improved list structure for the service section

