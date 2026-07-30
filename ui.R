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

### load data ----
sc1conf = readRDS("data/SingleCell/APO_SYM_V1/sc1conf.rds")
sc1def  = readRDS("data/SingleCell/APO_SYM_V1/sc1def.rds")

### Start server code ----
shinyUI(fluidPage(
  # theme = shinytheme("cosmo"),
  # theme = "bootstrap.min.css",
  ### HTML formatting of error messages 
  tags$head(tags$style(HTML(".shiny-output-error-validation {color: red; font-weight: bold;}"))), 
  list(tags$style(HTML(".navbar-default .navbar-nav { font-weight: bold; font-size: 20px; }"))), 
  
  ### Page title 
  # titlePanel(h1("Aiptasia-db")),
  # p("The web-application to exploit the public resources of the sea anemone Aiptasia"),
  # hr(),
  ###########################################################
  # HEADER
  ###########################################################
  title = "Aiptasia-db",
  titlePanel(title= div(img(src = "img/Aiptasia-db_logo_2025.png",style="width: 300px"))),
  #     
  # hr(),
  
  
  tabsetPanel( 
    # id = NULL,
    # widths = c(2,10),
    
    
    
    #######################################################################
    # HOME
    #######################################################################
    
    tabPanel(title =  "Home",
    # div(img(src = "img/Aiptasia_zoom.png",style="width: 80px")),
             source("UI_sources/Tab_Home.R",local = TRUE)[1]
    ),
    
    ######################################################################
    # Functional annotation
    ######################################################################
    
    tabPanel(title = "Fun. annotation",
             source("UI_sources/Tab_FunAnnot_refseq_Aip1.1.R",local = TRUE)[1]
    ),
    # tabPanel(title = "XP <-> AIP",
    #          source("UI_sources/Tab_FunAnnot_XP_AIP.R",local = TRUE)[1]
    # ),
    
    ######################################################################
    # Public data
    ######################################################################
    
    tabPanel(title = "NCBI datasets",
             source("UI_sources/Tab_NCBI_public_data.R",local = TRUE)[1]
    ),
    
    
    tabPanel(title = "Sym Atlas",
             source("UI_sources/Tab_Sym_atlas.R", local = TRUE)[1]
    ),
    ######################################################################
    # Single-Cell Atlas
    ######################################################################
    
    ### Apo Sym
    # tabPanel(title = "scAtlas Browser",
    #          tabsetPanel(type = "tabs",
    #                      ### TAB SINGLE CELL 1: cellInfo 
    #                      tabPanel(title = HTML("Cell<br/>Information"),
    #                               source("UI_sources/Tab_SingleCell_CellInfo.R",local = TRUE)[1]
    #                      ),     # End of tab (2 space) 
    #                      
    #                      
    #                      ### TAB SINGLE CELL 2 : Gene Expression 
    #                      tabPanel(title = HTML("Gene<br/>Expression"),
    #                               source("UI_sources/Tab_SingleCell_GeneExpr.R",local = TRUE)[1]
    #                      ),
    #                      tabPanel(title = HTML("Gene<br/>Coexpression"),
    #                               source("UI_sources/Tab_SingleCell_CoExpr.R",local = TRUE)[1]
    #                               
    #                      ), 
    #                      
    #                      ### Tab1.c1: violinplot / boxplot 
    #                      tabPanel(title = HTML("Boxplot<br/>"),  
    #                               source("UI_sources/Tab_SingleCell_Violin.R",local = TRUE)[1]
    #                      ), 
    #                      
    #                      ### Tab1.c2: Proportion plot 
    #                      tabPanel(title = HTML("Cell<br/>Proportions"),
    #                               source("UI_sources/Tab_SingleCell_Prop.R",local = TRUE)[1]
    #                               
    #                      ),     # End of tab (2 space) 
    #                      
    #                      ### Tab1.d1: Multiple gene expr 
    #                      tabPanel(title = HTML("Heatmap"), 
    #                               source("UI_sources/Tab_SingleCell_Bubble.R", local = TRUE)[1]
    #                               
    #                      ))),
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
  # h2("About"),
  div("Your seeing Aiptasia-db v1.2.4 (updated on 2025/11/11) It is a project from the ",
      a("Guse lab", href = "https://guselab.de/",target="_blank"),
      " in Ludwig-Maximillians Universität."),
  div("It is implemented and maintained by ",
      a("Sami El Hilali", href = "mailto:elhilali.sami@gmail.com",target="_blank")),
  br(),
  div(column(img(src = "img/Logo_LMU.png",style="height: 60px"),width = 2),
      "",
      img(src = "img/Logo_guselab.jpeg",style="height: 65px"))
))



