
shinyServer(
  
  
  function(input, output) {

    output$My_Example<- renderPlot({
      
      data2=read.csv("Data.csv")
      
      Info.A1=data2[data2$Advertisement_id=="A",]
      Info.B1=data2[data2$Advertisement_id=="B",]
      click_A1=NROW(Info.A1[Info.A1$action==1,])
      view_A1=NROW(Info.A1)
      click_B1=NROW(Info.B1[Info.B1$action==1,])
      view_B1=NROW(Info.B1)
      prior_a=1.0
      peror_b=1.0
      
      A1 <- data.frame(length1 = rbeta(100, prior_a+click_A1,peror_b+view_A1))
      B1 <- data.frame(length1= rbeta(100, prior_a+click_B1,peror_b+view_B1))
      
      A1$plan <- 'PlanA'
      B1$plan <- 'PlanB'
      
      planLengths1 <- rbind(A1, B1)
      theme_update(plot.title = element_text(hjust = 0.5))
      p2=ggplot(planLengths1, aes(length1, fill = plan)) + geom_density(alpha = 0.2)+ ggtitle("Your imported data set is Null. This is our example.\n Please prepare the data set based on left hand-side structure")+
        geom_vline(xintercept = mean(B1[,1]))+geom_vline(xintercept = mean(A1[,1]))
      return(p2)
    })
    
    ###################
    
    output$Your_Work<- renderPlot({
      
      inFile <- input$file1
      if (is.null(inFile))
        return(NULL)
      
      data1=read.csv(inFile$datapath)
      
      Info.A=data1[data1$Advertisement_id=="A",]
      Info.B=data1[data1$Advertisement_id=="B",]
      click_A=NROW(Info.A[Info.A$action==1,])
      view_A=NROW(Info.A)
      click_B=NROW(Info.B[Info.B$action==1,])
      view_B=NROW(Info.B)
      prior_a=1.0
      peror_b=1.0
      
      A <- data.frame(length = rbeta(100, prior_a+click_A,peror_b+view_A))
      B <- data.frame(length = rbeta(100, prior_a+click_B,peror_b+view_B))
      
      
      A$plan <- 'PlanA'
      B$plan <- 'PlanB'
      
      planLengths <- rbind(A, B)
      theme_update(plot.title = element_text(hjust = 0.5))
      p1=ggplot(planLengths, aes(length, fill = plan)) + geom_density(alpha = 0.2)+ ggtitle("Plan A and Plan B distribution difference")+
        geom_vline(xintercept = mean(B[,1]))+geom_vline(xintercept = mean(A[,1]))
      return(p1)
      
    })
 
    ###########################################################
    
    
    
  })


