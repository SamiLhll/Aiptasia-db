list(
  h5("Browse the publicly available datasets from NCBI."),
  h5("All datasets relative to Aiptasia were referenced in the table below."),
  h5("The full table can be exported from the Downloads tab"),
  hr(),
  # h4("Export the full table"),
  # downloadButton(outputId = "dl_ncbi", label = " Aiptasia_public_DATA_NCBI.csv"),
  # hr(),
  uiOutput("column_selector_ncbi"),
  dataTableOutput("table_ncbi")
)