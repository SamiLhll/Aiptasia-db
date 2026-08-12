### Tab Fun annotation Refseq_Aip1.1 ----
# Load data from file
data_table_fun_annot <- read.csv("data/Fun_annotation/refseq_Aip1.1.fun_annotation.tsv", header = TRUE, sep = "\t")
data_table_fun_annot$Pfam <- stringr::str_replace_all(data_table_fun_annot$Pfam,",",", ")
data_table_fun_annot$KEGG <- stringr::str_replace_all(data_table_fun_annot$KEGG,"_"," ")
data_table_fun_annot$Panther <- stringr::str_replace_all(data_table_fun_annot$Panther,"::"," : ")
data_table_fun_annot$Panther <- stringr::str_replace_all(data_table_fun_annot$Panther,"_"," ")
data_table_fun_annot$refseq_desc <- stringr::str_replace_all(data_table_fun_annot$refseq_desc,"_"," ")
data_table_fun_annot$KXJ <- stringr::str_replace_all(data_table_fun_annot$KXJ,"_"," ")
data_table_fun_annot$AIP <- stringr::str_replace_all(data_table_fun_annot$AIP,"_"," ")
# reorder columns :
data_table_fun_annot <- data_table_fun_annot %>%
  select(LOC,XM,XP,AIP,pepSize,refseq_desc,signalP,Pfam,KEGG,HumanGene,Panther,is_confident_TF,geneID,gene_coords)

# Select columns to display :
output$column_selector <- renderUI({
  colnames_funannot <- colnames(data_table_fun_annot)
  selectInput("columns_funannot", "Columns to display", choices = colnames_funannot, multiple = TRUE)
})

filtered_data_fun_annot <- reactive({
  filtered_fun_annot <- data_table_fun_annot
  if (!is.null(input$columns_funannot)) { filtered_fun_annot <- filtered_fun_annot[, input$columns_funannot, drop = FALSE]}
  if (!is.null(input$search) && input$search != "") {filtered_fun_annot <- filtered[grep(input$search, filtered_fun_annot, ignore.case = TRUE)]}
  filtered_fun_annot
})

output$table_fun_annot <- renderDataTable({
  datatable(filtered_data_fun_annot())
})

#### Query list of genes :
reactive_value_list_of_genes <- reactiveValues(data = NULL)

observeEvent(input$search_button_list, {
  list_of_genes_processed <- strsplit(as.character(input$query_list_of_gene_ids),",")[[1]]
  reactive_value_list_of_genes$data <- data_table_fun_annot[data_table_fun_annot[[input$query_list_of_gene_id_type_fun_annot]] %in% list_of_genes_processed,]
})


output$subset_fun_annot_list_of_gene <- renderDataTable({
  if (is.null(reactive_value_list_of_genes$data)) return()
  datatable(reactive_value_list_of_genes$data)
})