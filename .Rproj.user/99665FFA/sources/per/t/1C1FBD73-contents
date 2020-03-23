#install.packages("shinydashboard")
library(shinydashboard)
library(shinydashboardPlus)
library(DT)
library(shinythemes)
library(neuralnet)
read.csv("concrete.csv")
source("ann_scripts.R")

#Homepage UI code here
homepageUI <- (
  
  fluidPage(
    column (12,
            infoBox(title = '' , "Calendar 2019",date()                   ,icon = icon("calendar" )),
            infoBox(title = '' , "Artificial Intelligence","TDB3093"      ,icon = icon("fingerprint")),
            infoBox(title = '' , "Neural Network " , "From the Ground-Up" ,icon = icon("atom"))),
    
    HTML('<iframe width="1060" height="450" src="https://www.youtube.com/embed/rEDzUT3ymw4?" 
                  frameborder="1"
                  allow="accelerometer; 
                  encrypted-media; 
                  gyroscope; 
                  picture-in-picture" allowfullscreen></iframe>'),
    br(),
    br(),
    fluidRow(
      box(width=12, 
          title= "Artificial Intelligence l The Connector", 
          status= "info", 
          solidHeader= TRUE,
          
          valueBox(subtitle="In the field of engineering, it is crucial to have accurate estimates of the performance of building materials. These estimates are required to develop safety guidelines governing the materials used in the construction of buildings, bridges, and roadways.
                               Estimating the strength of concrete is a challenge of interest. Although it is used in nearly every construction project, concrete performance varies greatly due to a wide variety of ingredients that interact in complex ways. As a result, it is difficult to accurately predict the strength of the final product. 
                               A model that could reliably predict concrete strength given a listing of the composition of the input materials could result in safer construction practices.
                               The concrete dataset contains 1,030 examples of concrete with eight features describing the components used in the mixture. These features are thought to be related to the final compressive strength and they include the amount (in kilograms per cubic meter) of cement, slag, ash, water, superplasticizer, coarse aggregate, and fine aggregate used in the product in addition to the aging time (measured in days).",
                   value=" Description", width=12, color = "navy" ),
          
          valueBox(subtitle="Neural networks are a set of algorithms, modeled loosely after the human brain, that are designed to recognize patterns. They interpret sensory data through a kind of machine perception, labeling or clustering raw input. 
                               The patterns they recognize are numerical, contained in vectors, into which all real-world data, be it images, sound, text or time series, must be translated. Neural networks help us cluster and classify. You can think of them as a clustering and classification layer on top of the data you store and manage. 
                               They help to group unlabeled data according to similarities among the example inputs, and they classify data when they have a labeled dataset to train on. (Neural networks can also extract features that are fed to other algorithms for clustering and classification; so you can think of deep neural networks as components of larger machine-learning applications involving algorithms for reinforcement learning, classification and regression.)",
                   value="Neural Network", width=6, color = "navy" ),
          
          valueBox(subtitle="Our team consist of 9 students. There are three web designer, four front-end developer and two back-end developer. For web designer, they design the layout, feature and look for the website. The task involves understanding for both graphic design and computer programming. They work with development teams or managers for keeping the site up-to-date and prioritizing needs, among other tasks. 
                               As front-end web developer, they are responsible for implementing visual elements that users see and interact with in a web application. The front-end people will write codes for the visual layout and look that was created by the web designer team. Sustain the look of the website and fix if there are error during running the app. For the back-end web developer team, they are responsible for managing the interchange of data between the server and the users. 
                               Their primary focus will be development of all server-side logic, definition and maintenance of the central database, and ensuring high performance and responsiveness to requests from the front-end.",
                   value="About Us", width=6, color = "navy" )
      )
    )
  )
)  
#-------------------------------------------------------------------------------------------

#Data Summarization UI code here
datasummUI <- (
  ui <- fluidPage(
    
    column(12,
           h2("Data Summarization", align="center" ),
           hr(),
           dataTableOutput("dataTable"),
           
           checkboxInput(inputId = "normdata", 
                         label = "Normalize Datasets",
                         value = FALSE)),
    column(12,
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
           
           verbatimTextOutput("summary"),
           plotOutput("boxplot"),
           
           br(),
           downloadButton("downloadCsv", "Download as CSV")
    )
  )
)
#-------------------------------------------------------------------------------------------

#Variable Correlation UI code here
variableUI <- (
  
  ui <- fluidPage(
    # Show a plot of the generated distribution
    h2("Variable Correlation", align="center" ),
    hr(),
    
    fluidRow(
      
      column(4,
             sliderInput("index",
                         "Index",
                         min = 1,
                         max = 1030,
                         value = 30),
             
             #sliderInput("mean", "Mean", min = 0 , max = 500, value = 1),
             radioButtons("rbVar", label = "Select Variable to Compare with Strength",
                          choices = list("Cement"       = 1,
                                         "Slag"         = 2,
                                         "Ash"          = 3,
                                         "Water"        = 4,
                                         "Superplastic" = 5,
                                         "CoarseAgg"    = 6,
                                         "FineAgg"      = 7,
                                         "Age"          = 8,
                                         "Strength"     = 9), 
                          selected = 1)),
      
      column(8,
             plotOutput("distPlot")
      )
    )
  )
)
#-------------------------------------------------------------------------------------------
#ANN UI code here
annUI <- (
  fluidPage(column(12, 
                   
                   h2("ANN Model", align="center" ),
                   br(), 
                   
                   box(
                     title = "ANN Model", 
                     status = "info", 
                     solidHeader = TRUE,
                     collapsible = TRUE,
                     img(src = "ImgMod.png", height = 460, width = 460)
                   ),
                   box(
                     title = "ANN Model with Hidden Layer", 
                     status = "success", 
                     solidHeader = TRUE,
                     collapsible = TRUE,
                     img(src = "ImgModHid.png", height = 460, width = 460)
                   ),
                   box(
                     title = "Scatter Plot", 
                     status = "info", 
                     solidHeader = TRUE,
                     collapsible = TRUE,
                     verbatimTextOutput("accMod"), 
                     plotOutput("plotMod", 
                                height = 450)
                   ),
                   box(
                     title = "Scatter Plot with Hidden Layer", 
                     status = "success", 
                     solidHeader = TRUE,
                     collapsible = TRUE,
                     verbatimTextOutput("accModHid"),
                     plotOutput("plotModHid", 
                                height = 450)
                   ),
                   boxPlus(
                     width = 12,
                     sliderInput(inputId = "bins",
                                 label = "Number of bins:",
                                 min = 0,
                                 max = 300,
                                 value = 50))
  )
  )
)
#-------------------------------------------------------------------------------------------
#Prediction UI code here
predictUI <- (
  
  ui <- (
    fluidPage(
      fluidRow(
        
        h2("Prediction ", align="center" ),
        hr(), 
        
        column(width= 12, 
               box(width= 12, 
                   title= "Output", 
                   status= "info", 
                   solidHeader= TRUE,
                   collapsible = TRUE,
                   
                   "This is the output :",
                   textOutput("predicted_strength_input_result")
               )
        )
      ),
      
      fluidRow(  #row in fluidrow has a width of 12
        column(width= 6,       
               box(width= NULL, 
                   title= "Inputs", 
                   status= "info", 
                   solidHeader= TRUE,
                   "Components in mixtures: ", br(), br(),
                   
                   #Input: Simple integer interval 
                   
                   sliderInput("ash", "Ash (kg/m^3): "      , 0, 200, 1),
                   sliderInput("water", "Water (kg/m^3): "  , 127, 247, 128),
                   sliderInput("cement", "Cement (kg/m^3): ", 132, 540, 133),
                   sliderInput("slag", "Slag (kg/m^3): "    , 0, 260, 1)
                   
                   #textInput("text", "Text input:")
               )
        ),
        
        column(width= 6, 
               box(width= NULL, 
                   title= "Inputs", 
                   status= "info", 
                   solidHeader= TRUE,
                   "Components in mixtures: ", br(), br(),
                   
                   sliderInput("superplastic", "Superplastic (kg/m^3): ", 0, 22, 1),
                   sliderInput("coarseagg", "Coarseagg (kg/m^3): "              , 801, 1125, 802),
                   sliderInput("fineagg", "Fineagg (kg/m^3): "                  , 612, 896, 613),
                   sliderInput("age", "Age (days): "                            , 1, 365, 2)
               )
        )
      ),
      
      actionButton("do", "Predict")
    )
  )
)    
#-------------------------------------------------------------------------------------------
#Our Team UI code here
ourteamUI <- (
  fluidPage(
    column (12,
            
            h2("MEET OUR TEAM", align="center" ),
            hr(),
            
            widgetUserBox(
              width = 6,
              title = "Noor Aishah",
              subtitle = "Web Designer",
              type = NULL,
              src = "https://media.licdn.com/dms/image/C5103AQG-M0tATb1Nrg/profile-displayphoto-shrink_800_800/0?e=1568851200&v=beta&t=VNN5LvL2bnRZzCPCT1vtEXRO1fSbSLdKS1aJh8pX03c",
              background = TRUE,
              backgroundUrl = "https://i.pinimg.com/originals/4f/39/10/4f39103da156fb7e479abd6355932e88.jpg",
              closable = TRUE,
              "Hello there, Im Ecah ",
              footer = "I don't just sell web applications, I create web application that SELL"
            ),
            
            widgetUserBox(
              width = 6,
              title = "Srikanth Nagendran",
              subtitle = "Web Designer",
              type = NULL,
              src = "https://media.licdn.com/dms/image/C5103AQED52T4Tv0dzw/profile-displayphoto-shrink_800_800/0?e=1568851200&v=beta&t=U3QTT9yeQeum_1Ulx-ILkyaUrZL2qC_6wcEtW92_16E",
              background = TRUE,
              backgroundUrl = "https://i.pinimg.com/originals/4f/39/10/4f39103da156fb7e479abd6355932e88.jpg",
              closable = TRUE,
              "Hello there, I am Srikanth",
              footer = "I am a true risk taker, makes me a true entrepreneur"
            ),
            
            widgetUserBox(
              width = 6,
              title = "Johnathan Jaganathan",
              subtitle = "Web Designer",
              type = NULL,
              src = "https://media.licdn.com/dms/image/C5103AQFYwwytO5QGlw/profile-displayphoto-shrink_800_800/0?e=1568851200&v=beta&t=HaO4-Yg3A464sXx1u8mGAAjoX7v8JaYYBLK4TCupgrM",
              background = TRUE,
              backgroundUrl = "https://i.pinimg.com/originals/4f/39/10/4f39103da156fb7e479abd6355932e88.jpg",
              closable = TRUE,
              "Hello there, I am Johnanthan",
              footer = "Web application without visitors is like a ship lost in the horizon"
            ),
            
            widgetUserBox(
              width = 6,
              title = "Khairul Rizma",
              subtitle = "Front-End Developer",
              type = NULL,
              src = "https://media.licdn.com/dms/image/C5103AQF9Ge_kciHwmw/profile-displayphoto-shrink_200_200/0?e=1568851200&v=beta&t=x1Mwp4U7GljBnV7Whb-IJkjtKNabHrhCNenH9w4AOIo",
              background = TRUE,
              backgroundUrl = "https://i.pinimg.com/originals/4f/39/10/4f39103da156fb7e479abd6355932e88.jpg",
              closable = TRUE,
              "Hello there, I am Khairul",
              footer = "I wear a pirate hat because i am a Front-End Developer"
            ),
            
            widgetUserBox(
              width=6,
              title = "Nurfaraheen Zaini",
              subtitle = "Front-End Developer",
              type = NULL,
              src = "https://media.licdn.com/dms/image/C5103AQFT9qReAdqz_w/profile-displayphoto-shrink_800_800/0?e=1569456000&v=beta&t=VWY02lYE1JP80RTLQsFn76wZFstZUIMxz4YILDJ7oRc",
              background = TRUE,
              backgroundUrl = "https://i.pinimg.com/originals/4f/39/10/4f39103da156fb7e479abd6355932e88.jpg",
              closable = TRUE,
              "Hello there, I am Faraheen",
              footer = "Talk is cheap, I will show you my web design"
            ),
            
            widgetUserBox(
              width = 6,
              title = "Tan Li Tung",
              subtitle = "Front-End Developer",
              type = NULL,
              src = "https://media.licdn.com/dms/image/C5103AQHDwmn_y7AcCQ/profile-displayphoto-shrink_800_800/0?e=1568851200&v=beta&t=EibLx0VOWTPDJr6h9myOd29fIH4gnwiTYC-bXVxMKHY",
              background = TRUE,
              backgroundUrl = "https://i.pinimg.com/originals/4f/39/10/4f39103da156fb7e479abd6355932e88.jpg",
              closable = TRUE,
              "Hello there, I am Tan",
              footer = "My brain has too many tabs open"
            ),
            
            widgetUserBox(
              width = 6,
              title = "Nur Atiqah",
              subtitle = "Back-End Developer",
              type = NULL,
              src = "https://media.licdn.com/dms/image/C5103AQFPMlutWRguQQ/profile-displayphoto-shrink_800_800/0?e=1568851200&v=beta&t=G5xzBZB3l_sZsQYsVVKvI4hQo90WNkhyIxzqRwCx1-g",
              background = TRUE,
              backgroundUrl = "https://i.pinimg.com/originals/4f/39/10/4f39103da156fb7e479abd6355932e88.jpg",
              closable = TRUE,
              "Hello there, I am Atiqah",
              footer = "First, solve the problem. Then, write the code."
            ),
            
            widgetUserBox(
              width = 6,
              title = "Haziq Danial",
              subtitle = "Back-End Developer",
              type = NULL,
              src = "https://0.academia-photos.com/82223255/20208772/19935988/s200_haziq.danial.jpg",
              background = TRUE,
              backgroundUrl = "https://i.pinimg.com/originals/4f/39/10/4f39103da156fb7e479abd6355932e88.jpg",
              closable = TRUE,
              "Hello there, I am Haziq",
              footer = "Experience is the name everyone gives to their mistakes."
            ),
            
            widgetUserBox(
              width = 6,
              title = "Danieal Hazziq",
              subtitle = "Back-End Developer",
              type = NULL,
              src = "https://media.licdn.com/dms/image/C5103AQFsrTKX7MnNwQ/profile-displayphoto-shrink_800_800/0?e=1568851200&v=beta&t=b3RR8TAI9OwKLAl_yl7PFza1phGE46SRYIOwpFEQw38",
              background = TRUE,
              backgroundUrl = "https://i.pinimg.com/originals/4f/39/10/4f39103da156fb7e479abd6355932e88.jpg",
              closable = TRUE,
              "Hello there, I am Danieal",
              footer = "Fix the cause, not the symptom."
            ),
            
            widgetUserBox(
              width = 6,
              title = "Sir Said Jadid",
              subtitle = "Our Beloved Lecturer",
              type = NULL,
              src = "https://i1.rgstatic.net/ii/profile.image/775657541877761-1561942577620_Q512/Said_Jadid_Abdulkadir.jpg",
              background = TRUE,
              backgroundUrl = "https://i.pinimg.com/originals/4f/39/10/4f39103da156fb7e479abd6355932e88.jpg",
              closable = TRUE,
              "",
              footer = "Artificial Intelligence"
            )
    )
  )
)
fluidRow()

##############################################################################
ui <- dashboardPage(
  dashboardHeader(title = "Concrete Strength", 
                  disable = FALSE, 
                  titleWidth = 255,
                  
                  #dropdown Menu1 
                  dropdownMenu(type = "messages",
                               messageItem(
                                 from = "Khairul Rizma",
                                 message = "Doing the Scatter Plot n ANN Model."
                               ),
                               messageItem(
                                 from = "Haziq",
                                 message = "How the progress ?",
                                 icon = icon("question"),
                                 time = "13:45"
                               )
                               ),
                  #dropdown Menu 2
                  dropdownMenu(type = "notifications",
                               notificationItem(
                                 text = "5 new users today",
                                 icon("users")
                               ),
                               notificationItem(
                                 text = "Server load at 99%",
                                 icon = icon("exclamation-triangle"),
                                 status = "warning"
                               )
                  ),
                  #dropdown Menu 3
                  dropdownMenu(type = "tasks", badgeStatus = "success",
                               taskItem(value = 100, color = "green",
                                        "Histogram"
                               ),
                               taskItem(value = 100, color = "aqua",
                                        "Analysis"
                               ),
                               taskItem(value = 100, color = "yellow",
                                        "ANN Model & Scatter Plot"
                               ),
                               taskItem(value = 100, color = "red",
                                        "Prediction"
                               )
                  )
  ),
  
  dashboardSidebar(
    sidebarMenu(style = "position:fixed ; overflow: visible",
                menuItem("Homepage"            , tabName = "homepage"   , icon = icon("home")),
                menuItem("Data Summarization"  , tabName = "datasumm"   , icon = icon("bar-chart")),
                menuItem("Variable Correlation", tabName = "variable"   , icon = icon("chart-line")),
                menuItem("ANN Model"           , tabName = "ann"        , icon = icon("atom"), startExpanded = TRUE,
                         menuSubItem("ANN Model & Scatter Plot"    , tabName = "ann")),
                menuItem("Prediction"          , tabName = "prediction" , icon = icon("list-alt")),
                menuItem("Our Team"            , tabName = "ourteam"    , icon = icon("grav"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(
        tabName = "homepage",
        homepageUI
      ),
      tabItem(
        tabName = "datasumm",
        datasummUI
      ),
      tabItem(
        tabName = "variable",
        variableUI
      ),
      tabItem(
        tabName = "ann",
        annUI
      ),
      tabItem(
        tabName = "prediction",
        predictUI
      ),
      tabItem(
        tabName = "ourteam",
        ourteamUI
      )
    ),
    #Footer
    hr(),
    hr(),
    HTML('<footer class="page-footer font-small blue">
                                  <div class="footer-copyright text-center py-3"> ©2019 Copyright :
                                    <a href="https://searchenterpriseai.techtarget.com/definition/AI-Artificial-Intelligence"> Artificial Intelligence</a>
                                  </div>
                                </footer>
                                ')
  )
)


server <- function(input, output, session) {
  
  #------------------Download CSV----------------  
  output$downloadCsv <- downloadHandler(
    filename = "concrete.csv",
    content = function(file) {
      write.csv(concrete, file)
    },
    contentType = "text/csv")
  #------------------End Download CSV------------  
  
  
  
  #------------------Normalize Data--------------  
  output$summary <- renderPrint({
    dataset <- datasetInput()
    if(input$normdata == TRUE){
      dataset <- normDT
    }
    else{
      dataset <- rawDT
    }
    summary(dataset[,as.numeric(input$varconcrete)])
    
  })
  
  output$boxplot <- renderPlot({
    dataset <- datasetInput()
    if(input$normdata == TRUE){
      dataset <- normDT
    }
    else{
      dataset <- rawDT
    }
    x <- summary(dataset[,as.numeric(input$varconcrete)])
    boxplot(x,col="sky blue",border="purple",main=names(dataset[as.numeric(input$varconcrete)]))
  })
  
  normDT <- normdatasets("concrete.csv")
  output$distPlot <- renderPlot({
    x <- normDT
    a <- input$rbVar
    
    dens <-density(x[,as.numeric(input$rbVar)])
    if (input$rbVar == 1){
      hist(x[,as.numeric(input$rbVar)], freq=FALSE, main="Density plot")
      lines(x$strength, freq = FALSE, col="red",lwd=4)
    }
    else if (input$rbVar == 2){
      hist(x$age, freq =FALSE, prob = T, breaks = 30)
      lines(density(x$strength))
    }
  })
  
  myCSV <- reactiveFileReader(100, session, 'concrete.csv', read.csv)#get data from concrete.csv
  
  #normDT <- round(normdatasets("concrete.csv"),2)
  rawDT <- rawdatasets("concrete.csv")
  normDisp <- normdataDisp("concrete.csv")
  datasetInput <- reactive({
    switch(input$normdata,
           "TRUE" = normDT,
           "FALSE" = rawDT)
  })
  
  output$dataTable <- renderDT(
    if(input$normdata == TRUE){
      dataset <- normDisp
    }
    else{
      dataset <- rawDT
    },
    #myCSV(), # reactive data
    class = "display nowrap compact", # style
    filter = "top", # location of column filters
    options = list(  # options
      scrollX = TRUE # allow user to scroll wide tables horizontally
    )
  )#end of output$datatable
  #------------------End Normalize Data-------------- 
  
  
  
  #------------------ANN Model-----------------------
  normDT <- normdatasets("concrete.csv")
  testDT <- testdata(normDT)
  output$plotMod <- renderPlot({
    predicted_strength <- predsets(normDT, "modelxHid.rds")
    plot(predicted_strength, type = "o", col = "red", xlim = c(0,input$bins), ylim = c(0,1.0))
    lines(testDT$strength, type = "o", col = "blue", xlim = c(0,input$bins))
  })
  
  output$plotModHid <- renderPlot({
    predicted_strength <- predsets(normDT, "modelhidLay.rds")
    plot(predicted_strength, type = "o", col = "red", xlim = c(0,input$bins), ylim = c(0,1.0))
    lines(testDT$strength, type = "o", col = "blue", xlim = c(0,input$bins))
  })
  
  output$accMod <- renderText({ 
    txtA <- getAccuracy(normDT, "modelxHid.rds")
    paste("Accuracy = ", round(txtA*100, digits = 2), "%")
  })
  
  output$accModHid <- renderText({ 
    txtB <- getAccuracy(normDT, "modelhidLay.rds")
    paste("Accuracy = ", round(txtB*100, digits = 2), "%")
  })
  
  #------------------ANN Model-----------------------
  
  
  
  #------------------Var Correlation-----------------  
  
  output$distPlot <- renderPlot({
    x <- read.csv("concrete.csv")
    
    
    if (input$rbVar == 1) {
      
      hist(x$cement ,probability = T, breaks = input$index)
      lines(density(x$cement))
      
    }
    else if (input$rbVar == 2) {
      
      hist(x$slag ,  probability = T , breaks = input$index)
      lines(density(x$slag))
    }
    else if (input$rbVar == 3) {
      
      hist(x$ash ,  probability = T , breaks = input$index)
      lines(density(x$ash))
    }
    else if (input$rbVar == 4) {
      
      hist(x$water ,  prob = T , breaks = input$index)
      lines(density(x$water))
    }
    else if (input$rbVar == 5) {
      
      hist(x$superplastic,  prob = T  , breaks = input$index)
      lines(density(x$superplastic))
    }
    else if (input$rbVar == 6) {
      
      hist(x$coarseagg ,  prob = T , breaks = input$index)
      lines(density(x$coarseagg))
    }
    else if (input$rbVar == 7) {
      
      hist(x$fineagg ,  prob = T , breaks = input$index)
      lines(density(x$fineagg))
    }
    else if (input$rbVar == 8) {
      
      hist(x$age ,  prob = T , breaks = input$index)
      lines(density(x$age))
    }
    else if (input$rbVar == 9) {
      
      hist(x$strength ,  prob = T , breaks = input$index)
      lines(density(x$strength))
    }
  }
  )
  
  #------------------End Var Correlation--------------
  
  
  
  #------------------Prediction-----------------------
  sliderValues <- reactive ({
    rawDT <- rawdatasets("concrete.csv")
    data.frame(
      Name = c("Ash",
               "Water",
               "Cement",
               "Slag",
               "Superplastic",
               "Coarseagg",
               "Fineagg",
               "Age"
      ),
      
      Value = as.character(c(input$ash,
                             input$water,
                             input$cement,
                             input$slag,
                             input$superplastic,
                             input$coarseagg,
                             input$fineagg,
                             input$age)),
      
      stringsAsFactors = FALSE
    )
  })
  observeEvent(input$do, {
    rawDT <- rawdatasets("concrete.csv")
    model1 <-readRDS("modelhidLay.rds")
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
      paste("The Strength is : ", a, "(normalized) >>> ", aNew, "(denormalized)")
    })
  })
}
 
  #------------------End Prediction------------------


# Run the application 
shinyApp(ui = ui, server = server)