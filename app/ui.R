
# This file defines the UI. First we specify the sidebar, then the elements that are displayed within these pages, in our case pages are a table and a plot tab for eachs survey.


#---------------------------Sidebar spec-----------------------------------------------------------

ui <- dashboardPage(
  skin = "black",
  
  dashboardHeader(
    # Set height of dashboardHeader using CSS
    tags$li(
      class = "dropdown",
      tags$style(".main-header {max-height: 75px}"),
      tags$style(".main-header .logo {height: 75px}")
    ),
    
    title =
      #add logo title using css
      tags$a(href = "https://www.explainingatheism.org/",
             tags$img(src = "ealogo.jpg", height = "75px"))
    
  ),
  dashboardSidebar(
    tags$style(".left-side, .main-sidebar {padding-top: 75px}"),
    sidebarMenu(
      menuItem("Info", tabName = "info", icon = icon("info")),
      
      menuItem(
        "Survey 1 (Morals/Values)",
        tabName = "Survey 1",
        icon = icon("bars"),
        startExpanded = TRUE,
        menuSubItem(
          "Survey 1 Plots",
          tabName = "surv1_plots",
          icon = icon("chart-simple")
        ),
        menuSubItem(
          "Survey 1 Tables",
          tabName = "surv1_tabs",
          icon = icon("table")
        )
      ),
      
      menuItem(
        "Survey 2",
        tabName = "Survey 2",
        icon = icon("bars"),
        startExpanded = TRUE,
        menuSubItem(
          "Survey 2 Plots",
          tabName = "surv2_plots",
          icon = icon("chart-simple")
        ),
        menuSubItem(
          "Survey 2 Tables",
          tabName = "surv2_tabs",
          icon = icon("table")
        )
      )
    )
    
  ),
  dashboardBody(
    # some css styling:
    
    tags$style(HTML(".sidebar-menu li a { font-size: 18px; }")),
    tags$head(tags$style(
      HTML('
            .skin-black .sidebar a {
                color: #253f8c !important;}')
    )),
    
    use_theme(mytheme),
    tabItems(
      #------------------------------------------ Info -----------------------------------
      
      tabItem(tabName = "info",
              fluidRow(box(
                width = 9,
                htmlOutput("text1")
              ))),
      
      
      
      #------------------------------------------ Survey 1 -----------------------------------
      
      #Items/boxes in survey plots tab
      
      tabItem(tabName = "surv1_plots",
              fluidRow(
                #plot box
                box(
                  width = 9,
                  title = "Survey 1 Plots",
                  solidHeader = TRUE,
                  plotOutput("plot_s1", height = 800)
                ),
                
                #settings boxes
                box(
                  width = 3,
                  title = "Settings",
                  solidHeader = TRUE,
                  status = "primary",
                  "If categorical variables are selected violin plots will be shown, unless both are categorical in which case stacked bar charts will be shown. If  both are ordinal heatmaps are displayed",
                  #inputs
                  #var 1 input
                  selectInput(
                    inputId = "select_var1_s1",
                    label = "Select Variable 1",
                    choices = list(
                      "age",
                      "gender",
                      "country",
                      
                      "rebelliousnessTrolling",
                      "cred",
                      "credCaregiver",
                      "credGroupLeader",
                      "credGroupMember",
                      "credGroup",
                      "credHometown",
                      "credHighschool",
                      "sincerityGroupLeader",
                      "sincerityGroupMember",
                      "sincerityCaregiver",
                      "sincerityHometown",
                      "sincerityHighschool",
                      "believersHometown",
                      "believersHighschool",
                      "normativity",
                      "normativityNation",
                      "normativityEthnicity",
                      "normativityPeers",
                      "normativityGroup",
                      "collectivism",
                      "existentialInsecurity",
                      "nontheisticSocialisation",
                      "religiousEmphasis",
                      "socialDesirability",
                      "meaningLife"
                    ),
                    
                    multiple = FALSE
                  ),
                  #var2 input
                  selectInput(
                    "select_var2_s1",
                    "Select Variable 2",
                    list(
                      "age",
                      "gender",
                      "country",
                      
                      "rebelliousnessTrolling",
                      "cred",
                      "credCaregiver",
                      "credGroupLeader",
                      "credGroupMember",
                      "credGroup",
                      "credHometown",
                      "credHighschool",
                      "sincerityGroupLeader",
                      "sincerityGroupMember",
                      "sincerityCaregiver",
                      "sincerityHometown",
                      "sincerityHighschool",
                      "believersHometown",
                      "believersHighschool",
                      "normativity",
                      "normativityNation",
                      "normativityEthnicity",
                      "normativityPeers",
                      "normativityGroup",
                      "collectivism",
                      "existentialInsecurity",
                      "nontheisticSocialisation",
                      "religiousEmphasis",
                      "socialDesirability",
                      "meaningLife",
                      
                      "beliefInGod_ord",
                      "agnosticism_ord",
                      "religID_1",
                      "religID_2",
                      "supernaturalism",
                      "religiousAttendance",
                      "prayerFrequency",
                      "antiReligiosity",
                      "godKnowingPossibility",
                      "beliefConfidence",
                      "apatheismGod",
                      "apatheismPurpose",
                      "apatheism",
                      "truthPossibility",
                      "supernaturalism",
                      "afterlifeExistence",
                      "afterlifeReward",
                      "afterlifePunishment",
                      "reincarnation",
                      "astrology",
                      "mysticalPeople",
                      "mysticalObjects",
                      "goodEvil",
                      "universalLifeforce",
                      "karma",
                      "fate",
                      "supernatualBeings",
                      "goodSupernaturalBeings",
                      "harmfulSupernaturalBeings",
                      "evilEye",
                      "beliefInGod_cat", 
                      "nonBeliefIdentity", 
                      "beliefInGod_bin", 
                      "agnosticIdentity_bin", 
                      "religiousAttendance", 
                      "prayerFrequency", 
                      "religiousObjects", 
                      "caregiverReligiosity", 
                      "caregiverReligiousID", 
                      "caregiverReligiosity2", 
                      "caregiverReligiousID2",
                      "atheistMembership", 
                      "atheistID", 
                      "naturalism", 
                      "spiritualForce"
                    ),
                    multiple = FALSE
                  ),
                  #countries input
                  selectInput(
                    inputId = "select_country.s1",
                    label = "Select Country",
                    choices = c("All Countries",
                                "Brazil",
                                "China", 
                                "Denmark", 
                                "Japan", 
                                "UK",
                                "US" ),
                    selected = "All Countries",
                    multiple = TRUE
                  ),
                  #line input
                  selectInput(
                    inputId = "line_s1",
                    label = "Plot Line",
                    choices = c("Yes",
                                "No"),
                    selected = "Yes"
                  )
                ),
                
                box(
                  title = "Variable Info",
                  width = 3,
                  status = "warning",
                  solidHeader = TRUE,
                  uiOutput("varinfo1_s1"),
                  uiOutput("varinfo2_s1")
                )
              )),
      
      
      #Items/boxes in survey tables tab
      
      #table box
      
      tabItem(
        tabName = "surv1_tabs",
        fluidRow(
          #table boxes
          
          #for demographics
          conditionalPanel(
            condition = "input.tabletype_s1 == 'Demographic'",
            box(
              title = "Survey 1 (Morals/Values) Demograpics",
              width = 9,
              solidHeader = TRUE,
              tableOutput("demotab.s1")
            )
          ),
          
          
          #for cor matrix
          conditionalPanel(
            condition = "input.tabletype_s1 == 'Correlation Matrix'",
            box(
              title = "Survey 1 (Morals/Values) Correlations",
              width = 9,
              solidHeader = TRUE,
              div(style = "overflow-x: scroll; overflow-y: scroll",
                  tableOutput("cormat.s1"))
            )
          ),
          
          #for crosstabs
          conditionalPanel(
            condition = "input.tabletype_s1 == 'Crosstabs'",
            box(
              title = "Survey 1 (Morals/Values) Crosstabs",
              width = 9,
              solidHeader = TRUE,
              gt_output("crosstabs.s1")
            )
          ),
          
          #for summary stats
          
          conditionalPanel(
            condition = "input.tabletype_s1 == 'Summary Stats'",
            box(
              title = "Survey 1 (Morals/Values) Summary",
              width = 9,
              solidHeader = TRUE,
              gt_output("summarystats.s1")
            )
          ),
          
          
          #settings box
          box(
            width = 3,
            title = "Settings",
            solidHeader = TRUE,
            #table type
            
            selectInput(
              inputId = "tabletype_s1",
              label = "Select Table",
              choices = c(
                "Demographic",
                "Correlation Matrix",
                "Crosstabs",
                "Summary Stats"
              ),
              selected = "Demographics"
            ),
            
            # conditional countries input(s)
            
            conditionalPanel(
              condition = "input.tabletype_s1 == 'Correlation Matrix'",
              selectInput(
                inputId = "select_country.s1",
                label = "Select Country",
                choices = c("All Countries", "Brazil", "Japan", "UK"),
                selected = "All Countries",
                multiple = TRUE
              )
            ),
            
            conditionalPanel(
              condition = "input.tabletype_s1 == 'Crosstabs'",
              selectInput(
                inputId = "select_country.s1",
                label = "Select Country",
                choices = c("All Countries", "Brazil", "Japan", "UK"),
                selected = "All Countries",
                multiple = TRUE
              )
            ),
            
            
            # variable inputs for correlation matrix
            
            conditionalPanel(
              condition = "input.tabletype_s1 == 'Correlation Matrix'",
              selectInput(
                inputId = "cormatvars.s1",
                label = "Select Variables",
                choices = list(
                  "age",
                  "gender",
                  "country",
                  
                  "indiv_collectivism",
                  "rebel_all",
                  "rebel_troll",
                  "rebel_act",
                  "choice_norms",
                  
                  "belief_god_cat",
                  "belief_god_bin",
                  "belief_god_con",
                  "agnosticism_cont",
                  "agnosticism_bin",
                  "atheist_mem",
                  "atheist_id",
                  "relig_id_1",
                  "relig_id_2",
                  "relig_attend",
                  "prayer_freq",
                  "relig_object",
                  "anti_relig",
                  "god_knowing",
                  "belief_confidence",
                  "apatheism_god",
                  "apatheism_purpose",
                  "apatheism",
                  "truth_possibility",
                  "afterlife_exist",
                  "afterlife_punish",
                  "afterlife_reward",
                  "reincarnation",
                  "astrology",
                  "mystical_people",
                  "mystical_objects",
                  "good_evil",
                  "lifeforce",
                  "karma",
                  "fate",
                  "supernat_beings",
                  "good_beings",
                  "harmful_beings",
                  "evil_eye",
                  "spiritual_force",
                  "lucky_objects",
                  "naturalism"
                ),
                selected = c(
                  "belief_god_con",
                  "choice_norms",
                  "rebel_all",
                  "indiv_collectivism",
                  "relig_id_1"
                ),
                multiple = TRUE
              )
            ),
            
            #rows inputs for crosstabs
            
            conditionalPanel(
              condition = "input.tabletype_s1 == 'Crosstabs'",
              selectInput(
                inputId = "ctabsrow.s1",
                label = "Select Row Variable",
                choices = c("country",
                            "gender",
                            "relig_id_1")
              )
            ),
            
            conditionalPanel(
              condition = "input.tabletype_s1 == 'Crosstabs'",
              selectInput(
                inputId = "ctabscol.s1",
                label = "Select Column Variable",
                choices = c("relig_id_1",
                            "country",
                            "gender")
              )
            ),
            
            
            # group and variable selection for summary stats
            
            conditionalPanel(
              condition = "input.tabletype_s1 == 'Summary Stats'",
              selectInput(
                inputId = "sumstatsgrp.s1",
                label = "Group By",
                choices = c(
                  "gender",
                  "country",
                  "relig_id_1",
                  "belief_god_cat",
                  "belief_god_bin",
                  "agnosticism_bin",
                  "belief_god_cat",
                  "atheist_mem",
                  "atheist_id",
                  "relig_id_2",
                  "lucky_objects",
                  "relig_attend",
                  "relig_object",
                  "prayer_freq",
                  "spiritual_force",
                  "lucky_objects",
                  "naturalism"
                ),
                selected = "None",
                multiple = FALSE
              )
            ),
            
            
            conditionalPanel(
              condition = "input.tabletype_s1 == 'Summary Stats'",
              selectInput(
                inputId = "sumstatsvars.s1",
                label = "Select Variables",
                choices = list(
                  "age",
                  "gender",
                  "country",
                  
                  "indiv_collectivism",
                  "rebel_all",
                  "rebel_troll",
                  "rebel_act",
                  "choice_norms",
                  
                  "belief_god_con",
                  "agnosticism_cont",
                  "relig_id_1",
                  "belief_god_cat",
                  "belief_god_bin",
                  "agnosticism_bin",
                  "belief_god_cat",
                  "atheist_mem",
                  "atheist_id",
                  "relig_id_2",
                  "lucky_objects",
                  "relig_attend",
                  "relig_object",
                  "prayer_freq",
                  "spiritual_force",
                  "lucky_objects",
                  "naturalism",
                  
                  "relig_object",
                  "anti_relig",
                  "god_knowing",
                  "belief_confidence",
                  "apatheism_god",
                  "apatheism_purpose",
                  "apatheism",
                  "truth_possibility",
                  "afterlife_exist",
                  "afterlife_punish",
                  "afterlife_reward",
                  "reincarnation",
                  "astrology",
                  "mystical_people",
                  "mystical_objects",
                  "good_evil",
                  "lifeforce",
                  "karma",
                  "fate",
                  "supernat_beings",
                  "good_beings",
                  "harmful_beings",
                  "evil_eye",
                  "spiritual_force"
                ),
                selected = "belief_god_con",
                multiple = TRUE
              )
            )
          ),
          
          
          #Plot
          
          # correlation coefficients for correlation matrix
          conditionalPanel(
            condition = "input.tabletype_s1 == 'Correlation Matrix'",
            box(
              width = 9,
              title = "Survey 1 (Morals/Values) Table Plots",
              solidHeader = TRUE,
              plotOutput("cormatplot.s1", height = "600px", width = "100%")
            )
          )
          
        )
      ),
      #tabitem close
      
      
      #------------------------------------------ Survey 2 -----------------------------------
      
      
      tabItem(tabName = "surv2_plots",
              fluidRow(
                #plot box
                box(
                  width = 9,
                  title = "Survey 2 (Cognitive Styles) Plots",
                  solidHeader = TRUE,
                  plotOutput("plot_s2", height = 800)
                ),
                
                #settings boxes
                box(
                  width = 3,
                  title = "Settings",
                  solidHeader = TRUE,
                  status = "primary",
                  "If categorical variables are selected violin plots will be shown, unless both are categorical in which case stacked bar charts will be shown. If  both are ordinal heatmaps are displayed",
                  #inputs
                  #var 1 input
                  selectInput(
                    inputId = "select_var1_s2",
                    label = "Select Variable 1 (x-axis)",
                    choices = list("naturalism"),
                    
                    multiple = FALSE
                  ),
                  #var2 input
                  selectInput(
                    "select_var2_s2",
                    "Select Variable 2 (y-axis)",
                    list(
                      "age",
                      "gender",
                      "country",
                      
                      "ambiguity_tol",
                      "crt_correct",
                      "crt_type",
                      "nverb_reason",
                      "rationality_moral",
                      "rationality_imp",
                      
                      "belief_god_cat",
                      "belief_god_bin",
                      "belief_god_con",
                      "agnosticism_cont",
                      "agnosticism_bin",
                      "atheist_mem",
                      "atheist_id",
                      "relig_id_1",
                      "relig_id_2",
                      "relig_attend",
                      "prayer_freq",
                      "relig_object",
                      "anti_relig",
                      "god_knowing",
                      "belief_confidence",
                      "apatheism_god",
                      "apatheism_purpose",
                      "apatheism",
                      "truth_possibility",
                      "afterlife_exist",
                      "afterlife_punish",
                      "afterlife_reward",
                      "reincarnation",
                      "astrology",
                      "mystical_people",
                      "mystical_objects",
                      "good_evil",
                      "lifeforce",
                      "karma",
                      "fate",
                      "supernat_beings",
                      "good_beings",
                      "harmful_beings",
                      "evil_eye",
                      "spiritual_force",
                      "lucky_objects",
                      "naturalism"
                    ),
                    multiple = FALSE
                  ),
                  #countries input
                  selectInput(
                    inputId = "select_country.s2",
                    label = "Select Country",
                    choices = c("All Countries",
                                "Brazil",
                                "UK"),
                    selected = "All Countries",
                    multiple = TRUE
                  ),
                  #line input
                  selectInput(
                    inputId = "line_s2",
                    label = "Plot Line",
                    choices = c("Yes",
                                "No"),
                    selected = "Yes"
                  )
                ),
                
                box(
                  title = "Variable Info",
                  width = 3,
                  status = "warning",
                  solidHeader = TRUE,
                  uiOutput("varinfo1_s2"),
                  uiOutput("varinfo2_s2"))
              )),
      
      
      tabItem(
        tabName = "surv2_tabs",
        fluidRow(
          #table boxes
          
          #for demographics
          conditionalPanel(
            condition = "input.tabletype_s2 == 'Demographic'",
            box(
              title = "Survey 2 (Cognitive Style) Demograpics",
              width = 9,
              solidHeader = TRUE,
              tableOutput("demotab.s2")
            )
          ),
          
          #for cor matrix
          conditionalPanel(
            condition = "input.tabletype_s2 == 'Correlation Matrix'",
            box(
              title = "Survey 2 (Cognitive Style) Correlations",
              width = 9,
              solidHeader = TRUE,
              div(style = "overflow-x: scroll; overflow-y: scroll",
                  tableOutput("cormat.s2"))
            )
          ),
          
          #for crosstabs
          conditionalPanel(
            condition = "input.tabletype_s2 == 'Crosstabs'",
            box(
              title = "Survey 2 (Cognitive Style) Crosstabs",
              width = 9,
              solidHeader = TRUE,
              gt_output("crosstabs.s2")
            )
          ),
          
          #for summary stats
          
          conditionalPanel(
            condition = "input.tabletype_s2 == 'Summary Stats'",
            box(
              title = "Survey 2 (Cognitive Style) Summary",
              width = 9,
              solidHeader = TRUE,
              gt_output("summarystats.s2")
            )
          ),
          
          #settings box
          box(
            width = 3,
            title = "Settings",
            solidHeader = TRUE,
            #table type
            
            selectInput(
              inputId = "tabletype_s2",
              label = "Select Table",
              choices = c(
                "Demographic",
                "Correlation Matrix",
                "Crosstabs",
                "Summary Stats"
              ),
              selected = "Demographics"
            ),
            
            
            
            # conditional countries input(s)
            
            conditionalPanel(
              condition = "input.tabletype_s2 == 'Correlation Matrix'",
              selectInput(
                inputId = "select_country.s2",
                label = "Select Country",
                choices = c("All Countries", "Brazil", "Japan", "UK"),
                selected = "All Countries",
                multiple = TRUE
              )
            ),
            
            conditionalPanel(
              condition = "input.tabletype_s2 == 'Crosstabs'",
              selectInput(
                inputId = "select_country.s2",
                label = "Select Country",
                choices = c("All Countries", "Brazil", "Japan", "UK"),
                selected = "All Countries",
                multiple = TRUE
              )
            ),
            
            
            # variable inputs for correlation matrix
            
            conditionalPanel(
              condition = "input.tabletype_s2 == 'Correlation Matrix'",
              selectInput(
                inputId = "cormatvars.s2",
                label = "Select Variables",
                choices = list(
                  "age",
                  "gender",
                  "country",
                  
                  "ambiguity_tol",
                  "crt_correct",
                  "crt_type",
                  "nverb_reason",
                  "rationality_moral",
                  "rationality_imp",
                  
                  "belief_god_cat",
                  "belief_god_bin",
                  "belief_god_con",
                  "agnosticism_cont",
                  "agnosticism_bin",
                  "atheist_mem",
                  "atheist_id",
                  "relig_id_1",
                  "relig_id_2",
                  "relig_attend",
                  "prayer_freq",
                  "relig_object",
                  "anti_relig",
                  "god_knowing",
                  "belief_confidence",
                  "apatheism_god",
                  "apatheism_purpose",
                  "apatheism",
                  "truth_possibility",
                  "afterlife_exist",
                  "afterlife_punish",
                  "afterlife_reward",
                  "reincarnation",
                  "astrology",
                  "mystical_people",
                  "mystical_objects",
                  "good_evil",
                  "lifeforce",
                  "karma",
                  "fate",
                  "supernat_beings",
                  "good_beings",
                  "harmful_beings",
                  "evil_eye",
                  "spiritual_force",
                  "lucky_objects",
                  "naturalism"
                ),
                selected = c("belief_god_con"),
                multiple = TRUE
              )
            ),
            
            #rows inputs for crosstabs - need to be categorical
            
            conditionalPanel(
              condition = "input.tabletype_s2 == 'Crosstabs'",
              selectInput(
                inputId = "ctabsrow.s2",
                label = "Select Row Variable",
                choices = c("country",
                            "gender",
                            "relig_id_1")
              )
            ),
            
            conditionalPanel(
              condition = "input.tabletype_s2 == 'Crosstabs'",
              selectInput(
                inputId = "ctabscol.s2",
                label = "Select Column Variable",
                choices = c("relig_id_1",
                            "country",
                            "gender")
              )
            ),
            
            
            # group and variable selection for summary stats
            
            conditionalPanel(
              condition = "input.tabletype_s2 == 'Summary Stats'",
              selectInput(
                inputId = "sumstatsgrp.s2",
                label = "Group By",
                choices = c("gender", 
                            "country", 
                            "relig_id_1"),
                selected = "None",
                multiple = FALSE
              )
            ),
            
            
            conditionalPanel(
              condition = "input.tabletype_s2 == 'Summary Stats'",
              selectInput(
                inputId = "sumstatsvars.s2",
                label = "Select Variables",
                choices = list(
                  "age",
                  "gender",
                  "country",
                  
                  "ambiguity_tol",
                  "crt_correct",
                  "crt_type",
                  "nverb_reason",
                  "rationality_moral",
                  "rationality_imp",
                  
                  "belief_god_cat",
                  "belief_god_bin",
                  "belief_god_con",
                  "agnosticism_cont",
                  "agnosticism_bin",
                  "atheist_mem",
                  "atheist_id",
                  "relig_id_1",
                  "relig_id_2",
                  "relig_attend",
                  "prayer_freq",
                  "relig_object",
                  "anti_relig",
                  "god_knowing",
                  "belief_confidence",
                  "apatheism_god",
                  "apatheism_purpose",
                  "apatheism",
                  "truth_possibility",
                  "afterlife_exist",
                  "afterlife_punish",
                  "afterlife_reward",
                  "reincarnation",
                  "astrology",
                  "mystical_people",
                  "mystical_objects",
                  "good_evil",
                  "lifeforce",
                  "karma",
                  "fate",
                  "supernat_beings",
                  "good_beings",
                  "harmful_beings",
                  "evil_eye",
                  "spiritual_force",
                  "lucky_objects",
                  "naturalism"
                  
                ),
                selected = "belief_god_con",
                multiple = TRUE
              )
            )
          ),
          
          #Plot
          
          # correlation coefficients for correlation matrix
          conditionalPanel(
            condition = "input.tabletype_s2 == 'Correlation Matrix'",
            box(
              width = 9,
              title = "Survey 2 (Cognitive Styles) Table Plots",
              solidHeader = TRUE,
              plotOutput("cormatplot.s2", height = "600px", width = "100%")
            )
          )
          
        )
      )
      #------------------------------------------ Sidebar close -----------------------------------
      
      
    ) #tabitems close
    
  ) #dashboard body close
) #dashboard page close
