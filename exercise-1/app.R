# load the "shiny" library
library("shiny")

# Define a new `ui` variable. This variable should be assigned a `fluidPage` layout
my.ui <-  fluidPage (
  # Include a `titlePanel` layout with the text "Cost Calculator"
  titlePanel("Cost Calculator"),
  numericInput('price',label = "Price (in dollars)", value = 0, min = 0),
  numericInput('quantity', label = "Quantity",value = 1, min = 1),
  strong ("cost"),
  textOutput("cost")
)



  # Include a `numericInput()` widget with the label "Price (in dollars)"
  # It should have a default value of 0 and a minimum value of 0
  # Hint: look up the function in the documentation!


  # Include a `numericInput()` widget with the label "Quantity"
  # It should have a default value of 1 and a minimum value of 1


  # Include the word "Cost" strongly bolded


  # Include a `textOutput()` output of the calculated `cost`
 


# Define a `server` function (with appropriate arguments)
server <- function(input, output) {
  # Assign a reactive `renderText()` function to the outputted `cost`
  output$cost <- renderText({
    # The reactive expression should return the inputed `price` times the `quantity`
    cost <- input$price * input$quantity
    paste <- paste0("$", cost)
    return(paste)
  })
}

  
  # So it looks nice, paste a "$" in front of it!




# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = my.ui, server =  server)
