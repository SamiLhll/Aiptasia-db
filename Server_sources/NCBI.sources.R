### Tab Fun annotation Refseq_Aip1.1 ----
# Load data from file
data_table_NCBI <- read.csv("data/Aiptasia_public_DATA_NCBI.csv", header = TRUE,sep = ";") %>% 
  mutate(Bioproject = paste0("<a href='https://www.ncbi.nlm.nih.gov/bioproject/", ID,"' target='_blank'>", Bioproject,"</a>")) %>%
  mutate(Publication = paste0("<a href='https://doi.org/", DOI,"' target='_blank'>", Publication,"</a>")) %>%
  mutate(Publication = replace(Publication,DOI == "-","Unknown") ) %>%
  select(-DOI,-ID)

# Select columns to display :
output$column_selector_ncbi <- renderUI({
  colnames_ncbi <- colnames(data_table_NCBI)
  selectInput("columns_ncbi", "Columns to display:", choices = colnames_ncbi, multiple = TRUE)
})

filtered_data_ncbi <- reactive({
  filtered_ncbi <- data_table_NCBI
  if (!is.null(input$columns_ncbi)) { filtered_ncbi <- filtered_ncbi[, input$columns_ncbi, drop = FALSE]}
  if (!is.null(input$search) && input$search != "") {filtered_ncbi <- filtered[grep(input$search, filtered_ncbi, ignore.case = TRUE)]}
  filtered_ncbi
})

output$table_ncbi <- renderDataTable({
  datatable(filtered_data_ncbi(),escape = FALSE)
})