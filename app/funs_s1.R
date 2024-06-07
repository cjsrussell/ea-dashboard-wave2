#--------------------- DEFINE FUNCTIONS ---------------------------------

oldcolours <- c("#30ba8f", "#253f8c", "#8fb9ca", "#f0c05a", "#e9765b", "#9b59b6")

#--------------------- Plot Function - Two Variables----------------------------


funPlot1 <-
  function(data,
           var1,
           var2,
           country,
           color = "country",
           survey,
           line,
           ordnum) {
    
    
    # Check args
    
    
    print(paste("Var1: ", var1))
    print(paste("Var2: ", var2))
    print(paste("Countries: ", country))
    print(paste("Line:", line))
    
    #--------------------- Variable class checks -------------------------------
    
    #check variable classes
    
    print("CHECKING FOR ORDINAL VARIABLES")
    print(paste("Var1 Class:", class(data[[var1]])))
    print(paste("Var2 Class:", class(data[[var2]])))
    
    origord <- names(data)[sapply(data, is.ordered)]  # create list of ordered factor cols
    
    #set ordinal as numeric if relevant
    
    if (var1 %in% origord && ordnum == "Yes"){
      
      print("recoding ordinal var1 as numeric")
      
      data[[var1]] <- as.numeric(data[[var1]])
      
    }
    
    if (var2 %in% origord && ordnum == "Yes"){
      
      print("recoding ordinal var2 as numeric")
      
      
      data[[var2]] <- as.numeric(data[[var2]])
      
      }
    
    ord_vars <- names(data)[sapply(data, is.ordered)]  # create updated list of ordered factor cols
    cat_vars <- names(data)[sapply(data, is.factor)]   # create list of factors
    
    print(paste("Var1 New Class:", class(data[[var1]])))
    print(paste("Var2 New Class:", class(data[[var2]])))
    
    print(ord_vars)
    
    #--------------------- Title and Labels ---------------------------------
    
    # First we create the title and labels
    # specify country for title
    
    if (!("All Countries" %in% country)) {
      plot_title_country <- "All Countries"
    } else {
      plot_title_country <- paste0(country)
    }
    
    # Now label the variables for title and axis labels for each survey
    
    var_label1 <- var1
    var_label2 <- var2
    plot_title1 <-
      paste("Plot of",
            var_label1,
            "and",
            var_label2,
            "in",
            plot_title_country)
    
    
    #--------------------- Set Colour Palettes-----------------------------
    
    
    # single colour per country
    
    blue1 <-   pal_material(palette = "blue")(10)[4]
    orange1 <- pal_material(palette = "orange")(10)[4]
    red1 <- pal_material(palette = "red")(10)[4]
    green1 <- pal_material(palette = "green")(10)[4]
    purple1 <- pal_material(palette = "purple")(10)[4]
    brown1 <- pal_material(palette = "brown")(10)[4]
    
    colours1 <- c(orange1, red1, green1, purple1, blue1, brown1)
    
    
    # dynamically create palettes for different country*factor interactions
    
    # here we get the number of levels of the factor, and get a palette of that number within the country colour
    
    # for var1
    
    
    if (is.ordered(data[[var1]]) | is.factor(data[[var1]])) {
      var1levs <- nlevels(data[[var1]])
      print(var1levs)
      
      if (var1levs == 7) {
        var1levs <- 2:8
      } else if (var1levs == 2) {
        var1levs <- c(4, 7)
      } else {
        var1levs <- 1:var1levs
      }
      
      print(var1levs)
    } else {
      
      var1levs <- 1 #so we dont get a "not found" error
      print("not in ord or cat")
      
    }
    
    bluevar1 <-   pal_material(palette = "blue")(10)[var1levs]
    orangevar1 <- pal_material(palette = "orange")(10)[var1levs]
    redvar1 <- pal_material(palette = "red")(10)[var1levs]
    greenvar1 <- pal_material(palette = "green")(10)[var1levs]
    purplevar1 <- pal_material(palette = "purple")(10)[var1levs]
    brownvar1 <- pal_material(palette = "brown")(10)[var1levs]
    
    coloursvar1 <- c(orangevar1, redvar1, greenvar1, purplevar1, bluevar1, brownvar1)
    
    
    # and var 2
    
    
    if (is.ordered(data[[var2]]) | is.factor(data[[var2]])) {
      var2levs <- nlevels(data[[var2]])
      print(var1levs)
      
      if (var2levs == 7) {
        var2levs <- 2:8
      } else if (var2levs == 2) {
        var2levs <- c(4, 7)
      } else {
        var2levs <- 1:var2levs
      }
      
      print(var2levs)
    } else {
      
      var2levs <- 1 #so we dont get a "not found" error
      print("not in ord or cat")
      
    }
    
    bluevar2 <-   pal_material(palette = "blue")(10)[var2levs]
    orangevar2 <- pal_material(palette = "orange")(10)[var2levs]
    redvar2 <- pal_material(palette = "red")(10)[var2levs]
    greenvar2 <- pal_material(palette = "green")(10)[var2levs]
    purplevar2 <- pal_material(palette = "purple")(10)[var2levs]
    brownvar2 <- pal_material(palette = "brown")(10)[var2levs]
    
    coloursvar2 <- c( orangevar2,  redvar2, greenvar2, purplevar2, bluevar2, brownvar2)
    
    #--------------------- Define Plots ---------------------------------
    
    # Specify countries to include if not all
    
    print("Country Check")
    
    if (!("All Countries" %in% country)) {
      data <- data[data$country %in% country, ]
    }
    
    
    #  Plot for two ordinal variables
    
    ordplot1 <- ggplot(data, aes(x = !!sym(var1),
                                 y = !!sym(var2),
                                 fill = !!sym("country"))) +
      geom_bin2d() +
      theme_minimal() +
      theme(
        plot.title =  element_text(hjust = 0.5, size = 20),
        axis.title.x = element_text(size = 16),
        axis.title.y = element_text(size = 16),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank()) +
      ggtitle(plot_title1) +
      scale_color_manual(values = colours1) +
      scale_fill_manual(values = colours1)+
      facet_grid(rows = vars(country))  
    
    # Plot for two categorical variables
  
    catplot1 <- ggplot(data, aes(x = !!sym(var1),
                                 fill = interaction(!!sym(var2), !!sym("country")))) +
      geom_bar(position = "stack", color = "black", size = 0.2) +
      theme_minimal() +
      theme(
        plot.title =  element_text(hjust = 0.5, size = 20),
        axis.title.x = element_text(size = 16),
        axis.title.y = element_text(size = 16)
      ) +
      ggtitle(plot_title1) +
      scale_color_manual(values = coloursvar2) +
      scale_fill_manual(values = coloursvar2)+
      facet_grid(rows = vars(country))
    
    # Plot for two continuous variables
    
    ## normal
    
    contplot <-
      ggplot(data,
             aes(
               x = !!sym(var1),
               y = !!sym(var2),
               color = !!sym(color)
             )) +
      geom_point(size = 1, alpha = 5 / 10, position = position_jitter(width = 0.2)) +
      geom_xsidedensity(aes(y = after_stat(density))) +
      geom_ysidedensity(aes(x = after_stat(density))) +
      labs(x = var_label1,
           y = var_label2) +
      theme_minimal() +
      theme(
        plot.title =  element_text(hjust = 0.5, size = 20),
        axis.title.x = element_text(size = 16),
        axis.title.y = element_text(size = 16)
      ) +
      ggtitle(plot_title1)     +
      scale_color_manual(values = colours1) +
      scale_fill_manual(values = colours1)
    
    ## if var1 is originally ordinal - to add jitter due to limited response options
    
    contplot2 <-
      ggplot(data,
             aes(
               x = !!sym(var1),
               y = !!sym(var2),
               color = !!sym(color)
             )) +
      geom_point(size = 1, alpha = 5 / 10, position = position_jitter(width = 0.1)) +
      geom_xsidedensity(aes(y = after_stat(density))) +
      geom_ysidedensity(aes(x = after_stat(density))) +
      labs(x = var_label1,
           y = var_label2) +
      theme_minimal() +
      theme(
        plot.title =  element_text(hjust = 0.5, size = 20),
        axis.title.x = element_text(size = 16),
        axis.title.y = element_text(size = 16)
      ) +
      ggtitle(plot_title1)     +
      scale_color_manual(values = colours1) +
      scale_fill_manual(values = colours1)
    
    ## if var2 is originally ordinal 
    
    contplot3 <-
      ggplot(data,
             aes(
               x = !!sym(var1),
               y = !!sym(var2),
               color = !!sym(color)
             )) +
      geom_point(size = 1, alpha = 5 / 10, position = position_jitter(height = 0.1)) +
      geom_xsidedensity(aes(y = after_stat(density))) +
      geom_ysidedensity(aes(x = after_stat(density))) +
      labs(x = var_label1,
           y = var_label2) +
      theme_minimal() +
      theme(
        plot.title =  element_text(hjust = 0.5, size = 20),
        axis.title.x = element_text(size = 16),
        axis.title.y = element_text(size = 16)
      ) +
      ggtitle(plot_title1)     +
      scale_color_manual(values = colours1) +
      scale_fill_manual(values = colours1)
    
    # Plot for 1 continuous + 1 categorical variable
    
    #if var1 is categorical
    
    contcatplot <- ggplot(data,
                          aes(
                            x = !!sym(var1),
                            y = !!sym(var2),
                            fill = interaction(!!sym(var1), !!sym("country"))))                           +
      stat_halfeye(
        position = "dodge",
        scale = 0.75,
        adjust = 0.5,
        justification = -0.2,
        .width = 0,
        point_colour = NA
      ) +
      geom_boxplot(position = "dodge",
                   width = 0.12) +
      theme_minimal() +
      theme(
        plot.title =  element_text(hjust = 0.5, size = 20),
        axis.title.x = element_text(size = 16),
        axis.ticks.x = element_blank(),
        axis.title.y = element_text(size = 16),
        legend.position = "bottom",
        legend.key.height = unit(1, 'cm'),
        legend.key.width = unit(2, 'cm'),
        legend.text = element_text(size = 14),
      ) +
      labs(fill = "")+
    ggtitle(plot_title1) +
      facet_grid(rows = vars(country))    +
      scale_color_manual(values = colours1) +
      scale_fill_manual(values = coloursvar1)+
      scale_alpha_discrete(range = c(0.33, 1)) +
      guides(fill = FALSE)
    
      
    #if var2 is categorical
    
    contcatplot2 <-
      ggplot(data,
             aes(
               x = !!sym(var2),
               y = !!sym(var1),
               fill = interaction(!!sym(var2), !!sym("country")),
             )) +
      stat_halfeye(
        position = "dodge",
        scale = 0.75,
        adjust = 0.5,
        justification = -0.2,
        .width = 0,
        point_colour = NA
      ) +
      geom_boxplot(position = "dodge",
                   width = 0.12) +
      theme_minimal() +
      theme(
        plot.title =  element_text(hjust = 0.5, size = 20),
        axis.title.x = element_text(size = 16),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.y = element_text(size = 16),
        legend.position = "bottom",
        legend.key.height = unit(1, 'cm'),
        legend.key.width = unit(2, 'cm'),
        legend.text = element_text(size = 14),
      ) +
      labs(fill = "") +
    ggtitle(plot_title1) +
      facet_grid(rows = vars(country))     +
      scale_color_manual(values = coloursvar2) +
      scale_fill_manual(values = coloursvar2) +
      guides(fill = FALSE)
    
    #Binary plot
    
    #for continuous var1
    
    binaryplot1 <-
      ggplot(data,
             aes(
               x = !!sym(var1),
               y = as.factor(!!sym(var2)),
               fill = !!sym(var2)
             )) +
      stat_halfeye(
        position = "dodge",
        scale = 0.75,
        adjust = 0.4,
        justification = -0.1,
        .width = 0,
        point_colour = NA
      ) +
      geom_boxplot(width = 0.10) +
      theme_minimal() +
      theme(
        plot.title =  element_text(hjust = 0.5, size = 20),
        axis.title.x = element_text(size = 16),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.title.y = element_text(size = 16)
      ) +
      ggtitle(plot_title1)
    
    
    #for categorical var1
    
    
    contingency_table <-
      as.data.frame.table(table(data$var1, as.factor(data$var2)))
    
    
    binaryplot2 <-
      ggplot(data %>% count(!!sym(var1), !!sym(var2)),
             aes(
               x = !!sym(var1),
               y = n,
               fill = !!sym(var2)
             )) +
      geom_bar(stat = "identity") +
      labs(x = "Variable 1", y = "Count", title = "Stacked Bar Chart") +
      theme_minimal() +
      scale_fill_discrete(name = "Variable 2")
    
    
    
    
    
    #--------------------- Specify *Which* Plots ---------------------------------
    
    #if both are ordinal
    
    print("checking plot type")
    
    print(class(data[[var1]]))
    print(class(data[[var2]]))
    
    if (var1 %in% ord_vars && var2 %in% ord_vars) {
      print("Both Ordinal")
      
      ordplot1
      
      #if either are categorical
      
     } else if (var1 %in% cat_vars || var2 %in% cat_vars) {
        print("Categorical")
        
        #then if both are categorical
        
        if (var1 %in% cat_vars && var2 %in% cat_vars) {
          print("Both Categorical")
          catplot1
          
          #if var1 is categorical and var2 is not
          
        } else if (var1 %in% cat_vars && !(var2 %in% cat_vars)) {
          print("Var1  Categorical, Var 2 not")
          contcatplot
          
          #if var2 is categorical and var1 is not
          
        } else if (!(var1 %in% cat_vars) && var2 %in% cat_vars) {
          print("Var2  Categorical, Var 1 not")
          contcatplot2
        }
        
        
        #if both continuous (neither categorical)
        
      } else {
        
        #without  line
        
        if (line == "No") {

          # if originaly ordinal
          
          if (var1 %in% origord){
            
          contplot2
              
          } else if(var2 %in% origord){
            
          contplot3  
            
          } else {
            
          contplot}
          
          #with line
          
        } else {
          
          if (var1 %in% origord){
            
            contplot2 + geom_smooth(show.legend = FALSE)
            
          } else if(var2 %in% origord){
            
            contplot3 + geom_smooth(show.legend = FALSE) 
            
          } else {
            
            contplot + geom_smooth(show.legend = FALSE)}
        }
        
      }
    }

    
#--------------------- Plot Function - One Variable----------------------------


funPlot2 <-
  function(data,
           var1,
           country,
           color = "country",
           survey,
           ordnum) {
    # Check args
    
    
    print(paste("Var1: ", var1))
    print(paste("Countries: ", country))

    #--------------------- Variable class checks -------------------------------
    
    #check variable classes
    
    print("CHECKING FOR ORDINAL VARIABLES")
    print(paste("Var1 Class:", class(data[[var1]])))

    origord <- names(data)[sapply(data, is.ordered)]  # create list of ordered factor cols
    
    #set ordinal as numeric if relevant
    
    if (var1 %in% origord && ordnum == "Yes"){
      
      print("recoding ordinal var1 as numeric")
      
      data[[var1]] <- as.numeric(data[[var1]])
      
    }

    
    ord_vars <- names(data)[sapply(data, is.ordered)]  # create updated list of ordered factor cols
    cat_vars <- names(data)[sapply(data, is.factor)]   # create list of factors
    
    print(paste("Var1 New Class:", class(data[[var1]])))

    #--------------------- Title and Labels ---------------------------------
    
    # First we create the title and labels
    # specify country for title
    
    if (!("All Countries" %in% country)) {
      plot_title_country <- "All Countries"
    } else {
      plot_title_country <- paste0(country)
    }
    
    # Now label the variables for title and axis labels for each survey
    
    var_label1 <- var1
    plot_title2 <-
      paste("Plot of",
            var_label1,
            "in",
            plot_title_country)
    
    
    
    #--------------------- Set Colour Palettes-----------------------------
    
    
    # single colour per country
    
    blue1 <-   pal_material(palette = "blue")(10)[4]
    orange1 <- pal_material(palette = "orange")(10)[4]
    red1 <- pal_material(palette = "red")(10)[4]
    green1 <- pal_material(palette = "green")(10)[4]
    purple1 <- pal_material(palette = "purple")(10)[4]
    brown1 <- pal_material(palette = "brown")(10)[4]
    
    colours1 <- c(orange1, red1, green1, purple1, blue1, brown1)
    
    
    # dynamically create palettes for different country*factor interactions
    
    # here we get the number of levels of the factor, and get a palette of that number within the country colour
    
    # for var1
    
    
    if (is.ordered(data[[var1]]) | is.factor(data[[var1]])) {
      var1levs <- nlevels(data[[var1]])
      print(var1levs)
      
      if (var1levs == 7) {
        var1levs <- 2:8
      } else if (var1levs == 2) {
        var1levs <- c(4, 7)
      } else {
        var1levs <- 1:var1levs
      }
      
      print(var1levs)
    } else {
      
      var1levs <- 1 #so we dont get a "not found" error
      print("not in ord or cat")
      
    }
    
    bluevar1 <-   pal_material(palette = "blue")(10)[var1levs]
    orangevar1 <- pal_material(palette = "orange")(10)[var1levs]
    redvar1 <- pal_material(palette = "red")(10)[var1levs]
    greenvar1 <- pal_material(palette = "green")(10)[var1levs]
    purplevar1 <- pal_material(palette = "purple")(10)[var1levs]
    brownvar1 <- pal_material(palette = "brown")(10)[var1levs]
    
    coloursvar1 <- c(orangevar1, redvar1, greenvar1, purplevar1, bluevar1, brownvar1)
    
    #--------------------- Format Data (if needed)-----------------------------
    
    # Counts
    
  countData <- data %>%
    dplyr::group_by(!!sym("country"), !!sym(var1)) %>%
    dplyr::summarise(count = n())%>%
    dplyr::ungroup() 
    
    
    
    #--------------------- Define Plots ---------------------------------
    
    # Specify countries to include if not all
    
    print("Country Check")
    
    if (!("All Countries" %in% country)) {
      data <- data[data$country %in% country, ]
    }
    
    
    catplot2.1 <- ggplot(data, aes(x = !!sym(var1),
                                 fill = interaction(!!sym(var1), !!sym("country")))) +
      geom_bar(position = "stack", color = "black", size = 0.2) +
      theme_minimal() +
      theme(
        plot.title =  element_text(hjust = 0.5, size = 20),
        axis.title.x = element_text(size = 16),
        axis.title.y = element_text(size = 16)
      ) +
      ggtitle(plot_title2) +
      scale_color_manual(values = coloursvar1) +
      scale_fill_manual(values = coloursvar1)+
      facet_grid(rows = vars(country))
    
    
    
    
   contplot1.1 <- ggplot(data, aes(x = !!sym(var1), fill = !!sym("country"))) +
     geom_density(alpha = 0.85) +
     scale_fill_manual(values = colours1) +
     scale_color_manual(values = colours1) +
     scale_y_continuous(breaks = seq(0, 0.75, by = .1)) +
     
     theme(
       text = element_text(size = 14,
                           color = "black"),
       
       panel.background = element_blank(),
       panel.grid.major = element_blank(),
       panel.grid.minor = element_blank(),
       
       legend.title = element_text(size = 16),
       legend.text = element_text(size = 14),
       legend.background = element_blank(),
       
       
       axis.title = element_text(size = 14),
       axis.text.x = element_text(
         size = 14,
         hjust = 1
       ),
       axis.text.y = element_text(size = 14),
       axis.ticks = element_line(color = "black")
     )+
     ggtitle(plot_title2) 
   
   
   #--------------------- Specify *Which* Plots ---------------------------------
   
   print("checking var type")
   
   print(class(data[[var1]]))

  # if ordinal or categorical
   
   if (var1 %in% ord_vars || var1 %in% cat_vars) {
     
     catplot2.1
     
   } else {
     
     contplot1.1
   }
    
    
  }
    
    
#--------------------- Table Functions ---------------------------------
    
    #demographics table
    
    funDemoTable <- function(data, country, plot) {
      data_tab <- data
      
      
      summary_demo <- data_tab %>%
        group_by(country) %>%
        summarize(
          Mean = mean(age),
          SD = sd(age),
          Male = sum(gender == "Male"),
          "%" = prop.table(table(gender))["Male"] * 100,
          Female = sum(gender == "Female"),
          "%." = prop.table(table(gender))["Female"] * 100
        )
      
      
      summary_demo %>%
        knitr::kable(col.names = c("country", "Mean", "SD", "N", "%", "N", "%")) %>%
        kable_styling("striped", full_width = F) %>%
        add_header_above(c(" ", "", "", "Male" = 2, "Female" = 2)) %>%
        add_header_above(c(" ", "Age" = 2, "Gender" = 4))
      
    }
    
    
    
    #correlation matrix
    
    funCorrMatrix <- function(data, country, plot, cormatvars) {
      #first select the country
      
      if ((!"All Countries" %in% country)) {
        data_tab <- data %>%
          select(-country, -gender) %>%
          select(all_of(cormatvars)) %>% #get variables for matrix
          mutate_at(vars(all_of(cormatvars)), as.numeric)  #turn them all numeric (or make NA if not)
        
      } else {
        data_tab <- data %>%
          select(-country, -gender) %>%
          select(all_of(cormatvars)) %>%
          mutate_at(vars(all_of(cormatvars)), as.numeric)
        
      }
      
      if (plot == "no") {
        cor(data_tab)
        
      } else {
        #create correlation matrix
        
        cormat_s1  <- cor(data_tab,
                          method = "pearson",
                          use = "pairwise.complete.obs")
        cormat_s1
        
        #plot correlation matrix
        
        cormat_s1_p <- cor.mtest(data_tab, conf.level = 0.95)
        
        corrplot(
          cormat_s1,
          method = 'color',
          diag = FALSE,
          type = "lower",
          tl.col = 'black',
          tl.srt = 45,
          
          #now add significance
          
          p.mat = cormat_s1_p$p,
          insig = "label_sig",
          sig.level = c(0.001, 0.01, 0.05),
          pch.cex = 0.95
        )
      }
      
    }
    
    
    #crosstabs
    
    
    funCrossTabs <- function(data, country, var1, var2) {
      #first select the country
      
      if ((!"All Countries" %in% country)) {
        data <- data %>%
          filter(country == country)
      }
      
      
      data <- data
      
      print(var1)
      print(var2)
      
      data %>%
        tbl_cross(row = var1,
                  col = var2,
                  percent = "row") %>%
        as_gt()
    }
    
    
    #Summary Stats
    
    
    funSummaryStats <- function(data, country, var1, var2) {
      print(var1)
      print(var2)
      
      
      
      data %>%
        tbl_summary(
          by = var1,
          include = var2,
          statistic = list(
            all_continuous() ~ "{mean} ({sd})",
            all_categorical() ~ "{n} / {N} ({p}%)"
          )
        ) %>%
        add_overall() %>%
        as_gt()
      
    }
    
    
    #--------------------- Sepecify Table Plots ---------------------------------
    
    
    funTabPlot1 <- function (data, country, type, cormatvars) {
      if (type == "Correlation Matrix") {
        funCorrMatrix(data, country, plot = "Yes", cormatvars)
        
      } else{
        print("boo") 
      }
    }
    
    #--------------------- Specify *Which* Table ---------------------------------
    
    funTab1 <- function(data,
                        country,
                        type,
                        var1,
                        var2,
                        cormatvars) {
      if (type == "Correlation Matrix") {
        funCorrMatrix(data, country, plot = "no", cormatvars)
        
        
      } else if (type == "Demographic") {
        funDemoTable(data)
        
      } else if (type == "Crosstabs") {
        funCrossTabs(data, country, var1, var2)
        
      } else if (type == "Summary Stats") {
        funSummaryStats(data, country, var1, var2)
      }
    }