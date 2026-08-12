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