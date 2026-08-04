list(
  div(style = "padding-left: 20px; padding-right: 20px;",
      h5("Browse the functional annotation of the predicted protein sequences."),
      h5("The full integrated dataset contains notably the following details:"),
      h5("KEGG, Pfam, PANTHER, RBH with Hsap and Nvec, and original refseq description."),
      # hr(),
      h5("The full table can be exported from the Downloads tab"),
      # downloadButton(outputId = "dl_fun_annot", label = " refseq_Aip1.1.fun_annotations.tsv"),
      hr(),
      h4("Query a list of genes"),
      fluidRow(column(3,list(radioButtons(inputId = "query_list_of_gene_id_type_fun_annot",
                                          label = "Type of ID",
                                          choices = list(
                                            "LOC" = "LOC",
                                            "XM" = "XM",
                                            "XP" = "XP",
                                            "AIP" = "AIP"),
                                          inline = T),
                             textInput("query_list_of_gene_ids", "Enter a list of \",\" separated IDs", ""),
                             actionButton("search_button_list", "search in table"))),
               column(7,dataTableOutput("subset_fun_annot_list_of_gene"))),
      hr(),
      h4("Search in the table by keyword"),
      div(style = "max-width: 1500px;",
          uiOutput("column_selector"),
          dataTableOutput("table_fun_annot")
      )
  )
)
