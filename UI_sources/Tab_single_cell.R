div(style = "padding-left: 20px; padding-right: 20px;",
    navset_tab(
      
      ################################################
      # SYMBIOTIC ATLAS
      ################################################
      nav_panel(
        title = "Symbiotic atlas",
        navset_pill_list(
          widths = c(2, 10),
          
          ################################################
          # OVERVIEW / HOME PANEL
          ################################################
          nav_panel(
            title = "Overview",
            h4("Browse the Single cell atlas of Symbiotic polyps."),
            br(),
            div(style = "text-align: left;",
                img(src = "img/Sym_atlas_dimplot.png", style = "width: 100%; max-width: 400px;")
            ),
            br(),
            p("Use the panels on the left to query:"),
            p("- The expression of a single gene (FeaturePlot)"),
            p("- The expression of a list of genes (Dotplot)"),
            p("- The full table of marker genes"),
            
          ),
          
          ################################################
          # QUERY 1 - SINGLE GENE
          ################################################
          nav_panel(
            title = "Single gene (Featureplot)",
            h4("Query the expression of a single gene (FeaturePlot)"),
            br(),
            fluidRow(
              column(3, 
                     div(style = "text-align: left;",
                         img(src = "img/Sym_atlas_dimplot.png", style = "width: 100%; max-width: 400px;")
                     ),
                     list(
                       br(),
                       textInput("query_feature_symAtlas", "Enter a LOC gene ID", "LOC110235692"),
                       actionButton("plot_featureplot_symAtlas_button", "plot")
                     )),
              column(9, 
                     div(style = "width: 100%; max-width: 600px;",
                         plotOutput("FeaturePlot_SymAtlas", height = "600px")
                     )
              )
            ),
            div(style = "width: 100%; max-width: 600px;",
                conditionalPanel(
                  condition = "input.plot_featureplot_symAtlas_button > 0",
                  br(),
                  h5("Functional annotation : ")
                ),
                dataTableOutput("subset_fun_annot_feature_sym"),
                conditionalPanel(
                  condition = "input.plot_featureplot_symAtlas_button > 0",
                  br(),
                  h5("Table of marker genes : ")
                ),
                dataTableOutput("subset_marker_feature_sym")
            )
          ),
          
          ################################################
          # QUERY 2 - LIST OF GENES
          ################################################
          nav_panel(
            title = "Gene list (Dotplot)",
            h4("Query the expression of a list of genes (DotPlot)"),
            br(),
            fluidRow(
              column(3, 
                     div(style = "text-align: left;",
                         img(src = "img/Sym_atlas_dimplot.png", style = "width: 100%; max-width: 400px;")
                     ),
                     list(
                       br(),
                       textInput("query_list_of_gene_ids_sym_atlas", "Enter a list of \",\" separated LOC gene IDs", "LOC110235692,LOC110235693,LOC110235694,LOC110240890,LOC110246096,LOC110246103"),
                       sliderInput("dotplot_pct_range_sym_atlas", "% expressed range",
                                   min = 0, max = 100, value = c(0, 100), step = 1),
                       actionButton("search_button_list_of_features_sym_atlas", "plot")
                     )),
              column(9, 
                     div(style = "width: 100%; max-width: 600px;",
                         plotOutput("DotPlot_SymAtlas", height = "600px")
                     )
              )
            ),
            div(style = "width: 100%; max-width: 600px;",
                conditionalPanel(
                  condition = "input.search_button_list_of_features_sym_atlas > 0",
                  br(),
                  h5("Functional annotation : ")
                ),
                dataTableOutput("subset_fun_annot_feature_list_sym"),
                conditionalPanel(
                  condition = "input.search_button_list_of_features_sym_atlas > 0",
                  br(),
                  h5("Table of marker genes : ")
                ),
                dataTableOutput("subset_marker_feature_list_sym")
            )
          ),
          
          ################################################
          # QUERY 3 - MARKER TABLE
          ################################################
          nav_panel(
            title = "Table of marker genes",
            h4("Query the table of marker genes by keyword"),
            br(),
            div(style = "text-align: left;",
                img(src = "img/Sym_atlas_dimplot.png", style = "width: 100%; max-width: 400px;")
            ),
            div(style = "max-width: 1300px;",
                br(),
                dataTableOutput("table_markers_Sym_atlas")
            )
          )
        )
      ),
      
      ################################################
      # APO-SYM INTEGRATED ATLAS
      ################################################
      nav_panel(
        title = "Apo-Sym atlas",
        navset_pill_list(
          widths = c(2, 10),
          
          ################################################
          # OVERVIEW / HOME PANEL
          ################################################
          nav_panel(
            title = "Overview",
            h4("Browse the Single cell atlas of Aposymbiotic and Symbiotic polyps."),
            br(),
            div(style = "text-align: left;",
                img(src = "img/ApoSym_atlas_dimplot.png", style = "width: 100%; max-width: 400px;")
            ),
            br(),
            p("Use the panels on the left to query:"),
            p("- The expression of a single gene (FeaturePlot)"),
            p("- The expression of a list of genes (Dotplot)"),
            p("- The full table of marker genes"),
            
          ),
          
          ################################################
          # QUERY 1 - SINGLE GENE
          ################################################
          nav_panel(
            title = "Single gene (Featureplot)",
            h4("Query the expression of a single gene (FeaturePlot)"),
            br(),
            fluidRow(
              column(3, 
                     div(style = "text-align: left;",
                         img(src = "img/ApoSym_atlas_dimplot.png", style = "width: 100%; max-width: 400px;")
                     ),
                     list(
                       br(),
                       textInput("query_feature_aposymAtlas", "Enter a LOC gene ID", "LOC110235692"),
                       actionButton("plot_featureplot_aposymAtlas_button", "plot")
                     )),
              column(9, 
                     div(style = "width: 100%; max-width: 600px;",
                         plotOutput("FeaturePlot_AposymAtlas", height = "600px")
                     )
              )
            ),
            div(style = "width: 100%; max-width: 600px;",
                conditionalPanel(
                  condition = "input.plot_featureplot_aposymAtlas_button > 0",
                  br(),
                  h5("Functional annotation : ")
                ),
                dataTableOutput("subset_fun_annot_feature_aposym"),
                conditionalPanel(
                  condition = "input.plot_featureplot_aposymAtlas_button > 0",
                  br(),
                  h5("Table of marker genes : ")
                ),
                dataTableOutput("subset_marker_feature_aposym")
            )
          ),
          
          ################################################
          # QUERY 2 - LIST OF GENES
          ################################################
          nav_panel(
            title = "Gene list (Dotplot)",
            h4("Query the expression of a list of genes (DotPlot)"),
            br(),
            fluidRow(
              column(3, 
                     div(style = "text-align: left;",
                         img(src = "img/ApoSym_atlas_dimplot.png", style = "width: 100%; max-width: 400px;")
                     ),
                     list(
                       br(),
                       textInput("query_list_of_gene_ids_aposym_atlas", "Enter a list of \",\" separated LOC gene IDs", "LOC110235692,LOC110235693,LOC110235694,LOC110240890,LOC110246096,LOC110246103"),
                       sliderInput("dotplot_pct_range_aposym_atlas", "% expressed range",
                                   min = 0, max = 100, value = c(0, 100), step = 1),
                       actionButton("search_button_list_of_features_aposym_atlas", "plot")
                     )),
              column(9, 
                     div(style = "width: 100%; max-width: 600px;",
                         plotOutput("DotPlot_AposymAtlas", height = "600px")
                     )
              )
            ),
            div(style = "width: 100%; max-width: 600px;",
                conditionalPanel(
                  condition = "input.search_button_list_of_features_aposym_atlas > 0",
                  br(),
                  h5("Functional annotation : ")
                ),
                dataTableOutput("subset_fun_annot_feature_list_aposym"),
                conditionalPanel(
                  condition = "input.search_button_list_of_features_aposym_atlas > 0",
                  br(),
                  h5("Table of marker genes : ")
                ),
                dataTableOutput("subset_marker_feature_list_aposym")
            )
          ),
          
          ################################################
          # QUERY 3 - MARKER TABLE
          ################################################
          nav_panel(
            title = "Table of marker genes",
            h4("Query the table of marker genes by keyword"),
            br(),
            div(style = "text-align: left;",
                img(src = "img/ApoSym_atlas_dimplot.png", style = "width: 100%; max-width: 400px;")
            ),
            div(style = "max-width: 1300px;",
                br(),
                dataTableOutput("table_markers_ApoSym_atlas")
            )
          )
        )
      )
    )
)