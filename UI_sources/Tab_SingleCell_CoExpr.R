list(
  # h2("Coexpression of Genes"), 
  h5("This tab allows you to visualise the coexpression of two genes on low-dimensional representions."), 
  hr(), 
  
  fluidRow(
    #### LEFT COLUMN ----
    column(3,
           # h5("Gene names"), 
           selectInput("sc1b2inp1", "Gene 1:", choices=NULL),
           selectInput("sc1b2inp2", "Gene 2:", choices=NULL),
           h5("Dim Reduction"), 
           selectInput("sc1b2drX", "X-axis:", choices = sc1conf[dimred == TRUE]$UI,selected = sc1def$dimred[1]), 
           selectInput("sc1b2drY", "Y-axis:", choices = sc1conf[dimred == TRUE]$UI,selected = sc1def$dimred[2]),
           selectInput("sc1b2sub1", "Subset cells :",
                       choices = sc1conf[grp == TRUE]$UI,
                       selected = sc1def$grp1),
           uiOutput("sc1b2sub1.ui")
      ),
    #### RIGHT COLUMN (PLOT) ----
    column(9,
           uiOutput("sc1b2oup1.ui"),),
    
    ), 
  ####
  fluidRow(hr()),
  
  #### PLOT LEGEND ----
  fluidRow( 
    column(5,
           uiOutput("sc1b2oup2.ui")),
    column(5,
           h4("Cell numbers"), 
           dataTableOutput("sc1b2.dt"))
  ),
  ####
  fluidRow(hr()),
  
  #### DOWNLOADS ---- 
  fluidRow(
    column(3,
           p(strong("Download plot as :")),
           downloadButton("sc1b2oup1.pdf", "PDF"), 
           downloadButton("sc1b2oup1.png", "PNG")),
    column(2,numericInput("sc1b2oup1.h", "height:", width = "138px", 
                          min = 4, max = 20, value = 6, step = 0.5)),
    column(2,numericInput("sc1b2oup1.w", "width:", width = "138px", 
                          min = 4, max = 20, value = 8, step = 0.5)),
    column(3,
           p(strong("Download legend as :")),
           downloadButton("sc1b2oup2.pdf", "PDF"), 
           downloadButton("sc1b2oup2.png", "PNG"))
  ),
  ####
  fluidRow(hr()),
  
  #### Graphics and plot controls ----
  fluidRow(
    actionButton("sc1b2tog0", "Toggle graphics controls"), 
    conditionalPanel( 
      condition = "input.sc1b2tog0 % 2 == 1", 
      fluidRow( 
        column(6, sliderInput("sc1b2siz", "Point size:",min = 0, max = 4, value = 1.25, step = 0.25), 
               radioButtons("sc1b2psz", "Plot size:",choices = c("Small", "Medium", "Large"),selected = "Medium", inline = TRUE), 
               radioButtons("sc1b2fsz", "Font size:", 
                            choices = c("Small", "Medium", "Large"), 
                            selected = "Medium", inline = TRUE) 
        ), 
        column(6, radioButtons("sc1b2asp", "Aspect ratio:", 
                               choices = c("Square", "Fixed", "Free"), 
                               selected = "Free", inline = TRUE), 
               checkboxInput("sc1b2txt", "Show axis text", value = FALSE) 
        ))),
    actionButton("sc1b2tog1", "Toggle plot controls"), 
    conditionalPanel( 
      condition = "input.sc1b2tog1 % 2 == 1",
      radioButtons("sc1b2col1", "Scale colors :", 
                   choices = c("Red (Gene1); Blue (Gene2)", 
                               "Orange (Gene1); Blue (Gene2)", 
                               "Red (Gene1); Green (Gene2)", 
                               "Green (Gene1); Blue (Gene2)"), 
                   selected = "Red (Gene1); Blue (Gene2)"),
      radioButtons("sc1b2ord1", "Plot order:", 
                   choices = c("Max-1st", "Min-1st", "Original", "Random"), 
                   selected = "Max-1st", inline = TRUE) 
    ))
  )
