list(
  # h2("Gene expression"), 
  h5("This tab allows you to visualise gene expression in the cells"), 
  hr(), 
  
  #### FLUID ROW 1 with controls on the left and plot on the right :
  fluidRow(
    column(3,
           selectInput("sc1a3inp1", "Gene name:", choices=NULL),
           h5("Dim Reduction"),
           selectInput("sc1a3drX", "X-axis:", choices = sc1conf[dimred == TRUE]$UI,selected = sc1def$dimred[1]),
           selectInput("sc1a3drY", "Y-axis:", choices = sc1conf[dimred == TRUE]$UI,selected = sc1def$dimred[2]),
           selectInput("sc1a3sub1", "Subset cells :", 
                       choices = sc1conf[grp == TRUE]$UI, 
                       selected = sc1def$grp1), 
           uiOutput("sc1a3sub1.ui"),
           sliderInput("sc1a3siz", "Point size:", 
                       min = 0, max = 4, value = 1.25, step = 0.25),
           br(),br()),
    column(9, uiOutput("sc1a3oup1.ui"))),
  
  ####
  fluidRow(hr()),
  
  ### DOWNLOADS
  fluidRow(
    column(3,
           p(strong("Download plot as :")),
           downloadButton("sc1a3oup1.pdf", "PDF"),
           downloadButton("sc1a3oup1.png", "PNG")),
    column(2,numericInput("sc1a3oup1.h", "height:", 
                          min = 4, max = 20, value = 6, step = 0.5)),
    column(2,numericInput("sc1a3oup1.w", "width:", 
                          min = 4, max = 20, value = 8, step = 0.5))
  ),
  ####
  fluidRow(hr()),
  
  #### FLUID ROW 2 with cell information to display on the left and controls on the right
  ### GRAPHIC CONTROLS
  fluidRow(
    column(12, actionButton("sc1a3tog0", "Toggle graphics controls"), 
           conditionalPanel( 
             condition = "input.sc1a3tog0 % 2 == 1", 
             fluidRow(
               column(3, radioButtons("sc1a3psz", "Plot size:",choices = c("Small", "Medium", "Large"),selected = "Medium", inline = TRUE)),
               column(3, radioButtons("sc1a3fsz", "Font size:",choices = c("Small", "Medium", "Large"),selected = "Small", inline = TRUE)),
               column(3, radioButtons("sc1a3asp", "Aspect ratio:",choices = c("Square", "Fixed", "Free"),selected = "Free", inline = TRUE)),
               column(3, checkboxInput("sc1a3txt", "Show axis text", value = FALSE)) 
             ) 
           ) 
    ) 
  ),   # End of fluidRow (4 space)
  ### PLOT CONTROLS
  
  fluidRow(
    column(12, actionButton("sc1a3tog1", "Toggle plot controls"), 
           conditionalPanel( 
             condition = "input.sc1a3tog1 % 2 == 1", 
             column(4,radioButtons("sc1a3col1", "Colour:",choices = c("White-Red", "Blue-Yellow-Red","Yellow-Green-Purple"),selected = "White-Red")), 
             column(4,radioButtons("sc1a3ord1", "Plot order:",choices = c("Max-1st", "Min-1st", "Original", "Random"),selected = "Max-1st", inline = TRUE)) 
           ) 
    ) 
  )
)
