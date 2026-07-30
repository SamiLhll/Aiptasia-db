### Load Libraries ----
library(shiny) 
library(shinyhelper) 
library(data.table) 
library(Matrix) 
library(DT) 
library(magrittr)
library(dplyr)
library(plotly)
library(ggplot2) 
library(ggrepel) 
library(hdf5r) 
library(ggdendro) 
library(gridExtra) 

### Load data ----

sc1conf = readRDS("data/SingleCell/APO_SYM_V1/sc1conf.rds")
sc1def  = readRDS("data/SingleCell/APO_SYM_V1/sc1def.rds")
sc1gene = readRDS("data/SingleCell/APO_SYM_V1/sc1gene.rds")
sc1meta = readRDS("data/SingleCell/APO_SYM_V1/sc1meta.rds")
sym_Atlas = readRDS("data/SymAtlas/Sym_clustering.dims_50.res_05.RDS")


### Load helpers ----
source("helpers/shinycell_helpers.R",local = T)
 
### Start server code ----
shinyServer(function(input, output, session) { 
  ### For all tags and Server-side selectize 
  observe_helpers() 
  optCrt="{ option_create: function(data,escape) {return('<div class=\"create\"><strong>' + '</strong></div>');} }" 
  updateSelectizeInput(session, "sc1a1inp2", choices = names(sc1gene), server = TRUE, 
                       selected = sc1def$gene1, options = list( 
                         maxOptions = 7, create = TRUE, persist = TRUE, render = I(optCrt))) 
  updateSelectizeInput(session, "sc1a3inp1", choices = names(sc1gene), server = TRUE, 
                       selected = sc1def$gene1, options = list( 
                         maxOptions = 20, create = TRUE, persist = TRUE, render = I(optCrt))) 
  updateSelectizeInput(session, "sc1a3inp2", choices = names(sc1gene), server = TRUE, 
                       selected = sc1def$gene2, options = list( 
                         maxOptions = 7, create = TRUE, persist = TRUE, render = I(optCrt))) 
  updateSelectizeInput(session, "sc1b2inp1", choices = names(sc1gene), server = TRUE, 
                       selected = sc1def$gene1, options = list( 
                         maxOptions = 7, create = TRUE, persist = TRUE, render = I(optCrt))) 
  updateSelectizeInput(session, "sc1b2inp2", choices = names(sc1gene), server = TRUE, 
                       selected = sc1def$gene2, options = list( 
                         maxOptions = 7, create = TRUE, persist = TRUE, render = I(optCrt))) 
  updateSelectizeInput(session, "sc1c1inp2", server = TRUE, 
                       choices = c(sc1conf[is.na(fID)]$UI,names(sc1gene)), 
                       selected = sc1conf[is.na(fID)]$UI[1], options = list( 
                         maxOptions = length(sc1conf[is.na(fID)]$UI) + 3, 
                         create = TRUE, persist = TRUE, render = I(optCrt))) 
  
  ### CODE FOR TABS
  
  ### FUNCTIONAL ANNOTATION
  source(file = "Server_sources/Fun_annot.sources.R",local=TRUE)
  
  ### NCBI public data
  source(file = "Server_sources/NCBI.sources.R",local=TRUE)
  
  ### Symbiotic atlas
  source(file= "Server_sources/Sym_Atlas.sources.R",local=TRUE)
  
  ### Symbionts
  source(file = "Server_sources/Symbionts.sources.R",local=TRUE)
  
  ### DOWNLOADS
  source(file = "Server_sources/Downloads.sources.R",local=TRUE)   

  ### LOPIT
  source(file = "Server_sources/LOPIT.sources.R",local=TRUE)
  
  ### Old Shinycell tabs
  source(file = "Server_sources/Old_shinycell.sources.R",local=TRUE)

# ShinyServer ending bracket     
}) 
 
 
 
 