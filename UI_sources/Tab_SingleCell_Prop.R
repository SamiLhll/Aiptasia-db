list(
  h5("This tab allows to visualise the composition of single cells based on one discrete cell information"), 
  hr(), 
  
  fluidRow( 
    column(3,
           selectInput("sc1c2inp1", "Cell information to plot (X-axis):", 
                       choices = sc1conf[grp == TRUE]$UI, 
                       selected = sc1def$grp2), 
           selectInput("sc1c2inp2", "Cell information to group / colour by:", 
                       choices = sc1conf[grp == TRUE]$UI, 
                       selected = sc1def$grp1), 
           radioButtons("sc1c2typ", "Plot value:", 
                        choices = c("Proportion", "CellNumbers"), 
                        selected = "Proportion", inline = TRUE), 
           checkboxInput("sc1c2flp", "Flip X/Y", value = FALSE), 
           selectInput("sc1c2sub1", "Subset cells :", 
                       choices = sc1conf[grp == TRUE]$UI, 
                       selected = sc1def$grp1), 
           uiOutput("sc1c2sub1.ui")
    ),
    
    #### RIGHT PANEL (PLOT) ----
    column(9,uiOutput("sc1c2oup.ui"))),
  
  fluidRow(hr()),
  #### DOWNLOADS ----
  fluidRow(
    column(3,
           p(strong("Download plot as :")),
           downloadButton("sc1c2oup.pdf", "PDF"),  
           downloadButton("sc1c2oup.png", "PNG")),
    column(2,
           numericInput("sc1c2oup.h", "height:", width = "138px", 
                            min = 4, max = 20, value = 8, step = 0.5)),
    column(2,
           numericInput("sc1c2oup.w", "width:", width = "138px", 
                            min = 4, max = 20, value = 10, step = 0.5))),
  
  
  fluidRow(hr()),
  #### Graphics and plot controls ----
  fluidRow(
    actionButton("sc1c2tog", "Toggle graphics controls"), 
    conditionalPanel( 
      condition = "input.sc1c2tog % 2 == 1", 
      radioButtons("sc1c2psz", "Plot size:", 
                   choices = c("Small", "Medium", "Large"), 
                   selected = "Medium", inline = TRUE), 
      radioButtons("sc1c2fsz", "Font size:", 
                   choices = c("Small", "Medium", "Large"), 
                   selected = "Medium", inline = TRUE))) 
)


