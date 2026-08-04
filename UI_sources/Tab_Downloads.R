list(
  div(style = "padding-left: 20px; padding-right: 20px; max-width: 1100px;",
      h4("● Functional annotation of the predicted protein sequences"),
      p("Integrated functional annotation of refseq protein sequences (GCF_001417965.1) queried against public databases. ",
        "It contains KEGG orthology (ghost koala web service), ",
        "Pfam domains, PANTHER families 16.0 (hhmsearch from HHMER 3.3), ",
        "signal peptides (SignalP 5.0b), orthologs in Human, Nematostella, (computed as reciprocal best blast hits using",
        a("rbhXpress v1.2.3", href="https://www.github.com/SamiLhll/rbhXpress", target = "_blank"),") ",
        "and Corresponding Chi-2020 (Chromosome scale genome), KXJ and AIPGENE IDs (These IDs originating from the reefgenomics plateform are still used in many publications):"),
      downloadButton(outputId = "dl_fun_annot", label = " refseq_Aip1.1.fun_annotations.tsv"),
      hr(),
      h4("● NCBI datasets"),
      p("All available public datasets from NCBI were referenced in a table to help reviewing Aiptasia's literature."),
      downloadButton(outputId = "dl_ncbi", label = " Aiptasia_public_DATA_NCBI.csv"),
      hr(),
      h4("● Genomes"),
      p(" Get the chromosome scale genome CHI-2020 (",a("Shum CWY, et al. 2022",href="https://doi.org/10.3389/fcell.2022.900321",target = "_blank"),") that was pre-processed to have scaffolds re-ordered and assembled mitochondrial genome (using getOrganelle)"),
      downloadButton(outputId = "dl_CHI_genome_fa", label = " CHI-2020.genome.fa"),
      downloadButton(outputId = "dl_CHI_genome_gff", label = " CHI-2020.genome.gff"),
      downloadButton(outputId = "dl_CHI_genome_mito", label = " CHI-2020.assembled_mitochondrial_genome.fa")
  )
)