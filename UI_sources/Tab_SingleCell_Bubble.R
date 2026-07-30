list(
  h5( 
    "This tab allows to visualise the gene expression patterns of multiple genes grouped by categorical cell information. The normalised expression are averaged, log-transformed and then plotted."), 
  hr(),
  
  fluidRow( 
    #### LEFT COLUMN ----
    column(3, 
           textAreaInput("sc1d1inp", HTML("List of genes separated by \",\" , \";\" or newline (max 50)"), 
                         height = "300px", 
                         value = paste0(sc1def$genes, collapse = ", ")), 
           selectInput("sc1d1grp", "Group by:", 
                       choices = sc1conf[grp == TRUE]$UI, 
                       selected = sc1conf[grp == TRUE]$UI[1]), 
           radioButtons("sc1d1plt", "Plot type:", 
                        choices = c("Bubbleplot", "Heatmap"), 
                        selected = "Heatmap", inline = FALSE), 
           h5("Options :"),
           checkboxInput("sc1d1scl", "Scale gene expression", value = FALSE), 
           checkboxInput("sc1d1row", "Cluster rows (genes)", value = TRUE), 
           checkboxInput("sc1d1col", "Cluster columns (samples)", value = FALSE), 
           br(), 
           selectInput("sc1d1sub1", "Subset cells :", 
                       choices = sc1conf[grp == TRUE]$UI, 
                       selected = sc1def$grp1), 
           uiOutput("sc1d1sub1.ui")),
    
    #### RIGHT COLUMN (PLOT) ----
    column(9,
           h4(htmlOutput("sc1d1oupTxt")), 
           uiOutput("sc1d1oup.ui"))),
  
  fluidRow(hr()),
  #### DOWNLOADS ----
  fluidRow(
    column(3,
           p(strong("Download plot as :")),
           downloadButton("sc1d1oup.pdf", "PDF"), 
           downloadButton("sc1d1oup.png", "PNG")),
    column(2,
           numericInput("sc1d1oup.h", "height:", width = "138px", 
                            min = 4, max = 20, value = 10, step = 0.5)),
    column(2,
           numericInput("sc1d1oup.w", "width:", width = "138px", 
                            min = 4, max = 20, value = 10, step = 0.5))),
  
  fluidRow(hr()),
  
  #### Graphics and plot controls ----
  fluidRow(
  actionButton("sc1d1tog", "Toggle graphics controls"), 
  conditionalPanel( 
    condition = "input.sc1d1tog % 2 == 1", 
    radioButtons("sc1d1cols", "Colour scheme:", 
                 choices = c("White-Red", "Blue-Yellow-Red", 
                             "Yellow-Green-Purple"), 
                 selected = "Blue-Yellow-Red"), 
    radioButtons("sc1d1psz", "Plot size:", 
                 choices = c("Small", "Medium", "Large"), 
                 selected = "Medium", inline = TRUE), 
    radioButtons("sc1d1fsz", "Font size:", 
                 choices = c("Small", "Medium", "Large"), 
                 selected = "Small", inline = TRUE)
    )
  )
)
