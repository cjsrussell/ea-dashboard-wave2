#-------------------------SERVER INFO--------------------------------------------------------

server <- function(input, output) {
  set.seed(122)
  
#--------------------- Info ----------------------------------
  
  str(data1)
  
  
  output$text1 <- renderUI({
    text <- "Hi!<br><br>Welcome to the dashboard for the second wave of data for the Explaining Atheism project. dashboard is organised into the two separate surveys within the study, along with a section for the belief measures that were in both surveys.
    <br><br> 

Here you will find information about all of the measures used in our questionnaire, along with the variables derived from these, and how we scored and coded them."
      
      
      
    return(HTML(paste("<div style='font-size: 24px; font-family: Verdana, serif; color: #253f8c;'>", text, "</div>")))
  })
  
 #--------------------- Survey 1 ----------------------------------

# Plots
  
  
  # Plot box
  
  output$plot_box1 <- renderUI({
    if (input$single_s1 == "Yes") {
      box(
        width = 9,
        title = "Survey 1 Single Variable Plot",
        solidHeader = TRUE,
        plotlyOutput("plot_s1.1", height = 800)
      )
    } else {
      box(
        width = 9,
        title = "Survey 1 Two Variable Plot",
        solidHeader = TRUE,
        plotOutput("plot_s1", height = 800)
      )
    }
  })
  
  # Variable information box
  
  
  output$varinfo1_s1<- renderUI({ 
    
    
    HTML("<strong> For variable definitions see: </strong> <br/> ", "https://cjsrussell.github.io/ea-codebook-w2/")
    
    })
  
# output$varinfo1<- renderUI({
#   case_when(
#     input$select_var1_s1 == "Age" ~ HTML("<strong> Age: </strong> <br/> ", "Axis refers to numerical age."),
#     input$select_var1_s1 == "Country" ~ HTML("<strong> Country: </strong> <br/> ", "Axis refers to Country."),

#   )
# })
  
  
 # output$varinfo2<- renderUI({
 #   case_when(
 #     input$select_var2_s1 == "Age" ~ HTML("<strong> Age: </strong> <br/> ", "Axis refers to numerical age."),
 #     input$select_var2_s1 == "Country" ~ HTML("<strong> Country: </strong> <br/> ", "Axis refers to Country."),
 #     input$select_var2_s1 == "Sex" ~ HTML("<strong> Sex: </strong> <br/> ", "Axis refers to sex."),
 #     input$select_var2_s1 == "Belief In God (categorical)" ~ HTML("<strong> Belief In God: </strong> <br/> ", "Axis refers category selected regarding belief in God."),
 #     input$select_var2_s1 == "Belief Identity" ~ HTML("<strong> Belief Identity: </strong> <br/> ", "Axis refers category selected regarding belief identity"),
 #     input$select_var2_s1 == "Religious Identity" ~ HTML("<strong> Belief Identity: </strong> <br/> ", "Axis refers category selected regarding religious identity"),
 #     
 #     input$select_var2_s1 == "Individualism" ~ HTML("<strong> Individualism: </strong> <br/> ", "Axis refers to score on individualism questionnaire, with higher scores denoting higher individualism and lower score higher collectivism."),
 #     input$select_var2_s1 == "Rebelliousness" ~ HTML("<strong> Rebelliousness: </strong> <br/> ", "Axis refers to score on rebelliousness questionnaire, with higher scores denoting higher rebelliousness."),
 #     input$select_var2_s1 == "Choice Norms" ~ HTML("<strong> Individual Choice Norms: </strong> <br/> ", "Axis refers to score on individual choice norms questionnaire, with higher scores denoting higher agreement with individual choice norms (e.g. abortion, homosexuality)"),
 #     input$select_var2_s1 == "Belief in God (continuous)" ~ HTML("<strong> Belief in God: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'I believe that God exists' </em>."),
 #     input$select_var2_s1 == "Possibility of Knowing" ~ HTML("<strong> Possibility of Knowing: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'It is not possible to know if God exists' </em>."),
 #     input$select_var2_s1 == "Confidence in Belief" ~ HTML("<strong> Confidence in Belief: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'I am confident that my beliefs about God's existence are the right ones' </em>."),
 #     input$select_var2_s1 == "Anti Religiosity" ~ HTML("<strong> Anti Religiosity: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'We would all be better off if people left religion behind' </em>."),
 #     input$select_var2_s1 == "God Apatheism" ~ HTML("<strong> God Apatheism: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Whether or not God exists is a question that doesn’t interest me much' </em>."),
 #     input$select_var2_s1 == "Purpose Apatheism" ~ HTML("<strong> Purpose Apatheism: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Whether or not there is an ultimate purpose to life is a question that doesn’t interest me much.' </em>."),
 #     input$select_var2_s1 == "Agnosticism" ~ HTML("<strong> Agnosticism: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> '	I don’t know whether there is a God, and I don’t believe there is any way to find out' </em>."),
 #     input$select_var2_s1 == "Objective Truth Discovery" ~ HTML("<strong> Objective Truth Discovery: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'For most things in the world, we will never be able to discover the real objective truth' </em>."),
 #     
 #     input$select_var2_s1 == "Religious Identification (y/n)" ~ HTML("<strong> Religious Identification: </strong> <br/> ", "Axis refers to yes/no response to <em> 'Do you regard yourself as belonging to a particular religion?' </em>."),

 #   )
 # })
  
  
  # Plot Outputs
  
  output$plot_s1 <- renderPlot(
    funPlot1(
      data1,
      var1 = input$select_var1_s1,
      var2 = input$select_var2_s1,
      country = input$select_country_s1,
      line = input$line_s1, 
      ordnum = input$ordnum_s1
    )
  )
  
  output$plot_s1.1 <- renderPlotly(
    funPlot2(
      data1,
      var1 = input$select_var1_s1,
      country = input$select_country_s1,
      ordnum = input$ordnum_s1
    )
  )
  
  # Table outputs
  
    # Demographics
  
  output$demotab.s1 <-  reactive(funTab1(
    data1,
    country = input$select_country.s1,
    type = input$tabletype_s1
  ))
  
    # Correlation Matrix
  
  output$cormat.s1 <- renderTable({
    data_tab <- funTab1(data1,
                        country = input$select_country.s1,
                        type = input$tabletype_s1, 
                        cormatvars = input$cormatvars.s1)
    
    as.data.frame(data_tab)  #  ensure a data frame not tibble
  },
  
  include.rownames = TRUE)  #include rownames
  
  
  # Correlation Matrix Plot
  
  output$cormatplot.s1 <- renderPlot(funTabPlot1(
    data1,
    country = input$select_country.s1,
    type = input$tabletype_s1,
    cormatvars = input$cormatvars.s1
  ))
  
  # Crosstabs
  
  output$crosstabs.s1 <-  render_gt(
    funTab1(
      data1,
      country = input$select_country.s1,
      type = input$tabletype_s1,
      var1 = input$ctabsrow.s1,
      var2 = input$ctabscol.s1
    )
  )
  
  # Summary Stats
  
  output$summarystats.s1 <-  render_gt(
    funTab1(
      data1,
      country = input$select_country.s1,
      type = input$tabletype_s1,
      var1 = input$sumstatsgrp.s1,
      var2 = input$sumstatsvars.s1
    )
  )
  
  
#--------------------- Survey 2 ----------------------------------
  
  # Plots


    # Plot box
  
  output$plot_box2 <- renderUI({
    if (input$single_s2 == "Yes") {
      box(
        width = 9,
        title = "Survey 2 Single Variable Plot",
        solidHeader = TRUE,
        plotlyOutput("plot_s2.1", height = 800)
      )
    } else {
      box(
        width = 9,
        title = "Survey 2 Two Variable Plot",
        solidHeader = TRUE,
        plotOutput("plot_s2", height = 800)
      )
    }
  })
  
  # Variable information box
  
  
  output$varinfo1_s2<- renderUI({ 
    
    
    HTML("<strong> For variable definitions see: </strong> <br/> ", "https://cjsrussell.github.io/ea-codebook-w2/")
    
  })
  
  # Plot Outputs
  
  output$plot_s2 <- renderPlot(
    funPlot1(
      data2,
      var1 = input$select_var1_s2,
      var2 = input$select_var2_s2,
      country = input$select_country_s2,
      line = input$line_s2, 
      ordnum = input$ordnum_s2
    )
  )
  
  output$plot_s2.1 <- renderPlotly(
    funPlot2(
      data2,
      var1 = input$select_var1_s2,
      country = input$select_country_s2,
      ordnum = input$ordnum_s2
    )
  )
  
  # Table outputs
  
  # Demographics
  
  output$demotab.s2 <-  reactive(funTab1(
    data2,
    country = input$select_country.s2,
    type = input$tabletype_s2
  ))
  
  # Correlation Matrix
  
  output$cormat.s2 <- renderTable({
    data_tab <- funTab1(data2,
                        country = input$select_country.s2,
                        type = input$tabletype_s2, 
                        cormatvars = input$cormatvars.s2)
    
    as.data.frame(data_tab)  #  ensure a data frame not tibble
  },
  
  include.rownames = TRUE)  #include rownames
  
  
  # Correlation Matrix Plot
  
  output$cormatplot.s2 <- renderPlot(funTabPlot1(
    data2,
    country = input$select_country.s2,
    type = input$tabletype_s2,
    cormatvars = input$cormatvars.s2
  ))
  
  # Crosstabs
  
  output$crosstabs.s2 <-  render_gt(
    funTab1(
      data2,
      country = input$select_country.s2,
      type = input$tabletype_s2,
      var1 = input$ctabsrow.s2,
      var2 = input$ctabscol.s2
    )
  )
  
  # Summary Stats
  
  output$summarystats.s2 <-  render_gt(
    funTab1(
      data2,
      country = input$select_country.s2,
      type = input$tabletype_s2,
      var1 = input$sumstatsgrp.s2,
      var2 = input$sumstatsvars.s2
    )
  )  
  


  
}