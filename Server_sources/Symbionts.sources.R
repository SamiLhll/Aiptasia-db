### Tab Symbiont genomes ----

# Load data from file
data_table_sym_genomes <- read.csv("data/Genomes/Symbiont_genomes_NCBI.tsv", header = TRUE,sep = "\t") %>%
  mutate(Accession = paste0("<a href='https://www.ncbi.nlm.nih.gov/datasets/genome/",Accession,"' target='_blank'>",Accession,"</a>"))

output$table_symbiont_genomes <- renderDataTable(datatable(data_table_sym_genomes,escape=FALSE))