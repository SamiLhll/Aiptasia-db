output$dl_fun_annot <- downloadHandler(
  filename = "refseq_Aip1.1.fun_annotations.tsv",
  content = function(con){
    file.copy("data/Fun_annotation/refseq_Aip1.1.fun_annotation.tsv", con)
  })

output$dl_ncbi <- downloadHandler(
  filename = "Aiptasia_public_DATA_NCBI.csv",
  content = function(con){
    file.copy("data/Aiptasia_public_DATA_NCBI.csv", con)
  })
output$dl_CHI_genome_fa <- downloadHandler(
  filename = "CHI-2020.fa.gz",
  content = function(con){
    file.copy("data/Genomes/CHI-2020/CHI-2020.fa.gz", con)
  })
output$dl_CHI_genome_gff <- downloadHandler(
  filename = "CHI-2020.gff.gz",
  content = function(con){
    file.copy("data/Genomes/CHI-2020/CHI-2020.gff.gz", con)
  })
output$dl_CHI_genome_mito <- downloadHandler(
  filename = "CHI-2020.assembled_mitochondrial_genome.fa",
  content = function(con){
    file.copy("data/Genomes/CHI-2020/CHI-2020.assembled_mitochondrial_genome.fa", con)
  })