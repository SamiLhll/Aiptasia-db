navset_pill_list(
  widths = c(2, 10),
  
  ################################################
  # OVERVIEW / HOME PANEL
  ################################################
  nav_panel(
    title = "Overview",
    h5("Browse the Single cell atlas of Symbiotic polyps."),
    p("Use the panels on the left to query:"),
    p("1 - The expression of a single gene (FeaturePlot)"),
    p("2 - The expression of a list of genes (Dotplot)"),
    p("3 - The full table of marker genes"),br(),
    div(style = "text-align: left;",
        img(src = "img/Symbiotic_atlas_dimplot_screenshot.png", style = "width: 100%; max-width: 400px;")
    )
    
    
  ),
  
  ################################################
  # QUERY 1 - SINGLE GENE
  ################################################
  nav_panel(
    title = "1 - Single gene (Featureplot)",
    h4("Query the expression of a single gene (FeaturePlot)"),
    fluidRow(
      column(3, list(
        textInput("query_feature_symAtlas", "Enter a LOC gene ID", ""),
        actionButton("plot_featureplot_symAtlas_button", "plot")
      )),
      column(9, list(
        plotOutput("FeaturePlot_SymAtlas"),
        dataTableOutput("subset_fun_annot_feature"),
        dataTableOutput("subset_marker_feature")
      ))
    )
  ),
  
  ################################################
  # QUERY 2 - LIST OF GENES
  ################################################
  nav_panel(
    title = "2 - Gene list (Dotplot)",
    h4("Query the expression of a list of genes (DotPlot)"),
    fluidRow(
      column(3, list(
        textInput("query_list_of_gene_ids_sym_atlas", "Enter a list of \",\" separated IDs", ""),
        actionButton("search_button_list_of_features_sym_atlas", "plot")
      )),
      column(9, list(
        plotOutput("DotPlot_SymAtlas"),
        dataTableOutput("subset_fun_annot_feature_list"),
        dataTableOutput("subset_marker_feature_list")
      ))
    )
  ),
  
  ################################################
  # QUERY 3 - MARKER TABLE
  ################################################
  nav_panel(
    title = "3 - Table of marker genes",
    h4("Query the table of marker genes by keyword"),
    dataTableOutput("table_markers_Sym_atlas")
  )
)