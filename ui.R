library(shiny)

shinyUI(fluidPage( # flexible UI setup
  
  # Application title
  titlePanel("Google Analytics"),
  
  sidebarLayout( # simple setup, controls on left, output on right
    
    sidebarPanel( # sidebar layout
      
      dateRangeInput(inputId = "dateRange", label = "Date range", 
                     start = "2013-05-01"), # select date
      
      checkboxGroupInput(inputId = "domainShow", # select network domain
                         label = "Show NHS and other domain
                                (defaults to all)?",
                         choices = list("NHS users" = "nhs.uk",
                                        "Other" = "Other"),
                         selected = c("nhs.uk", "Other")
      ),
      
      hr(),
      
      radioButtons(inputId = "outputRequired", label = "Output required", 
                   choices = list("Average session" = "meanSession", 
                                  "Users" = "users", "Sessions" = "sessions")),
      
      checkboxInput("smooth", label = "Add smoother?", # add smoother 
                    value = FALSE)
      
    ),
    
    mainPanel(     # main panel section
      tabsetPanel( # set up tabbed output 
        tabPanel("Summary", textOutput("textDisplay")),
        tabPanel("Trend", plotOutput("trend")),
        tabPanel("Map", plotOutput("ggplotMap"))
      )
    )
  )
))