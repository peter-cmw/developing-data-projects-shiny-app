library(shiny)
shinyUI(fluidPage(
  titlePanel(
      h1("Predict Species from Petal.Width and Petal.Length using different Models")),
      
  sidebarLayout(
    sidebarPanel(
      p("Choose model from dropdown and select petal width and length to predict spiece on"),
      p("Please give server some time to train model before results will show up"),
      selectInput("model", "Model:",
                    c("Random Forest (rf)" = "rf",
                      "Logistic Model Trees" = "LMT",
                      "CART" = "rpart")),
      sliderInput("pwidth", "What is the petal width?", min(iris$Petal.Width), max(iris$Petal.Width), value = mean(iris$Petal.Width)),
      sliderInput("plength", "What is the petal length?", min(iris$Petal.Length), max(iris$Petal.Length), value = mean(iris$Petal.Length))
    ),
    mainPanel(
      plotOutput("plot1"),
      h4("Predicted Species from selected Model:"),
      textOutput("pred1")
    )
  )
))