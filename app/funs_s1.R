#--------------------- DEFINE FUNCTIONS ---------------------------------



#--------------------- Variable Types ---------------------------------

#--------------------- Plot Function ---------------------------------




# Plot function

funPlot1 <-
  function(data,
           var1,
           var2,
           country,
           shape = "country",
           color = "country",
           survey,
           line) {
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
    
    #--------------------- Define Plots ---------------------------------
    
    # Specify countries to include if not all
    
    print(country)
    
    if (!("All Countries" %in% country)) {
      data <- data %>%
        filter(country %in% country)
    }
    
    print(data$country)
    
    #  Plot for two ordinal variables
    
    ordplot1 <- ggplot(data, aes(x = !!sym(var1),
                                 y = !!sym(var2))) +
      
      geom_bin2d() +
      theme_minimal() +
      theme(
        plot.title =  element_text(hjust = 0.5, size = 20),
        axis.title.x = element_text(size = 16),
        axis.title.y = element_text(size = 16),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank()) +
      ggtitle(plot_title1)
    
    # Plot for two categorical variables
    
    catplot1 <- ggplot(data, aes(x = !!sym(var1),
                                 fill = !!sym(var2))) +
      geom_bar(position = "stack") +
      theme_minimal() +
      theme(
        plot.title =  element_text(hjust = 0.5, size = 20),
        axis.title.x = element_text(size = 16),
        axis.title.y = element_text(size = 16)
      ) +
      ggtitle(plot_title1)
    
    # Plot for two continuous variables
    
    contplot <-
      ggplot(data,
             aes(
               x = !!sym(var1),
               y = !!sym(var2),
               shape = !!sym(shape),
               color = !!sym(color)
             )) +
      geom_point(size = 4, alpha = 5 / 10) +
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
      scale_color_manual(values = c("#30ba8f", "#253f8c", "#8fb9ca", "#f0c05a", "#e9765b", "#9b59b6")) +
      scale_fill_manual(values = c("#30ba8f", "#253f8c", "#8fb9ca", "#f0c05a", "#e9765b", "#9b59b6"))
    
    # Plot for 1 continuous + 1 categorical variable
    
    #if x is categorical
    
    contcatplot <- ggplot(data,
                          aes(
                            x = !!sym(var1),
                            y = !!sym(var2),
                            fill = str_wrap(!!sym(var1), 20)
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
                   scale = 0.75,
                   width = 0.12) +
      theme_minimal() +
      theme(
        plot.title =  element_text(hjust = 0.5, size = 20),
        axis.title.x = element_text(size = 16),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.title.y = element_text(size = 16),
        legend.position = "bottom",
        legend.key.height = unit(1, 'cm'),
        legend.key.width = unit(2, 'cm'),
        legend.text = element_text(size = 14),
      ) +
      labs(fill = "")
    ggtitle(plot_title1)
    
    
    
    #if y is categorical
    
    contcatplot2 <-
      ggplot(data,
             aes(
               x = !!sym(var1),
               y = !!sym(var2),
               fill = str_wrap(!!sym(var2), 20)
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
                   scale = 0.75,
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
      labs(fill = "")
    ggtitle(plot_title1)
    
    
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
    
    #add an "if" for plots of binary variables
    
    print(paste("Var1: ", var1))
    print(paste("Var2: ", var2))
    
    print(class(var1))
    print(class(var2))
    
    

    cat_vars <- names(data)[sapply(data, is.factor)]
    ord_vars <- names(data)[sapply(data, is.ordered)]
    
    
    #if both are ordinal
    
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
          prints
          
          contplot
          
          #with line
          
        } else {
          contplot +
            geom_smooth(show.legend = FALSE)
        }
        
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
          select(-sountry, -id, -gender) %>%
          select(all_of(cormatvars)) %>% #get variables for matrix
          mutate_at(vars(all_of(cormatvars)), as.numeric)  #turn them all numeric (or make NA if not)
        
      } else {
        data_tab <- data %>%
          select(-country, -id, -gender) %>%
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
        print("boo") #this does nothing
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