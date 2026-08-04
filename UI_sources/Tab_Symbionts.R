list(
  div(style = "padding-left: 20px; padding-right: 20px;",
      h5("Find details about Aiptasia's symbionts here."),
      hr(),
      h4("Clonal lines and symbiont strains"),
      br(),
      p("The three most widely used clonal lines are currently F003, H2 and CC7."),
      p("Each have specific associations with Symbiont strains."),
      img(src = "img/Aiptasia_endogenous_symbionts.png",style="width: 480px"),
      br(),
      hr(),
      h4("Symbiont genomes"),
      p("All Symbiodiniaceae genomes available on NCBI can be found here : ",a("ncbi.nlm.nih.gov/datasets/genome/?taxon=252141", href = "https://www.ncbi.nlm.nih.gov/datasets/genome/?taxon=252141",target="_blank")),
      p("Below are the details of the genomes of S. microadriaticum and B. minutum :"),
      dataTableOutput("table_symbiont_genomes")
  )
)