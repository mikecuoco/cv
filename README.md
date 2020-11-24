# Mike Cuoco's Curriculum Vitae

[![R build status](https://github.com/mikecuoco/cv/workflows/check-and-build/badge.svg)](https://github.com/mikecuoco/cv/actions)

Academic CV built using R - updated automatically from PubMed and BioRxiv every day. See below for repository structure, tool links and to dos.

## Structure

-   `cv/cv.Rmd`: CV structure implemented as an [`{rmarkdown}`](https://rmarkdown.rstudio.com) document.
-   `scripts/install.R`: Installs/loads all `R` dependencies using the [`{pacman}`](https://github.com/trinker/pacman) :package:.
-   `scripts/pubfetch.R`: Functions for fetching papers from PubMed and BioRxiv using [`{rentrez}`](https://github.com/ropensci/rentrez) and [`{rbiorxiv}`](https://github.com/nicholasmfraser/rbiorxiv)

## Tools

-   [`{vitae}`](https://docs.ropensci.org/vitae/) :package: is used to provide a CV template.
-   [`{rentrez}`](https://github.com/ropensci/rentrez) :package: to pull papers from PubMed using Entrez.
-   [`{rbiorxiv}`](https://github.com/nicholasmfraser/rbiorxiv) :package: to pull papers from BioRxiv.
-   [`{googlesheets4}`](https://github.com/tidyverse/googlesheets4) :package: to pull CV data from a googlesheet (must be public)

## To do

-   [x] successfully build

-   [x] add biorxiv updating

    -   [ ] refresh oauth token every week

-   [ ] use docker to containerize

-   [ ] fix margins (locations are offset)

-   [ ] add total citations (use google scholar)

-   [ ] integrate with personal website
