list(
  # h4("Cell information / gene expression violin plot / box plot"), 
  h5("This tab allows to visualise the gene expression or continuous cell information (e.g. Number of UMIs / module score) across groups of cells (e.g. libary / clusters)."), 
  hr(), 
  
  #### LEFT COLUMN ----
  fluidRow( 
    column(3,
           selectInput("sc1c1inp1", "Cell info (X-axis):", 
                       choices = sc1conf[grp == TRUE]$UI, 
                       selected = sc1def$grp1) %>%  
             helper(type = "inline", size = "m", fade = TRUE, 
                    title = "Cell information to group cells by",  
                    content = c("Select categorical cell information to group cells by",  
                                "- Single cells are grouped by this categorical covariate",  
                                "- Plotted as the X-axis of the violin plot / box plot")),  
           selectInput("sc1c1inp2", "Cell info / Gene name (Y-axis):", choices=NULL) %>%  
             helper(type = "inline", size = "m", fade = TRUE, 
                    title = "Cell Info / Gene to plot", 
                    content = c("Select cell info / gene to plot on Y-axis", 
                                "- Can be continuous cell information (e.g. nUMIs / scores)", 
                                "- Can also be gene expression")), 
           radioButtons("sc1c1typ", "Plot type:", 
                        choices = c("violin", "boxplot"), 
                        selected = "violin", inline = TRUE), 
           checkboxInput("sc1c1pts", "Show data points", value = FALSE),
           selectInput("sc1c1sub1", "Subset cells :", 
                       choices = sc1conf[grp == TRUE]$UI, 
                       selected = sc1def$grp1), 
           uiOutput("sc1c1sub1.ui")),
    # End of column (6 space)
    
    #### RIGHT COLUMN (PLOT) ----
    column(9, uiOutput("sc1c1oup.ui"))),
  
  fluidRow(hr()),
  #### DOWNLOADS ----
  fluidRow(
    column(3,
           p(strong("Download plot as :")),
           downloadButton("sc1c1oup.pdf", "PDF"),  
           downloadButton("sc1c1oup.png", "PNG")),
    column(2,numericInput("sc1c1oup.h", "height:", width = "138px", 
                          min = 4, max = 20, value = 8, step = 0.5)), 
    column(2,numericInput("sc1c1oup.w", "width:", width = "138px", 
                          min = 4, max = 20, value = 10, step = 0.5))),
  ####
  fluidRow(hr()),
  
  #### Graphics and plot controls ----
  fluidRow(
    actionButton("sc1c1tog", "Toggle graphics controls"), 
    conditionalPanel( 
      condition = "input.sc1c1tog % 2 == 1", 
      fluidRow(sliderInput("sc1c1siz", "Point size:",  
                           min = 0, max = 4, value = 1.25, step = 0.25),  
               radioButtons("sc1c1psz", "Plot size:", 
                            choices = c("Small", "Medium", "Large"), 
                            selected = "Medium", inline = TRUE), 
               radioButtons("sc1c1fsz", "Font size:", 
                            choices = c("Small", "Medium", "Large"), 
                            selected = "Medium", inline = TRUE))
    )
  )
)