# get author publications
library(here)
source(here::here("scripts/install.R"))

get_pubmed <- function(term) {
  pmids = rentrez::entrez_search("pubmed", term)
  fetch = rentrez::entrez_fetch("pubmed",pmids$ids,rettype = "xml", parsed = F) %>% xml2::read_xml() %>% xml2::as_list() %>% pluck(1)
  data = purrr::map_df(fetch, function(doc) {
    authorlist = doc %>% pluck("MedlineCitation","Article","AuthorList") %>% 
      keep(~ length(.x) >= 3)
    authors = map_chr(authorlist, function(.x) {
      initials = pluck(.x, "Initials",1)
      last_name = pluck(.x, "LastName",1)
      stringsAsFactors = F
      return(glue("{initials} {last_name}"))
    })
    first_author = glue('{pluck(authorlist, 1, "ForeName",1)} {pluck(authorlist, 1, "LastName",1)}')
    last_author = glue('{pluck(authorlist, length(authorlist), "ForeName",1)} {pluck(authorlist, length(authorlist), "LastName",1)}')
    doi = doc %>% pluck("PubmedData","ArticleIdList") %>% 
      keep(~ attr(.x,"IdType") == "doi") %>% 
      pluck("ArticleId",1)
    pubmed = doc %>% pluck("PubmedData","History") %>% 
      keep(~ attr(.x,"PubStatus") == "pubmed")
    pubyear = pubmed %>% pluck("PubMedPubDate","Year",1) 
    pubmonth = pubmed %>% pluck("PubMedPubDate","Month",1) 
    pubday = pubmed %>% pluck("PubMedPubDate","Day",1)
    pubdate = glue("{pubyear}-{pubmonth}-{pubday}") 
    title = doc %>% pluck("MedlineCitation","Article","ArticleTitle") %>% unlist() %>% paste0(collapse = "") 
    journal = doc %>% pluck("MedlineCitation","Article","Journal","Title",1)
    authors = paste(authors, collapse = ", ")
    message(glue("found paper published on {pubdate}"))
    return(list(title = title, authors = authors, pubdate = pubdate, journal = journal, doi = doi))
    })
  data = filter(data, !grepl("Erratum",data$title))
  data = filter(data, !grepl("Correction",data$title))
  return(data)
}

get_biorxiv <- function(dois) {
  
  fetch = map_df(dois, function(.x) {
    bio_pubs = biorxiv_content(doi = .x)
    doi = bio_pubs[[length(bio_pubs)]]$doi
    authorlist = gsub("\\. ","",bio_pubs[[length(bio_pubs)]]$authors) %>% gsub("\\.","",.) %>% strsplit("; ") %>% pluck(1)
    authorlist = map_chr(authorlist, function(.x){
      split = strsplit(.x,", ") %>% pluck(1)
      author = paste(split[2],split[1])
    })
    authors = paste(authorlist, collapse = ", ")
    title = bio_pubs[[1]]$title
    date = bio_pubs[[1]]$date
    pubd = bio_pubs[[1]]$published
    return(list(title = title, authors = authors, pubdate = date, journal = "BioRxiv", doi = doi, pubd = pubd))
  })
  
  return(fetch)
}