list(
  div(style = "padding-left: 20px; padding-right: 20px;",
      br(),
      h5("Welcome to the web-application dedicated to the public resources of Aiptasia,"),
      h5("a model organism to study cnidarian symbiosis."),
      br(),
      hr(),
      h3("Content"),
      br(),
      
      div(style = "max-width: 1100px;",
          layout_columns(
            col_widths = 6,
            card(
              card_header(h5("Functional annotation")),
              # "It contains KEGG orthology (ghost koala web service), ",
              # "Pfam domains, PANTHER families 16.0 (hhmsearch from HHMER 3.3), ",
              # "signal peptides (SignalP 5.0b), Human orthologs (computed as reciprocal best blast hits using",
              # a("rbhXpress v1.2.3", href="https://www.github.com/SamiLhll/rbhXpress", target = "_blank"),") ",
              # "and Corresponding KXJ and AIPGENE IDs (These IDs originating from the reefgenomics plateform are still used in many publications):"
              p("Integrated functional annotation of the predicted protein sequences (GCF_001417965.1) queried against several public databases")
            ),
            card(
              card_header(h5("NCBI sequencing datasets")),
              p("All available public datasets from NCBI are here referenced in a table to help reviewing Aiptasia's literature.")
            ),
            card(
              card_header(h5("Symbiotic cell atlas")),
              p("Browse the single cell RNA-seq atlas of full Symbiotic polyps")
              # h4("● Single-cell Atlas browser"),
              # p("Browse the single cell RNA-seq atlas of full Symbiotic and Aposymbiotic anemones"),
              # p("The 10X sequencing reads from APO and SYM specimens were mapped to the Aiptasia reference genome (refseq) using cellranger, 
              #   and further processed using the Seurat R package."),
              # p("The tab related to the single-cell Atlas was initially implemented with the Help of ShinyCell : ",
              #   a("https://github.com/SGDDNB/ShinyCell", href = "https://github.com/SGDDNB/ShinyCell",target="_blank")),
            ),
            card(
              card_header(h5("LOPIT browser")),
              p("Browse the spatial proteomics dataset generated out of cells isolated from Aiptasia tentacles")
              # h5("● Genome browser"),
              # p("Browser allowing to navigate the different assemblies and load your own mapped datasets"),
            ),
            card(
              card_header(h5("Downloads")),
              p("Export data from here to re-use them locally")
            ),
            card(
              card_header(h5("Symbionts")),
              p("Resources related to symbiosis and symbionts")
            )
          )
      ),
      
      br(),
      hr(),
      h3("Further resources"),
      p("For open access research protocols, consult (", a("aiptasia-resource.org/", href = "http://aiptasia-resource.org/", target = "_blank"), ")"),
      p("For more genomics resources, consult (", a("reefgenomics.org/", href = "http://reefgenomics.org/", target = "_blank"), ")")
  )
)
