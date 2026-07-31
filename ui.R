##############################################################################
# Aiptasia-db - v.1.2.2
# Sami El Hilali
##############################################################################

### Load libraries ----
library(shiny) 
library(shinyhelper) 
library(shinythemes)
library(data.table) 
library(Matrix) 
library(DT) 
library(magrittr)
library(plotly)
library(Seurat)
library(ggplot2)
## not loaded :
library(hdf5r)
library(ggdendro)


### Start server code ----
shinyUI(fluidPage(
  # theme = shinytheme("cosmo"),
  # theme = "bootstrap.min.css",
  ### HTML formatting of error messages 
  tags$head(tags$style(HTML(".shiny-output-error-validation {color: red; font-weight: bold;}"))), 
  list(tags$style(HTML(".navbar-default .navbar-nav { font-weight: bold; font-size: 20px; }"))), 
  
  ###########################################################
  # HEADER
  ###########################################################
  title = "Aiptasia-db",
  titlePanel(title= div(img(src = "img/Aiptasia-db_logo_2025.png",style="width: 300px"))),
  
  tabsetPanel( 
    
    
    #######################################################################
    # HOME
    #######################################################################
    
    tabPanel(title =  "Home",
             source("UI_sources/Tab_Home.R",local = TRUE)[1]
    ),
    
    ######################################################################
    # Functional annotation
    ######################################################################
    
    tabPanel(title = "Fun. annotation",
             source("UI_sources/Tab_FunAnnot_refseq_Aip1.1.R",local = TRUE)[1]
    ),
    
    ######################################################################
    # Public data
    ######################################################################
    
    tabPanel(title = "NCBI datasets",
             source("UI_sources/Tab_NCBI_public_data.R",local = TRUE)[1]
    ),
    
    tabPanel(title = "Sym Atlas",
             source("UI_sources/Tab_Sym_atlas.R", local = TRUE)[1]
    ),

    tabPanel(title = "LOPIT",
             source("UI_sources/Tab_LOPIT.R",local = TRUE)[1]
    ),
    tabPanel(title = "Downloads",
             source("UI_sources/Tab_Downloads.R",local = TRUE)[1]
             ),
    tabPanel(title = "Symbionts",
             source("UI_sources/Tab_Symbionts.R",local = TRUE)[1]
             )
    
  ),
  ##################################################
  # FOOTER
  ##################################################
  hr(),

  div("Your seeing Aiptasia-db v1.2.5 (updated on 2026/07/31) It is a project from the ",
      a("Guse lab", href = "https://guselab.de/",target="_blank"),
      " in Ludwig-Maximillians Universität."),
  div("It is implemented and maintained by ",
      a("Sami El Hilali", href = "mailto:elhilali.sami@gmail.com",target="_blank")),
  br(),
  div(column(img(src = "img/Logo_LMU.png",style="height: 60px"),width = 2),
      "",
      img(src = "img/Logo_guselab.jpeg",style="height: 65px"))
))



