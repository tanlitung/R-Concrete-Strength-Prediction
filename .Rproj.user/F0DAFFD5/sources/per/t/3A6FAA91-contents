library(shinydashboard)
library(shinydashboardPlus)
library(DT)
library(neuralnet)
source("functions.R")

ui <- dashboardPage(
    dashboardHeader(title = "AI Concrete",
                    
                    dropdownMenu(type = "messages",
                                 messageItem(
                                     from = "Hey there!",
                                     message = "AI Concrete welcomed you.",
                                     icon=icon("user")
                                 ),
                                 
                                 messageItem(
                                     from = "Support",
                                     message = "Contact me at tanlitung388@gmail.com",
                                     icon = icon("life-ring"),
                                     time = "2019-07-13"
                                 )
                    ),#dropdown message
                    
                    dropdownMenu(type = "notifications",
                                 notificationItem(
                                     text = "468 person visited us today!",
                                     icon("users")
                                 ),
                                 notificationItem(
                                     text = "5687 people liked this project",
                                     icon("thumbs-up")
                                 )
                    )#dropdown Notification
                
                    
                    ),#end of dropdown menu
    
    dashboardSidebar(
        sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                          label = "Search..."),
        sidebarMenu(
            menuItem("Home Page", tabName = "homepage", icon = icon("home")),
            menuItem("Summary of Data", tabName = "summary", icon = icon("chart-bar")),
            menuItem("Variable Correlation", tabName = "variable", icon = icon("chart-line")),
            menuItem("ANN Model", tabName = "annModel", icon = icon("project-diagram")),
            menuItem("Prediction", tabName = "prediction", icon = icon("cloudversify")),
            menuItem("Contact Me", tabName = "contact", icon = icon("grav"))
        )
        
        
    ),#end of dashboard sidebar
    
    dashboardBody(
        tabItems(
            # Home page
            tabItem(tabName = "homepage",
                   h2("Homepage"),
                   div(imageOutput("homepage"), style="text-align: center;"),
                   br(),
                   br(),
                   br(),
                   br(),
                   br(),
                   br(),
                   br(),
                   br(),
                   valueBox(subtitle="In the field of engineering, it is crucial to have accurate estimates of the performance of building materials. These estimates are required to develop safety guidelines governing the materials used in the construction of buildings, bridges, and roadways.
                               Estimating the strength of concrete is a challenge of interest. Although it is used in nearly every construction project, concrete performance varies greatly due to a wide variety of ingredients that interact in complex ways. As a result, it is difficult to accurately predict the strength of the final product. 
                               A model that could reliably predict concrete strength given a listing of the composition of the input materials could result in safer construction practices.
                               The concrete dataset contains 1,030 examples of concrete with eight features describing the components used in the mixture. These features are thought to be related to the final compressive strength and they include the amount (in kilograms per cubic meter) of cement, slag, ash, water, superplastic, coarse aggregate, and fine aggregate used in the product in addition to the aging time (measured in days).",
                            value=" Description", width=12, color = "navy" )
                    
            ),
            
            # Data Summary Tab
            tabItem(tabName = "summary",
                    h2("Raw Data"),
                    dataTableOutput("dataTable"),
                    
                    checkboxInput(inputId = "normdata", 
                                  label = "Normalize Datasets",
                                  value = FALSE),
                    
                    downloadButton("downloadCsv", "Download as CSV"),
                    br(),
                    br(),
                    
                    selectInput(inputId = "varconcrete",
                                label = "Choose a variable to display",
                                choices = c("Cement"       = 1,
                                            "Slag"         = 2,
                                            "Ash"          = 3,
                                            "Water"        = 4,
                                            "Superplastic" = 5,
                                            "CoarseAgg"    = 6,
                                            "FineAgg"      = 7,
                                            "Age"          = 8,
                                            "Strength"     = 9)),
                    h5(strong("Variable Summary")),
                    verbatimTextOutput("var_summary"),
                    plotOutput("boxplot")
            ),
            
            #--------------------------------------Variable Correlation tab-------------------------------------#
            tabItem(tabName = "variable",

                      h2("Variable Correlation"),
                      br(),
                      div(box(
                        #--------------------Checkbox-----------------------------#
                        radioButtons("var", 
                                     h4("Variables"), 
                                     choices = list("Cement" = "Cement", 
                                                    "Slag" = "Slag", 
                                                    "Ash" = "Ash",
                                                    "Water" = "Water",
                                                    "Superplastic" = "Superplastic",
                                                    "Coarseagg" = "Coarseagg",
                                                    "Fineagg" = "Fineagg",
                                                    "Age" = "Age"),
                                     selected = "Cement"
                        ),
                        
                        #----------------------Range of Data----------------------#
                        sliderInput(inputId = "dataRange",
                                    label = "Range of Data:",
                                    min = 50,
                                    max = 100,
                                    value = 80)
                      )#end of box
                      ),
                      
                        
                          div(plotOutput("distPlot"))


            ),
            
            #-------------------------------------------ANN Model tab------------------------------------------#
            tabItem(tabName = "annModel",
                    
                    h2("ANN Model"),
                    br(), 
                    
                    box(
                      title = "ANN Model with 1 Hidden Node", 
                      status = "info", 
                      solidHeader = TRUE,
                      collapsible = TRUE,
                      img(src = "ann_1_hidden.png", height = 460, width = 560)
                    ),
                    box(
                      title = "ANN Model with 5 Hidden Node", 
                      status = "success", 
                      solidHeader = TRUE,
                      collapsible = TRUE,
                      img(src = "ann_5_hidden.png", height = 460, width = 560)
                    ),
                    box(
                      title = "Scatter Plot for ANN Model with 1 Hidden Node", 
                      status = "info", 
                      solidHeader = TRUE,
                      collapsible = TRUE,
                      verbatimTextOutput("accuracy_1_hidden"), 
                      plotOutput("plot_1_hidden_model", 
                                 height = 450)
                    ),
                    box(
                      title = "Scatter Plot wfor ANN Model with 5 Hidden Node", 
                      status = "success", 
                      solidHeader = TRUE,
                      collapsible = TRUE,
                      verbatimTextOutput("accuracy_5_hidden"),
                      plotOutput("plot_5_hidden_model", 
                                 height = 450)
                    ),
                    boxPlus(
                      width = 12,
                      sliderInput(inputId = "bins",
                                  label = "Number of bins:",
                                  min = 0,
                                  max = 300,
                                  value = 50))
                    
            ),
            
            #-------------------------------------------Prediction tab-----------------------------------------#
            tabItem(tabName = "prediction",
                    h2("Prediction of Concrete Strength"),
                    numericInput("cement", "Cement(kg/m^3):", 10, min = 0, max = 1000),
                    numericInput("slag", "Slag (kg/m^3):", 10, min = 0, max = 500),
                    numericInput("ash", "Ash (kg/m^3):", 10, min = 0, max = 500),
                    numericInput("water", "Water (kg/m^3):", 10, min = 0, max = 500),
                    numericInput("superplastic", "Superplastic (kg/m^3):", 10, min = 0, max = 50),
                    numericInput("coarseagg", "Coarseagg (kg/m^3):", 10, min = 0, max = 2000),
                    numericInput("fineagg", "Fineagg (kg/m^3):", 10, min = 0, max = 1000),
                    numericInput("age", "Age (Days):", 10, min = 0, max = 500),
                    br(),
                    br(),
                    actionButton("do", "Predict"),
                    br(),
                    br(),
                    br(),
                    box(width= 12, 
                        title= "Output", 
                        status= "info", 
                        solidHeader= TRUE,
                        collapsible = TRUE,
                        
                        "The predicted strength is:",
                        textOutput("predicted_strength_input_result")
                    ),
                    
            ),
            
            #--------------------------------------------Contact tab-------------------------------------------#
            tabItem(tabName = "contact",
                    h2("Contact Me"),
                    widgetUserBox(
                      width = 12,
                      title = "Tan Li Tung",
                      subtitle = "Big Data Analytics Learner",
                      type = NULL,
                      src = "tan.jpg",
                      background = TRUE,
                      backgroundUrl = "https://i.pinimg.com/originals/4f/39/10/4f39103da156fb7e479abd6355932e88.jpg",
                      closable = FALSE,
                      "Hello there, I am Tan",
                      footer = h5("Facebook : Tan Li Tung")
                        
                    ),
                    br(),
                    br()
            )
            

        ),#end of tab items
        hr(),
        hr(),
        br(),
        br(),
        hr(),
        hr(),
        br(),
        br(),
        hr(),
        hr(),
        br(),
        br(),
        hr(),
        hr(),
        br(),
        br(),
        HTML('<footer class="page-footer font-small blue">
                                  <div class="footer-copyright text-center py-3"> ©2019 Copyright :
                                    <a href="https://www.linkedin.com/in/tan-li-tung-877168173?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BX7HeLRnlQtiR%2B9FquhXFOA%3D%3D"> Tan Li Tung</a>
                                  </div>
                                </footer>
                                ')
    )#end of dashboard body
)



















































#-------------------------------------------------------Server Function-----------------------------------------------#
server <- function(input, output, session) {
    #----------------------------------------------------Data Initialization-----------------------------------------------------#
    rawData <- read.csv("concrete.csv")
    normalizedData <- as.data.frame(lapply(concrete, normalized))
    #----------------------------------------------------------Home Page Tab-----------------------------------------------------#
    output$homepage <- renderImage({
      list(
      src = "www/homepage.jpg",
      filetype = "image/jpeg",
      alt = "Homepage Image",
      height = 500,
      width = 850
      )
    }, deleteFile = FALSE)#end of remder image
    
    #----------------------------------------------------Data Summarization Tab--------------------------------------------------#
    #download the raw data
    output$downloadCsv <- downloadHandler(
        filename = "concrete.csv",
        content = function(file) {
            write.csv(rawData, file)
        },
        contentType = "text/csv"
    )#end of download
    
    myCSV <- reactiveFileReader(100, session, 'concrete.csv', read.csv)#get data from concrete.csv
    
    #generate the data table
    output$dataTable <- renderDT(
        if(input$normdata == TRUE){
          dataset <- rounding(normalizedData)
        }
        else{
          dataset <- rawData
        },
        class = "display nowrap compact", # style
        filter = "top", # location of column filters
        options = list(  # options
        scrollX = TRUE # allow user to scroll wide tables horizontally
        )
    )#end of output$datatable
    
    #generate the variable summary(mean median etc)
    output$var_summary <- renderPrint({
      if(input$normdata == TRUE){
        dataset <- normalizedData
      }
      else{
        dataset <- rawData
      }
      summary(dataset[,as.numeric(input$varconcrete)])
    })#end of var_summary
    
    #boxplot
    output$boxplot <- renderPlot({
      if(input$normdata == TRUE){
        dataset <- normalizedData
      }
      else{
        dataset <- rawData
      }
      x <- summary(dataset[,as.numeric(input$varconcrete)])
      boxplot(x,col = "sky blue",border = "purple",main = names(dataset[as.numeric(input$varconcrete)]))
    })
    
    
    #----------------------------------------------------Variable Correlation Tab--------------------------------------------------#
    output$distPlot <- renderPlot({
        data <- read.csv("concrete.csv")
        
        if (input$var == "Cement"){
        x <- data$cement
        dataRange <- seq(min(x), max(x), length.out = input$dataRange + 1)
        
        hist(x, breaks = dataRange, col = "#75AADB", border = "white",
             xlab = "Index",
             main = "Histogram of Cement")
        }
        
        else if (input$var == "Slag"){
          x <- data$slag
          dataRange <- seq(min(x), max(x), length.out = input$dataRange + 1)
          
          hist(x, breaks = dataRange, col = "#75AADB", border = "white",
               xlab = "Index",
               main = "Histogram of Slag")
        }
        
        else if (input$var == "Ash"){
          x <- data$ash
          dataRange <- seq(min(x), max(x), length.out = input$dataRange + 1)
          
          hist(x, breaks = dataRange, col = "#75AADB", border = "white",
               xlab = "Index",
               main = "Histogram of Ash")
        }
        
        else if (input$var == "Water"){
          x <- data$water
          dataRange <- seq(min(x), max(x), length.out = input$dataRange + 1)
          
          hist(x, breaks = dataRange, col = "#75AADB", border = "white",
               xlab = "Index",
               main = "Histogram of Water")
        }
        
        else if (input$var == "Superplastic"){
          x <- data$superplastic
          dataRange <- seq(min(x), max(x), length.out = input$dataRange + 1)
          
          hist(x, breaks = dataRange, col = "#75AADB", border = "white",
               xlab = "Index",
               main = "Histogram of Superplastic")
        }
        
        else if (input$var == "Coarseagg"){
          x <- data$coarseagg
          dataRange <- seq(min(x), max(x), length.out = input$dataRange + 1)
          
          hist(x, breaks = dataRange, col = "#75AADB", border = "white",
               xlab = "Index",
               main = "Histogram of Coarseagg")
        }
        
        else if (input$var == "Fineagg"){
          x <- data$fineagg
          dataRange <- seq(min(x), max(x), length.out = input$dataRange + 1)
          
          hist(x, breaks = dataRange, col = "#75AADB", border = "white",
               xlab = "Index",
               main = "Histogram of Fineagg")
        }
        
        else if (input$var == "Age"){
          x <- data$age
          dataRange <- seq(min(x), max(x), length.out = input$dataRange + 1)
          
          hist(x, breaks = dataRange, col = "#75AADB", border = "white",
               xlab = "Index",
               main = "Histogram of Age")
        }
        
    })
    
    #--------------------------------------------------------ANN Model Tab--------------------------------------------------------#
    testData <- normalizedData[701:1030,]
    output$plot_1_hidden_model <- renderPlot({
      predicted_strength <- predsets(normalizedData, "model_1_hidden.rds")
      plot(predicted_strength, type = "o", col = "red", xlim = c(0,input$bins), ylim = c(0,1.0))
      lines(testData$strength, type = "o", col = "blue", xlim = c(0,input$bins))
    })
    
    output$plot_5_hidden_model <- renderPlot({
      predicted_strength <- predsets(normalizedData, "model_5_hidden.rds")
      plot(predicted_strength, type = "o", col = "red", xlim = c(0,input$bins), ylim = c(0,1.0))
      lines(testData$strength, type = "o", col = "blue", xlim = c(0,input$bins))
    })
    
    output$accuracy_1_hidden <- renderText({ 
      txtA <- getAccuracy(normalizedData, "model_1_hidden.rds")
      paste("Accuracy = ", round(txtA*100, digits = 2), "%")
    })
    
    output$accuracy_5_hidden <- renderText({ 
      txtB <- getAccuracy(normalizedData, "model_5_hidden.rds")
      paste("Accuracy = ", round(txtB*100, digits = 2), "%")
    })
    
    #--------------------------------------------------------Prediction Tab--------------------------------------------------------#
    observeEvent(input$do, {
      rawDT <- rawdatasets("concrete.csv")
      model1 <-readRDS("model_5_hidden.rds")
      a1 = input$ash 
      a2 = input$water
      a3 = input$cement
      a4 = input$slag
      a5 = input$superplastic
      a6 = input$coarseagg
      a7 = input$fineagg
      a8 = input$age
      
      newDT = data.frame(
        "cement" = input$cement,
        "slag" = input$slag, 
        "ash" = input$ash, 
        "water" = input$water,
        "superplastic" = input$superplastic,
        "coarseagg" = input$coarseagg,
        "fineagg" = input$fineagg,
        "age" = input$age,
        "strength"= 0
      )
      
      output$predicted_strength_input_result <- renderText({
        a <- predbyInput(rawDT, model1, newDT)
        aNew <- a * (82.6 - 2.33) + 2.33
        paste("The Strength is : ", a, "(normalized) --> ", aNew, "(denormalized)")
      })
    })#end of observeEvent

}#end of server

shinyApp(ui, server)