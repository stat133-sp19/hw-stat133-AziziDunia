library(shiny)
library(reshape2)
library(ggplot2)

ui <- fluidPage(
  
  
  titlePanel("Savning/Investing Scenarios"),
  fluidRow(
    column(4,
           sliderInput("initial",
                       "Initial Amount",
                       min = 0,
                       max = 100000,
                       step = 500,
                       value = 1000,
                       pre = "$"), 
           sliderInput("annual",
                       "Annual Contribution",
                       min = 0,
                       max = 50000,
                       step = 500,
                       value = 2000,
                       pre = "$")
    ),
    column(4, 
           sliderInput("return",
                       "Return Rate (in %)",
                       min = 0,
                       max = 20,
                       step = 0.1,
                       value = 5),
           sliderInput("growth",
                       "Grwoth Rate (in %)",
                       min = 0,
                       max = 20,
                       step = 0.1,
                       value = 2)
    ),
    column(4,
           sliderInput("years",
                       "Years",
                       min = 0,
                       max = 50,
                       step = 1,
                       value = 20),
           selectInput("facet",
                       "Facet?",
                       choices = c("No", "Yes")))
  ),
  h4("Timelines"),
  plotOutput("Plot"),
  h4("Balances"),
  verbatimTextOutput(outputId = "balances")
  
)
future_value <- function(amount, rate, years){
  FV = amount*(1 + rate)^years
  return(FV)
}
annuity <- function(contrib, rate, years){
  FVA = contrib*(((1 + rate)^years - 1)/ rate)
  return(FVA)
}
growing_annuity <- function(contrib, rate, growth, years){
  FVGA = contrib*(((1+rate)^years - (1+growth)^years)/ (rate-growth))
  return(FVGA)
}

server <- function(input,output){
  table <- reactive({
    amount = input$initial
    years = input$years
    rate = input$return / 100
    growth = input$growth / 100
    contribution = input$annual
    table <- data.frame(year = 0:years, no_contrib = rep(amount, years+1), fixed_contrib = rep(amount, years+1), growing_contrib = rep(amount, years+1))
    
    for (year in 0:input$years){
      no_contrib= future_value(amount, rate, year) 
      table$no_contrib[year+1] = no_contrib
      
      fixed_contrib=annuity(contribution, rate, year) 
      table$fixed_contrib[year+1] = fixed_contrib + no_contrib
      
      growing_contrib=growing_annuity(contribution, rate, growth, year)
      table$growing_contrib[year+1] = growing_contrib + no_contrib
    }
    table
  })
  
  output$Plot <- renderPlot({
    melt_table <- melt(table(), id.vars = "year")
    
    if (input$facet == "No"){
      ggplot(melt_table, aes(x = year, y = value )) +
        geom_line(aes(color = variable)) +
        geom_point(aes(color = variable)) +
        ggtitle("Three modes of investing")
    }
    else if (input$facet == "Yes"){
      ggplot(melt_table, aes(x = year, y = value)) +
        geom_line(aes(color = variable)) +
        geom_point(aes(color = variable)) +
        facet_wrap(~ variable) +
        geom_area(aes(fill = variable), alpha = 0.4) +
        theme_light() +
        ggtitle("Three modes of investing")

    }
  })
  output$balances <- renderPrint({
    table()
  })
}

shinyApp(ui = ui, server = server)