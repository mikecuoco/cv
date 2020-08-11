# Mike Cuoco's Curriculum Vitae

[![R build status](https://github.com/mikecuoco/cv/workflows/check-and-build/badge.svg)](https://github.com/mikecuoco/cv/actions)

Academic CV built using R - updated automatically from PubMed and BioRxiv every day. See below for repository structure, tool links and to dos. 

## Structure

- `cv/cv.Rmd`: CV structure implemented as an [`{rmarkdown}`](https://rmarkdown.rstudio.com) document.
- `scripts/install.R`: Installs/loads all `R` dependencies using the [`{pacman}`](https://github.com/trinker/pacman) :package:.
- `scripts/pubfetch.R`: Functions for fetching papers from PubMed and BioRxiv using [`{rentrez}`](https://github.com/ropensci/rentrez) and [`{rbiorxiv}`](https://github.com/nicholasmfraser/rbiorxiv)

## Tools

- The [`{vitae}`](https://docs.ropensci.org/vitae/) :package: is used to provide a CV template.
- [`{tidyverse}`](https://www.tidyverse.org) :tool: are used for data read in and manipulation.
- [`{here}`](https://here.r-lib.org) :package: for path management.
- [`{rentrez}`](https://github.com/ropensci/rentrez) :package: to pull papers from PubMed using Entrez.
- [`{rbiorxiv}`](https://github.com/nicholasmfraser/rbiorxiv) :package: to pull papers from BioRxiv.
- [`{googlesheets4}`](https://github.com/tidyverse/googlesheets4) :package: to pull CV data from a googlesheet (must be public)
- [`{tinytex}`](https://github.com/yihui/tinytex) :package: to manage LaTex installation and additional packages.

## To do

- [X] successfully build 
- [X] add biorxiv updating
  - [ ] refresh oauth token every week
- [ ] add total citations
- [ ] integrate with persional website

