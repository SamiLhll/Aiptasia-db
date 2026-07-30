list(
  h5("This dataset includes proteins from 4 rounds of mass spectrometry performed on cells isolated from Aiptasia tentacles. "),
  h5("the 6,788 peptides displayed here were processed,clustered and annotated."),
  h5("-Methods-"),
  hr(),
  h4("Browse the data through an interactive plot"),
  plotlyOutput(outputId = "plot_lopit"),
  hr(),
  h4("Browse the data through a table"),
  hr(),
  dataTableOutput("table_lopit")
  
)