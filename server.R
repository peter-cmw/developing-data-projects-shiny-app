library(shiny)
library(caret)
library(ggplot2)
library(RWeka)
shinyServer(function(input, output) {
  
  model1 <- reactive({
      mdl <- train(Species ~ Petal.Length+Petal.Width, data=iris, method=input$model)
      mdl$MdlName = input$model
      mdl
  })
  
  
  model1pred <- reactive({
         predict(model1(), newdata = data.frame(Petal.Width = input$pwidth, Petal.Length = input$plength))
  })
  
  
  output$plot1 <- renderPlot({
    ggplot(iris, aes(x=Petal.Length, y=Petal.Width, colour=Species)) + 
          geom_point(size=2) + 
          geom_point(aes(x=input$plength, y=input$pwidth, colour=model1pred()), size=6, pch=8)
  })
  
  output$pred1 <- renderText({
      as.character(model1pred())
  })
  
})