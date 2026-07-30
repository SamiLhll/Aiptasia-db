# Prepare data :
lopit <- read.csv(file="data/LOPIT/Master_File_complex_11072025_for_Sami_v1.csv") %>%
  dplyr::rename(tSNE_1 = Expal_4.5.tSNE.Dim.1,
                tSNE_2 = Expal_4.5.tSNE.Dim.2,
                Cluster = Marker,
                Organism = ID,
                gene = LOC,
                pep = proteinID,
                desc = Refseq_Description) %>%
  select(tSNE_1, tSNE_2, Cluster, Organism, gene, pep,desc) %>%
  mutate(gene = replace(gene,is.na(gene),"NA"),
         pep = replace(pep,is.na(pep),"NA"),
         desc = replace(desc,is.na(desc),"NA"),
         Cluster = replace(Cluster,is.na(Cluster),"Not identified"))
lopit$hover_text <- paste0("gene:",lopit$gene,"\n",
                           "pep:",lopit$pep,"\n",
                           "desc:",lopit$desc,"\n",
                           lopit$Organism,"\n",
                           lopit$Cluster)

lopit_no_cluster <- subset(lopit,Cluster == "Not identified")
lopit_with_cluster <- subset(lopit,Cluster != "Not identified")
lopit_to_display <- lopit %>%
  select(gene,pep,desc,Organism,Cluster,tSNE_1,tSNE_2)

output$plot_lopit <- renderPlotly({
  
  # add trace for each subset (with and without cluster)
  plot_ly() %>%
    add_trace(
      data=lopit_no_cluster,
      type = 'scatter',
      mode = 'markers',
      x = ~tSNE_1,
      y = ~tSNE_2,
      color=~Cluster,
      colors = c("#38333E","#89C5DA", "#DA5724", "#74D944", "#CE50CA", "#3F4921", "#C0717C", "#CBD588","#D7C1B1", "#5F7FC7",
                 "#673770","#508578"),
      symbol = ~Organism,
      text = ~hover_text,
      hovertemplate = paste('%{text}<extra></extra>'),
      showlegend = TRUE
    ) %>%
    add_trace(
      data=lopit_with_cluster,
      type = 'scatter',
      mode = 'markers',
      x = ~tSNE_1,
      y = ~tSNE_2,
      color=~Cluster,
      symbol = ~Organism,
      text = ~hover_text,
      hovertemplate = paste('%{text}<extra></extra>'),
      showlegend = TRUE
    ) 
})

output$table_lopit <- renderDataTable({datatable(lopit_to_display)})