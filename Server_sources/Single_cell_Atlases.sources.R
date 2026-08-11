### Tab Sym Atlas ----
Sym_markers <-  read.csv("data/SymAtlas/Clustered_atlas.Sym.1_2_3.19dims_res0.7.markers.sensitive.all.tab", header = TRUE, sep = "\t")
# First panel to query a single gene and generate a Featureplot
# reactive of input text and search button 
reactive_value_featureplot_symAtlas <- reactiveValues(data = NULL)
observeEvent(input$plot_featureplot_symAtlas_button, {
  reactive_value_featureplot_symAtlas$data <- as.character(input$query_feature_symAtlas)
})
# FeaturePlot
output$FeaturePlot_SymAtlas <- renderPlot({
  if (is.null(reactive_value_featureplot_symAtlas$data)) return()
  Seurat::FeaturePlot(sym_Atlas,features = reactive_value_featureplot_symAtlas$data,order = TRUE) +
    ggplot2::labs(x = "UMPA1", y = "UMAP2")
})
# FunAnnot
output$subset_fun_annot_feature_sym <- renderDataTable({
  if (is.null(reactive_value_featureplot_symAtlas$data)) return ()
  datatable(data_table_fun_annot[data_table_fun_annot$LOC == reactive_value_featureplot_symAtlas$data,],options = list(dom = 't'))
})
# Marker
output$subset_marker_feature_sym <- renderDataTable({
  if (is.null(reactive_value_featureplot_symAtlas$data)) return()
  datatable(Sym_markers[Sym_markers$gene == reactive_value_featureplot_symAtlas$data,], options = list(dom = 't')) %>%
    formatSignif(columns = c("p_val", "p_val_adj"), digits = 3) %>%
    formatRound(columns = "avg_log2FC", digits = 3)
})
# Second Panel to query a list of genes
#### Query list of genes :
reactive_value_Dotplot_symAtlas <- reactiveValues(data = NULL)
observeEvent(input$search_button_list_of_features_sym_atlas, {
  reactive_value_Dotplot_symAtlas$data <- strsplit(as.character(input$query_list_of_gene_ids_sym_atlas),",")[[1]]
})
# Dotplot
output$DotPlot_SymAtlas <- renderPlot({
  if (is.null(reactive_value_Dotplot_symAtlas$data)) return()
  Seurat::DotPlot(sym_Atlas,
                  features = reactive_value_Dotplot_symAtlas$data,
                  cols = "RdBu",
                  scale.min = input$dotplot_pct_range_sym_atlas[1],
                  scale.max = input$dotplot_pct_range_sym_atlas[2]) +
    ggplot2::labs(x = "", y = "") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
})
# Fun_annotation
output$subset_fun_annot_feature_list_sym <- renderDataTable({
  if (is.null(reactive_value_Dotplot_symAtlas$data)) return ()
  datatable(data_table_fun_annot[data_table_fun_annot$LOC %in% reactive_value_Dotplot_symAtlas$data,],options = list(dom = 't'))
})
# Markers (list query)
output$subset_marker_feature_list_sym <- renderDataTable({
  if (is.null(reactive_value_Dotplot_symAtlas$data)) return()
  datatable(Sym_markers[Sym_markers$gene %in% reactive_value_Dotplot_symAtlas$data,], options = list(dom = 't')) %>%
    formatSignif(columns = c("p_val", "p_val_adj"), digits = 3) %>%
    formatRound(columns = "avg_log2FC", digits = 3)
})
# Third Panel to explore the table of markers
output$table_markers_Sym_atlas <- renderDataTable({
  datatable(Sym_markers) %>%
    formatSignif(columns = c("p_val", "p_val_adj"), digits = 3) %>%
    formatRound(columns = "avg_log2FC", digits = 3)
})

### Tab ApoSym Atlas ----
ApoSym_markers <-  read.csv("data/ApoSymAtlas/Clustered_atlas.Sym.1_2_3.Apo.1_2_C.19dims_res0.8.markers.sensitive.all.tab", header = TRUE, sep = "\t")

# First panel to query a single gene and generate a Featureplot
# reactive of input text and search button 
reactive_value_featureplot_aposymAtlas <- reactiveValues(data = NULL)
observeEvent(input$plot_featureplot_aposymAtlas_button, {
  reactive_value_featureplot_aposymAtlas$data <- as.character(input$query_feature_aposymAtlas)
})
# FeaturePlot
output$FeaturePlot_AposymAtlas <- renderPlot({
  if (is.null(reactive_value_featureplot_aposymAtlas$data)) return()
  Seurat::FeaturePlot(aposym_Atlas,features = reactive_value_featureplot_aposymAtlas$data,order = TRUE) +
    ggplot2::labs(x = "UMPA1", y = "UMAP2")
})
# FunAnnot
output$subset_fun_annot_feature_aposym <- renderDataTable({
  if (is.null(reactive_value_featureplot_aposymAtlas$data)) return ()
  datatable(data_table_fun_annot[data_table_fun_annot$LOC == reactive_value_featureplot_aposymAtlas$data,],options = list(dom = 't'))
})
# Marker
output$subset_marker_feature_aposym <- renderDataTable({
  if (is.null(reactive_value_featureplot_aposymAtlas$data)) return()
  datatable(ApoSym_markers[ApoSym_markers$gene == reactive_value_featureplot_aposymAtlas$data,], options = list(dom = 't')) %>%
    formatSignif(columns = c("p_val", "p_val_adj"), digits = 3) %>%
    formatRound(columns = "avg_log2FC", digits = 3)
})
# Second Panel to query a list of genes
#### Query list of genes :
reactive_value_Dotplot_aposymAtlas <- reactiveValues(data = NULL)
observeEvent(input$search_button_list_of_features_aposym_atlas, {
  reactive_value_Dotplot_aposymAtlas$data <- strsplit(as.character(input$query_list_of_gene_ids_aposym_atlas),",")[[1]]
})
# Dotplot
output$DotPlot_AposymAtlas <- renderPlot({
  if (is.null(reactive_value_Dotplot_aposymAtlas$data)) return()
  Seurat::DotPlot(aposym_Atlas,
                  features = reactive_value_Dotplot_aposymAtlas$data,
                  cols = "RdBu",
                  scale.min = input$dotplot_pct_range_aposym_atlas[1],
                  scale.max = input$dotplot_pct_range_aposym_atlas[2]) +
    ggplot2::labs(x = "", y = "") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
})
# Fun_annotation
output$subset_fun_annot_feature_list_aposym <- renderDataTable({
  if (is.null(reactive_value_Dotplot_aposymAtlas$data)) return ()
  datatable(data_table_fun_annot[data_table_fun_annot$LOC %in% reactive_value_Dotplot_aposymAtlas$data,],options = list(dom = 't'))
})
# Markers (list query)
output$subset_marker_feature_list_aposym <- renderDataTable({
  if (is.null(reactive_value_Dotplot_aposymAtlas$data)) return()
  datatable(ApoSym_markers[ApoSym_markers$gene %in% reactive_value_Dotplot_aposymAtlas$data,], options = list(dom = 't')) %>%
    formatSignif(columns = c("p_val", "p_val_adj"), digits = 3) %>%
    formatRound(columns = "avg_log2FC", digits = 3)
})
# Third Panel to explore the table of markers
output$table_markers_ApoSym_atlas <- renderDataTable({
  datatable(ApoSym_markers) %>%
    formatSignif(columns = c("p_val", "p_val_adj"), digits = 3) %>%
    formatRound(columns = "avg_log2FC", digits = 3)
})