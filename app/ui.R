
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
        "Survey 1",
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
                #plot box - set as UI box as is dynamically generated in server.R
                
                uiOutput("plot_box1"),
                
                #settings boxes
                box(
                  width = 3,
                  title = "Settings",
                  solidHeader = TRUE,
                  status = "primary",
                  "",
                  #inputs
                  
                  #single plot?
                  selectInput(
                    inputId = "single_s1",
                    label = "Single Variable Summary Plot?",
                    choices = c("Yes",
                                "No"),
                    selected = "No"
                  ),
                  
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
                      "meaningLife",
                      
                      "beliefInGod_ord",
                      "agnosticism_ord",
                      "religID1",
                      "religID2",
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
                      "spiritualForce",
                      "beliefChange", 
                      "changeNewBeliever", 
                      "changeNewNonBeliever",
                      "noChangeBeliever", 
                      "noChangeNonBeliever",

                      "region", 
                      "age_group",
                      "ethnicity",
                      "sexualOrientation",
                      "maritalStatus",
                      "primaryHomeschooled",
                      "primaryHomeschooledFaith",
                      "primarySchoolFaith",
                      "secondaryHomeschooled",
                      "secondaryHomeschooledFaith",
                      "secondarySchoolFaith",
                      "ses"
                    ),
                    
                    multiple = FALSE
                  ),
                  #var2 input
                  
                  
                  conditionalPanel(
                    condition = "input.single_s1 == 'No'",
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
                      "religID1",
                      "religID2",
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
                      "spiritualForce",
                      "beliefChange", 
                      "changeNewBeliever", 
                      "changeNewNonBeliever",
                      "noChangeBeliever", 
                      "noChangeNonBeliever",

                      "region", 
                      "age_group",
                      "ethnicity",
                      "sexualOrientation",
                      "maritalStatus",
                      "primaryHomeschooled",
                      "primaryHomeschooledFaith",
                      "primarySchoolFaith",
                      "secondaryHomeschooled",
                      "secondaryHomeschooledFaith",
                      "secondarySchoolFaith",
                      "ses"
                    ),
                    multiple = FALSE
                  )),
                  #countries input
                  selectInput(
                    inputId = "select_country_s1",
                    label = "Select Country",
                    choices = c("All Countries",
                                "Brazil",
                                "China", 
                                "Denmark", 
                                "Japan", 
                                "UK",
                                "USA" ),
                    selected = "All Countries",
                    multiple = TRUE
                  ),

                  #Ordinal as numeric
                  selectInput(
                    inputId = "ordnum_s1",
                    label = "Treat Ordinal as Numeric?",
                    choices = c("Yes",
                                "No"),
                    selected = "Yes"
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
              title = "Survey 1 Demograpics",
              width = 9,
              solidHeader = TRUE,
              tableOutput("demotab.s1")
            )
          ),
          
          
          #for cor matrix
          conditionalPanel(
            condition = "input.tabletype_s1 == 'Correlation Matrix'",
            box(
              title = "Survey 1 Correlations",
              width = 9,
              solidHeader = TRUE,
              div(style = "overflow-x: scroll; overflow-y: scroll",
                  tableOutput("cormat.s1"))
            )
          ),

          
          #for summary stats
          
          conditionalPanel(
            condition = "input.tabletype_s1 == 'Summary Stats'",
            box(
              title = "Survey 1 Summary",
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
            

            # variable inputs for correlation matrix
            
            conditionalPanel(
              condition = "input.tabletype_s1 == 'Correlation Matrix'",
              selectInput(
                inputId = "cormatvars.s1",
                label = "Select Variables",
                choices = list(
                      "age",

                      
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
                      "religID1",
                      "religID2",
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
                      "spiritualForce",
                      "beliefChange", 
                      "changeNewBeliever", 
                      "changeNewNonBeliever",
                      "noChangeBeliever", 
                      "noChangeNonBeliever",

                      "primaryHomeschooled",
                      "primaryHomeschooledFaith",
                      "primarySchoolFaith",
                      "secondaryHomeschooled",
                      "secondaryHomeschooledFaith",
                      "secondarySchoolFaith",
                      "ses"                  
                ),
                selected = c(
                  "religID1",
                  "beliefInGod_ord",
                  "rebelliousnessTrolling"
                ),
                multiple = TRUE
              )
            ),
            
            # group and variable selection for summary stats
            
            conditionalPanel(
              condition = "input.tabletype_s1 == 'Summary Stats'",
              selectInput(
                inputId = "sumstatsgrp.s1",
                label = "Group By",
                choices = c(
                      "age_group",
                      "gender",
                      "country",
                      

                      "religID1",
                      "religID2",


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
                      "spiritualForce",
                      "beliefChange", 
                      "changeNewBeliever", 
                      "changeNewNonBeliever",
                      "noChangeBeliever", 
                      "noChangeNonBeliever",

                      "region", 
                      "ethnicity",
                      "sexualOrientation",
                      "maritalStatus",
                      "primaryHomeschooled",
                      "primaryHomeschooledFaith",
                      "primarySchoolFaith",
                      "secondaryHomeschooled",
                      "secondaryHomeschooledFaith",
                      "secondarySchoolFaith"
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
                      "religID1",
                      "religID2",
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
                      "spiritualForce",
                      "beliefChange", 
                      "changeNewBeliever", 
                      "changeNewNonBeliever",
                      "noChangeBeliever", 
                      "noChangeNonBeliever",

                      "region", 
                      "age_group",
                      "ethnicity",
                      "sexualOrientation",
                      "maritalStatus",
                      "primaryHomeschooled",
                      "primaryHomeschooledFaith",
                      "primarySchoolFaith",
                      "secondaryHomeschooled",
                      "secondaryHomeschooledFaith",
                      "secondarySchoolFaith",
                      "ses"
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
              title = "Survey 1 Table Plots",
              solidHeader = TRUE,
              plotOutput("cormatplot.s1", height = "600px", width = "100%")
            )
          )
          
        )
      ),

      #------------------------------------------ Survey 2 -----------------------------------
      #Items/boxes in survey plots tab
      
      tabItem(tabName = "surv2_plots",
              fluidRow(
                #plot box - set as UI box as is dynamically generated in server.R
                
                uiOutput("plot_box2"),
                
                #settings boxes
                box(
                  width = 3,
                  title = "Settings",
                  solidHeader = TRUE,
                  status = "primary",
                  "",
                  #inputs

                  #single plot?
                  selectInput(
                    inputId = "single_s2",
                    label = "Single Variable Summary Plot?",
                    choices = c("Yes",
                                "No"),
                    selected = "No"
                  ),
                  #var 1 input
                  selectInput(
                    inputId = "select_var1_s2",
                    label = "Select Variable 1",
                    choices = list(
                      "age",
                      "gender",
                      "country",

                      "ambiguityTolerance",
                      "analyticThinking", 
                      "rationalityImportance",
                      "existentialInsecurity",
                      "anthropomorphism", 
                      "mentalizing",
                      "dualism",
                      "promisc_teleology",
                      
                      "beliefInGod_ord",
                      "agnosticism_ord",
                      "religID1",
                      "religID2",
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
                      "spiritualForce",
                      "beliefChange", 
                      "changeNewBeliever", 
                      "changeNewNonBeliever",
                      "noChangeBeliever", 
                      "noChangeNonBeliever",

                      "region", 
                      "age_group",
                      "ethnicity",
                      "sexualOrientation",
                      "maritalStatus",
                      "primaryHomeschooled",
                      "primaryHomeschooledFaith",
                      "primarySchoolFaith",
                      "secondaryHomeschooled",
                      "secondaryHomeschooledFaith",
                      "secondarySchoolFaith",
                      "ses"
                    ),
                    
                    multiple = FALSE
                  ),
                  #var2 input
                  conditionalPanel(
                    condition = "input.single_s2 == 'No'",
                    selectInput(
                    "select_var2_s2",
                    "Select Variable 2",
                    list(
                      "age",
                      "gender",
                      "country",
                      "ambiguityTolerance",
                      "analyticThinking", 
                      "rationalityImportance",
                      "existentialInsecurity",
                      "anthropomorphism", 
                      "mentalizing",
                      "dualism",
                      "promisc_teleology",
                      
                      "beliefInGod_ord",
                      "agnosticism_ord",
                      "religID1",
                      "religID2",
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
                      "spiritualForce",
                      "beliefChange", 
                      "changeNewBeliever", 
                      "changeNewNonBeliever",
                      "noChangeBeliever", 
                      "noChangeNonBeliever",

                      "region", 
                      "age_group",
                      "ethnicity",
                      "sexualOrientation",
                      "maritalStatus",
                      "primaryHomeschooled",
                      "primaryHomeschooledFaith",
                      "primarySchoolFaith",
                      "secondaryHomeschooled",
                      "secondaryHomeschooledFaith",
                      "secondarySchoolFaith",
                      "ses"
                    ),
                    multiple = FALSE
                  )),
                  #countries input
                  selectInput(
                    inputId = "select_country_s2",
                    label = "Select Country",
                    choices = c("All Countries",
                                "Brazil",
                                "China", 
                                "Denmark", 
                                "Japan", 
                                "UK",
                                "USA" ),
                    selected = "All Countries",
                    multiple = TRUE
                  ),
                  
                  #Ordinal as numeric
                  selectInput(
                    inputId = "ordnum_s2",
                    label = "Treat Ordinal as Numeric?",
                    choices = c("Yes",
                                "No"),
                    selected = "Yes"
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
                  uiOutput("varinfo2_s2")
                )
              )),
      
      
      #Items/boxes in survey tables tab
      
      #table box
      
      tabItem(
        tabName = "surv2_tabs",
        fluidRow(
          #table boxes
          
          #for demographics
          conditionalPanel(
            condition = "input.tabletype_s2 == 'Demographic'",
            box(
              title = "Survey 1 Demograpics",
              width = 9,
              solidHeader = TRUE,
              tableOutput("demotab.s2")
            )
          ),
          
          
          #for cor matrix
          conditionalPanel(
            condition = "input.tabletype_s2 == 'Correlation Matrix'",
            box(
              title = "Survey 2 Correlations",
              width = 9,
              solidHeader = TRUE,
              div(style = "overflow-x: scroll; overflow-y: scroll",
                  tableOutput("cormat.s2"))
            )
          ),
          
          #for summary stats
          
          conditionalPanel(
            condition = "input.tabletype_s2 == 'Summary Stats'",
            box(
              title = "Survey 2 Summary",
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
            
            # variable inputs for correlation matrix
            
            conditionalPanel(
              condition = "input.tabletype_s2 == 'Correlation Matrix'",
              selectInput(
                inputId = "cormatvars.s2",
                label = "Select Variables",
                choices = list(
                      "age",
                      "ambiguityTolerance",
                      "analyticThinking", 
                      "rationalityImportance",
                      "existentialInsecurity",
                      "anthropomorphism", 
                      "mentalizing",
                      "dualism",
                      "promisc_teleology",
                      
                      "beliefInGod_ord",
                      "agnosticism_ord",
                      "religID1",
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
                      "spiritualForce",
                      "beliefChange", 
                      "changeNewBeliever", 
                      "changeNewNonBeliever",
                      "noChangeBeliever", 
                      "noChangeNonBeliever",

                      "primaryHomeschooled",
                      "primaryHomeschooledFaith",
                      "primarySchoolFaith",
                      "secondaryHomeschooled",
                      "secondaryHomeschooledFaith",
                      "secondarySchoolFaith",
                      "ses"                  
                ),
                selected = c(
                  "beliefInGod_ord",
                  "age",
                  "religID1"
                ),
                multiple = TRUE
              )
            ),
            
            # group and variable selection for summary stats
            
            conditionalPanel(
              condition = "input.tabletype_s2 == 'Summary Stats'",
              selectInput(
                inputId = "sumstatsgrp.s2",
                label = "Group By",
                choices = c(

                      "age_group",
                      "gender",
                      "country",
                      

                      "religID1",
                      "religID2",


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
                      "spiritualForce",
                      "beliefChange", 
                      "changeNewBeliever", 
                      "changeNewNonBeliever",
                      "noChangeBeliever", 
                      "noChangeNonBeliever",

                      "region", 
                      "ethnicity",
                      "sexualOrientation",
                      "maritalStatus",
                      "primaryHomeschooled",
                      "primaryHomeschooledFaith",
                      "primarySchoolFaith",
                      "secondaryHomeschooled",
                      "secondaryHomeschooledFaith",
                      "secondarySchoolFaith"
                ),
                selected = "country",
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
                      "ambiguityTolerance",
                      "analyticThinking", 
                      "rationalityImportance",
                      "existentialInsecurity",
                      "anthropomorphism", 
                      "mentalizing",
                      "dualism",
                      "promisc_teleology",
                      
                      "beliefInGod_ord",
                      "agnosticism_ord",
                      "religID1",
                      "religID2",
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
                      "spiritualForce",
                      "beliefChange", 
                      "changeNewBeliever", 
                      "changeNewNonBeliever",
                      "noChangeBeliever", 
                      "noChangeNonBeliever",

                      "region", 
                      "age_group",
                      "ethnicity",
                      "sexualOrientation",
                      "maritalStatus",
                      "primaryHomeschooled",
                      "primaryHomeschooledFaith",
                      "primarySchoolFaith",
                      "secondaryHomeschooled",
                      "secondaryHomeschooledFaith",
                      "secondarySchoolFaith",
                      "ses"
                ),
                selected = "beliefInGod_ord",
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
              title = "Survey 2 Table Plots",
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
