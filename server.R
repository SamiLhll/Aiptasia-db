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

sym_Atlas = readRDS("data/SymAtlas/Sym_clustering.dims_50.res_05.RDS")



 
### Start server code ----
shinyServer(function(input, output, session) { 
  ### For all tags and Server-side selectize 
  observe_helpers() 
  
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
  

# ShinyServer ending bracket     
}) 
 
 
 
 