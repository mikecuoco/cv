# get author publications
require(rentrez)
require(biorrxiv)
require(dplyr)
require(purrr)
require(xml2)

get_pubmed <- function(term) {
  pmids = rentrez::entrez_search("pubmed", term)
  fetch = purrr::map_df(pmids$ids, function(.x) {
    doc = rentrez::entrez_fetch("pubmed",.x,rettype = "xml", parsed = F) %>% xml2::read_xml()
    authors = doc %>% xml2::xml_find_all("//Author") %>% 
      map_chr(function(.x) {
        initials = xml_find_first(.x, "./Initials") %>% xml_text
        last_name = xml_find_first(.x, "./LastName") %>% xml_text
        stringsAsFactors = FALSE
        return(glue("{initials}, {last_name}"))
      })
    doi = doc %>% xml2::xml_find_all("//PubmedData/ArticleIdList/ArticleId") %>% xml2::as_list()
    pubyear = xml_find_all(doc, "//PubDate/Year") %>% xml_text
    pubmonth = xml_find_all(doc, "//PubDate/Month") %>% xml_text
    pubday = xml_find_all(doc, "//PubDate/Day") %>% xml_text
    title = doc %>% xml_find_all("//ArticleTitle") %>% xml_text
    pubdate = glue("{pubyear}-{pubmonth}-{pubday}")
    authors = paste(authors, collapse = "; ")
    journal = doc %>% xml_find_all("//Title") %>% xml_text
    doi = doi[[3]][[1]]
    return(list(title = title, authors = authors, pubdate = pubdate, journal = journal, doi = doi))
    })
  fetch = filter(fetch, !grepl("Erratum",fetch$title))
  fetch = filter(fetch, !grepl("Correction",fetch$title))
  return(fetch)
}

get_biorxiv <- function(dois) {
  
  fetch = map_df(dois, function(.x) {
    bio_pubs = biorxiv_content(doi = .x)
    doi = bio_pubs[[1]]$doi
    authors = gsub("\\. ","",bio_pubs[[1]]$authors)
    authors = gsub("\\.","",authors)
    title = bio_pubs[[1]]$title
    date = bio_pubs[[1]]$date
    pubd = bio_pubs[[1]]$published
    return(list(title = title, authors = authors, pubdate = date, journal = "BioRxiv", doi = doi, pubd = pubd))
  })
  
  return(fetch)
}