list(
  # h2("Cell information"),
  h5("This tab allows you to explore the cells"),
  hr(),
  ### CONTROLS
  
  ### PLOT
  #### FLUID ROW 1 with controls on the left and plot on the right :
  fluidRow(
    column(3,
           selectInput("sc1a1inp1", "Cell information:", 
                       choices = sc1conf$UI, 
                       selected = sc1def$meta7),
           h5("Dim Reduction"),
           selectInput("sc1a1drX", "X-axis:", choices = sc1conf[dimred == TRUE]$UI,selected = sc1def$dimred[1]),
           selectInput("sc1a1drY", "Y-axis:", choices = sc1conf[dimred == TRUE]$UI,selected = sc1def$dimred[2]),
           selectInput("sc1a1sub1", "Subset cells :", 
                       choices = sc1conf[grp == TRUE]$UI, 
                       selected = sc1def$grp1),
           uiOutput("sc1a1sub1.ui"),
           sliderInput("sc1a1siz", "Point size:", 
                       min = 0.25, max = 2, value = 0.75, step = 0.25),
           br(),br()),
    column(9, uiOutput("sc1a1oup1.ui"))),
  
  ####
  fluidRow(hr()),
  ### DOWNLOADS :
  fluidRow(
    column(3,
           p(strong("Download plot as :")),
           downloadButton("sc1a1oup1.pdf", "PDF"),
           downloadButton("sc1a1oup1.png", "PNG")),
    column(2,numericInput("sc1a1oup1.h", "height:", 
                          min = 4, max = 20, value = 6, step = 0.5)),
    column(2,numericInput("sc1a1oup1.w", "width:", 
                          min = 4, max = 20, value = 8, step = 0.5))
  ),
  ####
  fluidRow(hr()),
  
  #### FLUID ROW 2 with cell information to display on the left and controls on the right
  ### GRAPHIC CONTROLS
  fluidRow(column(12, actionButton("sc1a1tog0", "Toggle graphics controls"), 
                  conditionalPanel(
                    condition = "input.sc1a1tog0 % 2 == 1",
                    column(3,radioButtons("sc1a1psz", "Plot size:",choices = c("Small", "Medium", "Large"),selected = "Medium", inline = TRUE)),
                    column(3,radioButtons("sc1a1fsz", "Font size:",choices = c("Small", "Medium", "Large"),selected = "Small", inline = TRUE)),
                    column(3,radioButtons("sc1a1asp", "Aspect ratio:",choices = c("Square", "Fixed", "Free"),selected = "Free", inline = TRUE)),
                    column(3,checkboxInput("sc1a1txt", "Show axis text", value = FALSE))
                  ))),
  
  ### PLOT CONTROLS
  fluidRow(column(12, actionButton("sc1a1tog1", "Toggle plot controls"), 
                  conditionalPanel( 
                    condition = "input.sc1a1tog1 % 2 == 1",
                    column(4, radioButtons("sc1a1col1", "Colour (Continuous data):", 
                                           choices = c("White-Red","Blue-Yellow-Red","Yellow-Green-Purple"), 
                                           selected = "Blue-Yellow-Red")),
                    column(4,radioButtons("sc1a1ord1", "Plot order:", 
                                          choices = c("Max-1st", "Min-1st", "Original", "Random"), 
                                          selected = "Original", inline = TRUE)),
                    column(4,checkboxInput("sc1a1lab1", "Show cell info labels", value = TRUE))
                  ))),
  ####
  fluidRow(hr()),
  
  ### CELL NUMBER / STATS :
  fluidRow(
    h4("Cell numbers / statistics"), 
    radioButtons("sc1a1splt", "Split continuous cell info into:", 
                 choices = c("Quartile", "Decile"), 
                 selected = "Decile", inline = TRUE), 
    dataTableOutput("sc1a1.dt") 
  ) 
)