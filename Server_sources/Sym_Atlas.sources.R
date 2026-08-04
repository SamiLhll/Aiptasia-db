### Tab Sym Atlas ----
Sym_markers <-  read.csv("data/SymAtlas/Clustered_atlas.Sym.1_2_3.19dims_res0.7.markers.sensitive.all.tab", header = TRUE, sep = "\t")
# Sym_markers$p_val_adj <- signif(as.numeric(Sym_markers$p_val_adj), digits = 2)
# Sym_markers$avg_log2FC <- round(Sym_markers$avg_log2FC, digits = 3)
# First panel to query a single gene and generate a Featureplot
# reactive of input text and search button 
reactive_value_featureplot_symAtlas <- reactiveValues(data = NULL)

observeEvent(input$plot_featureplot_symAtlas_button, {
  reactive_value_featureplot_symAtlas$data <- as.character(input$query_feature_symAtlas)
}) # test with LOC110241526


# FeaturePlot
output$FeaturePlot_SymAtlas <- renderPlot({
  if (is.null(reactive_value_featureplot_symAtlas$data)) return()
  Seurat::FeaturePlot(sym_Atlas,features = reactive_value_featureplot_symAtlas$data,order = TRUE) +
    ggplot2::labs(x = "UMPA1", y = "UMAP2")
})
# FunAnnot
output$subset_fun_annot_feature <- renderDataTable({
  if (is.null(reactive_value_featureplot_symAtlas$data)) return ()
  datatable(data_table_fun_annot[data_table_fun_annot$LOC == reactive_value_featureplot_symAtlas$data,],options = list(dom = 't'))
})
# Marker
output$subset_marker_feature <- renderDataTable({
  if (is.null(reactive_value_featureplot_symAtlas$data)) return()
  datatable(Sym_markers[Sym_markers$LOC == reactive_value_featureplot_symAtlas$data,], options = list(dom = 't')) %>%
    formatSignif(columns = c("p_val", "p_val_adj"), digits = 3) %>%
    formatRound(columns = "avg_log2FC", digits = 3)
})

# Second Panel to query a list of genes
output$table_fun_annot <- renderDataTable({
  datatable(filtered_data_fun_annot())
})

#### Query list of genes :
reactive_value_Dotplot_symAtlas <- reactiveValues(data = NULL)

observeEvent(input$search_button_list_of_features_sym_atlas, {
  reactive_value_Dotplot_symAtlas$data <- strsplit(as.character(input$query_list_of_gene_ids_sym_atlas),",")[[1]]
  # reactive_value_Dotplot_symAtlas$data <- data_table_fun_annot[data_table_fun_annot[[input$query_list_of_gene_id_type_fun_annot]] %in% list_of_genes_processed,]
})

# Dotplot
output$DotPlot_SymAtlas <- renderPlot({
  if (is.null(reactive_value_Dotplot_symAtlas$data)) return()
  Seurat::DotPlot(sym_Atlas,features = reactive_value_Dotplot_symAtlas$data,cols = "RdBu") +
    # ggplot2::scale_fill_brewer("RdBu") +
    ggplot2::labs(x="",y="") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
})
# test with LOC110243280,LOC110233265
# Fun_annotation
output$subset_fun_annot_feature_list <- renderDataTable({
  if (is.null(reactive_value_Dotplot_symAtlas$data)) return ()
  datatable(data_table_fun_annot[data_table_fun_annot$LOC %in% reactive_value_Dotplot_symAtlas$data,],options = list(dom = 't'))
})

# Markers (list query)
output$subset_marker_feature_list <- renderDataTable({
  if (is.null(reactive_value_Dotplot_symAtlas$data)) return()
  datatable(Sym_markers[Sym_markers$LOC %in% reactive_value_Dotplot_symAtlas$data,], options = list(dom = 't')) %>%
    formatSignif(columns = c("p_val", "p_val_adj"), digits = 3) %>%
    formatRound(columns = "avg_log2FC", digits = 3)
})

# Third Panel to explore the table of markers
output$table_markers_Sym_atlas <- renderDataTable({
  datatable(Sym_markers) %>%
    formatSignif(columns = c("p_val", "p_val_adj"), digits = 3) %>%
    formatRound(columns = "avg_log2FC", digits = 3)
})