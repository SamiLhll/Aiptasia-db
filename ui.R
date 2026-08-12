##############################################################################
# Aiptasia-db - v.1.2.5
# Sami El Hilali
##############################################################################
### Load libraries ----
library(shiny) 
library(shinyhelper) 
library(bslib)
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

shinyUI(
  page_navbar(
    fillable = FALSE,
    title = div(
      img(src = "img/Aiptasia-db_logo_2025_nobg.png", style = "width: 450px; margin-right: 30px; margin-left: 20px")),
    window_title = "Aiptasia-db",
    theme = bs_theme(
      version = 5,
      bootswatch = "minty",
      secondary = "#8aa6a3",
      base_font = font_google("Inter"),
      heading_font = font_google("Inter", wght = 600)
    ),
    
    ### HTML formatting of error messages
    header = tags$head(
      tags$style(HTML("
        .shiny-output-error-validation {color: red; font-weight: bold;}
        .navbar .nav-link { font-weight: bold; font-size: 20px; }
      "))
    ),
    
    #######################################################################
    # HOME
    #######################################################################
    nav_panel(title = "Home",
              source("UI_sources/Tab_Home.R", local = TRUE)[1]
    ),
    
    ######################################################################
    # Functional annotation
    ######################################################################
    nav_panel(title = "Fun. annotation",
              source("UI_sources/Tab_FunAnnot_refseq_Aip1.1.R", local = TRUE)[1]
    ),
    
    ######################################################################
    # Public data
    ######################################################################
    nav_panel(title = "NCBI datasets",
              source("UI_sources/Tab_NCBI_public_data.R", local = TRUE)[1]
    ),
    
    nav_panel(title = "Single-cell",
              source("UI_sources/Tab_single_cell.R", local = TRUE)[1]
    ),
    nav_panel(title = "LOPIT",
              source("UI_sources/Tab_LOPIT.R", local = TRUE)[1]
    ),
    nav_panel(title = "Downloads",
              source("UI_sources/Tab_Downloads.R", local = TRUE)[1]
    ),
    nav_panel(title = "Symbionts",
              source("UI_sources/Tab_Symbionts.R", local = TRUE)[1]
    ),
    
    ##################################################
    # FOOTER
    ##################################################
    footer = div(
      style = "margin-top: 60px; padding: 20px 20px; border-top: 1px solid #dee2e6; background-color: #f8f9fa;",
      p("You're seeing Aiptasia-db v1.2.5 (updated on 2026/08/12)."),
      p("It is a project from the ",
        a("Guse lab", href = "https://guselab.de/", target = "_blank"),
        " in Ludwig-Maximilians-Universität."),
      p("It is implemented and maintained by ",
        a("Sami El Hilali", href = "mailto:elhilali.sami@gmail.com", target = "_blank")),
      div(style = "display: flex; align-items: center; gap: 15px; margin-top: 15px;",
          img(src = "img/Logo_guselab.jpeg", style = "height: 70px"),
          img(src = "img/Logo_LMU.png", style = "height: 70px")
          
      )
    )
  )
)