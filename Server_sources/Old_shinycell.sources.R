### SINGLE CELL ATLAS (APO vs SYM)

### Tab SingleCell CellInfo ----
output$sc1a1sub1.ui <- renderUI({ 
  sub = strsplit(sc1conf[UI == input$sc1a1sub1]$fID, "\\|")[[1]] 
  checkboxGroupInput("sc1a1sub2", "Select which cells to show", inline = TRUE, 
                     choices = sub, selected = sub) 
}) 
observeEvent(input$sc1a1sub1non, { 
  sub = strsplit(sc1conf[UI == input$sc1a1sub1]$fID, "\\|")[[1]] 
  updateCheckboxGroupInput(session, inputId = "sc1a1sub2", label = "Select which cells to show", 
                           choices = sub, selected = NULL, inline = TRUE) 
}) 
observeEvent(input$sc1a1sub1all, { 
  sub = strsplit(sc1conf[UI == input$sc1a1sub1]$fID, "\\|")[[1]] 
  updateCheckboxGroupInput(session, inputId = "sc1a1sub2", label = "Select which cells to show", 
                           choices = sub, selected = sub, inline = TRUE) 
}) 
output$sc1a1oup1 <- renderPlot({ 
  scDRcell(sc1conf, sc1meta, input$sc1a1drX, input$sc1a1drY, input$sc1a1inp1,  
           input$sc1a1sub1, input$sc1a1sub2, 
           input$sc1a1siz, input$sc1a1col1, input$sc1a1ord1, 
           input$sc1a1fsz, input$sc1a1asp, input$sc1a1txt, input$sc1a1lab1) 
}) 
output$sc1a1oup1.ui <- renderUI({ 
  plotOutput("sc1a1oup1", height = pList[input$sc1a1psz]) 
}) 
output$sc1a1oup1.pdf <- downloadHandler( 
  filename = function() { paste0("sc1",input$sc1a1drX,"_",input$sc1a1drY,"_",  
                                 input$sc1a1inp1,".pdf") }, 
  content = function(file) { ggsave( 
    file, device = "pdf", height = input$sc1a1oup1.h, width = input$sc1a1oup1.w, useDingbats = FALSE, 
    plot = scDRcell(sc1conf, sc1meta, input$sc1a1drX, input$sc1a1drY, input$sc1a1inp1,   
                    input$sc1a1sub1, input$sc1a1sub2, 
                    input$sc1a1siz, input$sc1a1col1, input$sc1a1ord1,  
                    input$sc1a1fsz, input$sc1a1asp, input$sc1a1txt, input$sc1a1lab1) ) 
  }) 
output$sc1a1oup1.png <- downloadHandler( 
  filename = function() { paste0("sc1",input$sc1a1drX,"_",input$sc1a1drY,"_",  
                                 input$sc1a1inp1,".png") }, 
  content = function(file) { ggsave( 
    file, device = "png", height = input$sc1a1oup1.h, width = input$sc1a1oup1.w, 
    plot = scDRcell(sc1conf, sc1meta, input$sc1a1drX, input$sc1a1drY, input$sc1a1inp1,   
                    input$sc1a1sub1, input$sc1a1sub2, 
                    input$sc1a1siz, input$sc1a1col1, input$sc1a1ord1,  
                    input$sc1a1fsz, input$sc1a1asp, input$sc1a1txt, input$sc1a1lab1) ) 
  }) 
output$sc1a1.dt <- renderDataTable({ 
  ggData = scDRnum(sc1conf, sc1meta, input$sc1a1inp1, input$sc1a1inp2, 
                   input$sc1a1sub1, input$sc1a1sub2, 
                   "data/SingleCell/APO_SYM_V1/sc1gexpr.h5", sc1gene, input$sc1a1splt) 
  datatable(ggData, rownames = FALSE, extensions = "Buttons", 
            options = list(pageLength = -1, dom = "tB", buttons = c("copy", "csv", "excel"))) %>% 
    formatRound(columns = c("pctExpress"), digits = 2) 
}) 
###


### Tab SingleCell GeneExpr ---- 
output$sc1a3sub1.ui <- renderUI({ 
  sub = strsplit(sc1conf[UI == input$sc1a3sub1]$fID, "\\|")[[1]] 
  checkboxGroupInput("sc1a3sub2", "Select which cells to show", inline = TRUE, 
                     choices = sub, selected = sub) 
}) 
observeEvent(input$sc1a3sub1non, { 
  sub = strsplit(sc1conf[UI == input$sc1a3sub1]$fID, "\\|")[[1]] 
  updateCheckboxGroupInput(session, inputId = "sc1a3sub2", label = "Select which cells to show", 
                           choices = sub, selected = NULL, inline = TRUE) 
}) 
observeEvent(input$sc1a3sub1all, { 
  sub = strsplit(sc1conf[UI == input$sc1a3sub1]$fID, "\\|")[[1]] 
  updateCheckboxGroupInput(session, inputId = "sc1a3sub2", label = "Select which cells to show", 
                           choices = sub, selected = sub, inline = TRUE) 
}) 
output$sc1a3oup1 <- renderPlot({ 
  scDRgene(sc1conf, sc1meta, input$sc1a3drX, input$sc1a3drY, input$sc1a3inp1,  
           input$sc1a3sub1, input$sc1a3sub2, 
           "data/SingleCell/APO_SYM_V1/sc1gexpr.h5", sc1gene, 
           input$sc1a3siz, input$sc1a3col1, input$sc1a3ord1, 
           input$sc1a3fsz, input$sc1a3asp, input$sc1a3txt) 
}) 
output$sc1a3oup1.ui <- renderUI({ 
  plotOutput("sc1a3oup1", height = pList[input$sc1a3psz]) 
}) 
output$sc1a3oup1.pdf <- downloadHandler( 
  filename = function() { paste0("sc1",input$sc1a3drX,"_",input$sc1a3drY,"_",  
                                 input$sc1a3inp1,".pdf") }, 
  content = function(file) { ggsave( 
    file, device = "pdf", height = input$sc1a3oup1.h, width = input$sc1a3oup1.w, useDingbats = FALSE, 
    plot = scDRgene(sc1conf, sc1meta, input$sc1a3drX, input$sc1a3drY, input$sc1a3inp1,  
                    input$sc1a3sub1, input$sc1a3sub2, 
                    "data/SingleCell/APO_SYM_V1/sc1gexpr.h5", sc1gene, 
                    input$sc1a3siz, input$sc1a3col1, input$sc1a3ord1, 
                    input$sc1a3fsz, input$sc1a3asp, input$sc1a3txt) ) 
  }) 
output$sc1a3oup1.png <- downloadHandler( 
  filename = function() { paste0("sc1",input$sc1a3drX,"_",input$sc1a3drY,"_",  
                                 input$sc1a3inp1,".png") }, 
  content = function(file) { ggsave( 
    file, device = "png", height = input$sc1a3oup1.h, width = input$sc1a3oup1.w, 
    plot = scDRgene(sc1conf, sc1meta, input$sc1a3drX, input$sc1a3drY, input$sc1a3inp1,  
                    input$sc1a3sub1, input$sc1a3sub2, 
                    "data/SingleCell/APO_SYM_V1/sc1gexpr.h5", sc1gene, 
                    input$sc1a3siz, input$sc1a3col1, input$sc1a3ord1, 
                    input$sc1a3fsz, input$sc1a3asp, input$sc1a3txt) ) 
  }) 


### Tab SingleCell CoExpr ---- 
output$sc1b2sub1.ui <- renderUI({ 
  sub = strsplit(sc1conf[UI == input$sc1b2sub1]$fID, "\\|")[[1]] 
  checkboxGroupInput("sc1b2sub2", "Select which cells to show", inline = TRUE, 
                     choices = sub, selected = sub) 
}) 
observeEvent(input$sc1b2sub1non, { 
  sub = strsplit(sc1conf[UI == input$sc1b2sub1]$fID, "\\|")[[1]] 
  updateCheckboxGroupInput(session, inputId = "sc1b2sub2", label = "Select which cells to show", 
                           choices = sub, selected = NULL, inline = TRUE) 
}) 
observeEvent(input$sc1b2sub1all, { 
  sub = strsplit(sc1conf[UI == input$sc1b2sub1]$fID, "\\|")[[1]] 
  updateCheckboxGroupInput(session, inputId = "sc1b2sub2", label = "Select which cells to show", 
                           choices = sub, selected = sub, inline = TRUE) 
}) 
output$sc1b2oup1 <- renderPlot({ 
  scDRcoex(sc1conf, sc1meta, input$sc1b2drX, input$sc1b2drY,   
           input$sc1b2inp1, input$sc1b2inp2, input$sc1b2sub1, input$sc1b2sub2, 
           "data/SingleCell/APO_SYM_V1/sc1gexpr.h5", sc1gene, 
           input$sc1b2siz, input$sc1b2col1, input$sc1b2ord1, 
           input$sc1b2fsz, input$sc1b2asp, input$sc1b2txt) 
}) 
output$sc1b2oup1.ui <- renderUI({ 
  plotOutput("sc1b2oup1", height = pList2[input$sc1b2psz]) 
}) 
output$sc1b2oup1.pdf <- downloadHandler( 
  filename = function() { paste0("sc1",input$sc1b2drX,"_",input$sc1b2drY,"_",  
                                 input$sc1b2inp1,"_",input$sc1b2inp2,".pdf") }, 
  content = function(file) { ggsave( 
    file, device = "pdf", height = input$sc1b2oup1.h, width = input$sc1b2oup1.w, useDingbats = FALSE, 
    plot = scDRcoex(sc1conf, sc1meta, input$sc1b2drX, input$sc1b2drY,  
                    input$sc1b2inp1, input$sc1b2inp2, input$sc1b2sub1, input$sc1b2sub2, 
                    "data/SingleCell/APO_SYM_V1/sc1gexpr.h5", sc1gene, 
                    input$sc1b2siz, input$sc1b2col1, input$sc1b2ord1, 
                    input$sc1b2fsz, input$sc1b2asp, input$sc1b2txt) ) 
  }) 
output$sc1b2oup1.png <- downloadHandler( 
  filename = function() { paste0("sc1",input$sc1b2drX,"_",input$sc1b2drY,"_",  
                                 input$sc1b2inp1,"_",input$sc1b2inp2,".png") }, 
  content = function(file) { ggsave( 
    file, device = "png", height = input$sc1b2oup1.h, width = input$sc1b2oup1.w, 
    plot = scDRcoex(sc1conf, sc1meta, input$sc1b2drX, input$sc1b2drY,  
                    input$sc1b2inp1, input$sc1b2inp2, input$sc1b2sub1, input$sc1b2sub2, 
                    "data/SingleCell/APO_SYM_V1/sc1gexpr.h5", sc1gene, 
                    input$sc1b2siz, input$sc1b2col1, input$sc1b2ord1, 
                    input$sc1b2fsz, input$sc1b2asp, input$sc1b2txt) ) 
  }) 
output$sc1b2oup2 <- renderPlot({ 
  scDRcoexLeg(input$sc1b2inp1, input$sc1b2inp2, input$sc1b2col1, input$sc1b2fsz) 
}) 
output$sc1b2oup2.ui <- renderUI({ 
  plotOutput("sc1b2oup2", height = "300px") 
}) 
output$sc1b2oup2.pdf <- downloadHandler( 
  filename = function() { paste0("sc1",input$sc1b2drX,"_",input$sc1b2drY,"_",  
                                 input$sc1b2inp1,"_",input$sc1b2inp2,"_leg.pdf") }, 
  content = function(file) { ggsave( 
    file, device = "pdf", height = 3, width = 4, useDingbats = FALSE, 
    plot = scDRcoexLeg(input$sc1b2inp1, input$sc1b2inp2, input$sc1b2col1, input$sc1b2fsz) ) 
  }) 
output$sc1b2oup2.png <- downloadHandler( 
  filename = function() { paste0("sc1",input$sc1b2drX,"_",input$sc1b2drY,"_",  
                                 input$sc1b2inp1,"_",input$sc1b2inp2,"_leg.png") }, 
  content = function(file) { ggsave( 
    file, device = "png", height = 3, width = 4, 
    plot = scDRcoexLeg(input$sc1b2inp1, input$sc1b2inp2, input$sc1b2col1, input$sc1b2fsz) ) 
  }) 
output$sc1b2.dt <- renderDataTable({ 
  ggData = scDRcoexNum(sc1conf, sc1meta, input$sc1b2inp1, input$sc1b2inp2, 
                       input$sc1b2sub1, input$sc1b2sub2, "data/SingleCell/APO_SYM_V1/sc1gexpr.h5", sc1gene) 
  datatable(ggData, rownames = FALSE, extensions = "Buttons", 
            options = list(pageLength = -1, dom = "tB", buttons = c("copy", "csv", "excel"))) %>% 
    formatRound(columns = c("percent"), digits = 2) 
}) 


### Tab SingleCell Violin ---- 
output$sc1c1sub1.ui <- renderUI({ 
  sub = strsplit(sc1conf[UI == input$sc1c1sub1]$fID, "\\|")[[1]] 
  checkboxGroupInput("sc1c1sub2", "Select which cells to show", inline = TRUE, 
                     choices = sub, selected = sub) 
}) 
observeEvent(input$sc1c1sub1non, { 
  sub = strsplit(sc1conf[UI == input$sc1c1sub1]$fID, "\\|")[[1]] 
  updateCheckboxGroupInput(session, inputId = "sc1c1sub2", label = "Select which cells to show", 
                           choices = sub, selected = NULL, inline = TRUE) 
}) 
observeEvent(input$sc1c1sub1all, { 
  sub = strsplit(sc1conf[UI == input$sc1c1sub1]$fID, "\\|")[[1]] 
  updateCheckboxGroupInput(session, inputId = "sc1c1sub2", label = "Select which cells to show", 
                           choices = sub, selected = sub, inline = TRUE) 
}) 
output$sc1c1oup <- renderPlot({ 
  scVioBox(sc1conf, sc1meta, input$sc1c1inp1, input$sc1c1inp2, 
           input$sc1c1sub1, input$sc1c1sub2, 
           "data/SingleCell/APO_SYM_V1/sc1gexpr.h5", sc1gene, input$sc1c1typ, input$sc1c1pts, 
           input$sc1c1siz, input$sc1c1fsz) 
}) 
output$sc1c1oup.ui <- renderUI({ 
  plotOutput("sc1c1oup", height = pList2[input$sc1c1psz]) 
}) 
output$sc1c1oup.pdf <- downloadHandler( 
  filename = function() { paste0("sc1",input$sc1c1typ,"_",input$sc1c1inp1,"_",  
                                 input$sc1c1inp2,".pdf") }, 
  content = function(file) { ggsave( 
    file, device = "pdf", height = input$sc1c1oup.h, width = input$sc1c1oup.w, useDingbats = FALSE, 
    plot = scVioBox(sc1conf, sc1meta, input$sc1c1inp1, input$sc1c1inp2, 
                    input$sc1c1sub1, input$sc1c1sub2, 
                    "data/SingleCell/APO_SYM_V1/sc1gexpr.h5", sc1gene, input$sc1c1typ, input$sc1c1pts, 
                    input$sc1c1siz, input$sc1c1fsz) ) 
  }) 
output$sc1c1oup.png <- downloadHandler( 
  filename = function() { paste0("sc1",input$sc1c1typ,"_",input$sc1c1inp1,"_",  
                                 input$sc1c1inp2,".png") }, 
  content = function(file) { ggsave( 
    file, device = "png", height = input$sc1c1oup.h, width = input$sc1c1oup.w, 
    plot = scVioBox(sc1conf, sc1meta, input$sc1c1inp1, input$sc1c1inp2, 
                    input$sc1c1sub1, input$sc1c1sub2, 
                    "data/SingleCell/APO_SYM_V1/sc1gexpr.h5", sc1gene, input$sc1c1typ, input$sc1c1pts, 
                    input$sc1c1siz, input$sc1c1fsz) ) 
  }) 


### Tab SingleCell Prop ---- 
output$sc1c2sub1.ui <- renderUI({ 
  sub = strsplit(sc1conf[UI == input$sc1c2sub1]$fID, "\\|")[[1]] 
  checkboxGroupInput("sc1c2sub2", "Select which cells to show", inline = TRUE, 
                     choices = sub, selected = sub) 
}) 
observeEvent(input$sc1c2sub1non, { 
  sub = strsplit(sc1conf[UI == input$sc1c2sub1]$fID, "\\|")[[1]] 
  updateCheckboxGroupInput(session, inputId = "sc1c2sub2", label = "Select which cells to show", 
                           choices = sub, selected = NULL, inline = TRUE) 
}) 
observeEvent(input$sc1c2sub1all, { 
  sub = strsplit(sc1conf[UI == input$sc1c2sub1]$fID, "\\|")[[1]] 
  updateCheckboxGroupInput(session, inputId = "sc1c2sub2", label = "Select which cells to show", 
                           choices = sub, selected = sub, inline = TRUE) 
}) 
output$sc1c2oup <- renderPlot({ 
  scProp(sc1conf, sc1meta, input$sc1c2inp1, input$sc1c2inp2,  
         input$sc1c2sub1, input$sc1c2sub2, 
         input$sc1c2typ, input$sc1c2flp, input$sc1c2fsz) 
}) 
output$sc1c2oup.ui <- renderUI({ 
  plotOutput("sc1c2oup", height = pList2[input$sc1c2psz]) 
}) 
output$sc1c2oup.pdf <- downloadHandler( 
  filename = function() { paste0("sc1",input$sc1c2typ,"_",input$sc1c2inp1,"_",  
                                 input$sc1c2inp2,".pdf") }, 
  content = function(file) { ggsave( 
    file, device = "pdf", height = input$sc1c2oup.h, width = input$sc1c2oup.w, useDingbats = FALSE, 
    plot = scProp(sc1conf, sc1meta, input$sc1c2inp1, input$sc1c2inp2,  
                  input$sc1c2sub1, input$sc1c2sub2, 
                  input$sc1c2typ, input$sc1c2flp, input$sc1c2fsz) ) 
  }) 
output$sc1c2oup.png <- downloadHandler( 
  filename = function() { paste0("sc1",input$sc1c2typ,"_",input$sc1c2inp1,"_",  
                                 input$sc1c2inp2,".png") }, 
  content = function(file) { ggsave( 
    file, device = "png", height = input$sc1c2oup.h, width = input$sc1c2oup.w, 
    plot = scProp(sc1conf, sc1meta, input$sc1c2inp1, input$sc1c2inp2,  
                  input$sc1c2sub1, input$sc1c2sub2, 
                  input$sc1c2typ, input$sc1c2flp, input$sc1c2fsz) ) 
  }) 


### Tab SingleCell Bubble ---- 
output$sc1d1sub1.ui <- renderUI({ 
  sub = strsplit(sc1conf[UI == input$sc1d1sub1]$fID, "\\|")[[1]] 
  checkboxGroupInput("sc1d1sub2", "Select which cells to show", inline = TRUE, 
                     choices = sub, selected = sub) 
}) 
observeEvent(input$sc1d1sub1non, { 
  sub = strsplit(sc1conf[UI == input$sc1d1sub1]$fID, "\\|")[[1]] 
  updateCheckboxGroupInput(session, inputId = "sc1d1sub2", label = "Select which cells to show", 
                           choices = sub, selected = NULL, inline = TRUE) 
}) 
observeEvent(input$sc1d1sub1all, { 
  sub = strsplit(sc1conf[UI == input$sc1d1sub1]$fID, "\\|")[[1]] 
  updateCheckboxGroupInput(session, inputId = "sc1d1sub2", label = "Select which cells to show", 
                           choices = sub, selected = sub, inline = TRUE) 
}) 
output$sc1d1oupTxt <- renderUI({ 
  geneList = scGeneList(input$sc1d1inp, sc1gene) 
  if(nrow(geneList) > 50){ 
    HTML("More than 50 input genes! Please reduce the gene list!") 
  } else { 
    oup = paste0(nrow(geneList[present == TRUE]), " genes OK and will be plotted") 
    if(nrow(geneList[present == FALSE]) > 0){ 
      oup = paste0(oup, "<br/>", 
                   nrow(geneList[present == FALSE]), " genes not found (", 
                   paste0(geneList[present == FALSE]$gene, collapse = ", "), ")") 
    } 
    HTML(oup) 
  } 
}) 
output$sc1d1oup <- renderPlot({ 
  scBubbHeat(sc1conf, sc1meta, input$sc1d1inp, input$sc1d1grp, input$sc1d1plt, 
             input$sc1d1sub1, input$sc1d1sub2, "data/SingleCell/APO_SYM_V1/sc1gexpr.h5", sc1gene, 
             input$sc1d1scl, input$sc1d1row, input$sc1d1col, 
             input$sc1d1cols, input$sc1d1fsz) 
}) 
output$sc1d1oup.ui <- renderUI({ 
  plotOutput("sc1d1oup", height = pList3[input$sc1d1psz]) 
}) 
output$sc1d1oup.pdf <- downloadHandler( 
  filename = function() { paste0("sc1",input$sc1d1plt,"_",input$sc1d1grp,".pdf") }, 
  content = function(file) { ggsave( 
    file, device = "pdf", height = input$sc1d1oup.h, width = input$sc1d1oup.w, 
    plot = scBubbHeat(sc1conf, sc1meta, input$sc1d1inp, input$sc1d1grp, input$sc1d1plt, 
                      input$sc1d1sub1, input$sc1d1sub2, "data/SingleCell/APO_SYM_V1/sc1gexpr.h5", sc1gene, 
                      input$sc1d1scl, input$sc1d1row, input$sc1d1col, 
                      input$sc1d1cols, input$sc1d1fsz, save = TRUE) ) 
  }) 
output$sc1d1oup.png <- downloadHandler( 
  filename = function() { paste0("sc1",input$sc1d1plt,"_",input$sc1d1grp,".png") }, 
  content = function(file) { ggsave( 
    file, device = "png", height = input$sc1d1oup.h, width = input$sc1d1oup.w, 
    plot = scBubbHeat(sc1conf, sc1meta, input$sc1d1inp, input$sc1d1grp, input$sc1d1plt, 
                      input$sc1d1sub1, input$sc1d1sub2, "data/SingleCell/APO_SYM_V1/sc1gexpr.h5", sc1gene, 
                      input$sc1d1scl, input$sc1d1row, input$sc1d1col, 
                      input$sc1d1cols, input$sc1d1fsz, save = TRUE) ) 
  }) 