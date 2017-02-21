# load the "shiny" library as well as any other libraries you will need
library(shiny)
library(ggplot2)
library(dplyr)

# load the `msleep` data set and store it in `animal.sleep`
# do a google search to find function that can keep only rows that don't
# have any values missing
animal.sleep <- msleep[complete.cases(msleep),]

# View it to learn more about it
View(animal.sleep)

# Define a new `ui` variable. This variable should be assigned a `fluidPage` layout
ui <- fluidPage(
  
  #Include a `titlepanel` of "Mammals and thier Sleep" 
  titlePanel("Mammals and thier Sleep"),
  
  # Include a paragraph introducing the data
  p("This is a data set focused on mammals and thier sleeping habits. It will look at REM and 
    sleep duration."),
  
  # Select a panel. In that panel have `selectInput` that will allow someone
  # to go through the diffrent types of of choices such as `vore`, `order`, `conservation`
  # Add another way to interact with the data
  # Add a `submitButton` so all changes occur together
  # What are benefits of using the submit button vs not?
  inputPanel(
    selectInput('facet.by', label="Type of Vore", choices=c('order', 'vore','conservation')),
    submitButton(text = "Apply Changes", icon = NULL, width = NULL)
  ),
  
  # Create a main panel where the `plot` will go
  mainPanel(
    plotOutput('plot'),
    verbatimTextOutput("text")
  ),
  
  # include a concluding paragraph about the data after making the plot. What are
  # some trends in the data you notice? Be aware that you filtered the data set!
  p("Herbivores get the least sleep and the least amount of REM sleep. This could be due to 
    the constant need to be vigilant. However my data is filtered, so more complete data points 
    would be needed to draw a stronger conclusion.")
)

# Define a server function for the app
server <- function(input, output) {

  
  # assign a `renderPlot` to `output$plot`
  output$plot <- renderPlot({
    
    # The filtered data set should then be used in a ggplot2 scatter plot with the
    # sleep_total on the x-axis, the sleep_rem on the y-axis, and color based on the vore
    # You should specify facets based on what feature the user selected to "facet by"
    #   (hint: you can just pass that string to the `facet_wrap()` function!)
    print(input$radio)
    
    p <- ggplot(data = animal.sleep, mapping = aes(x = sleep_total, y = sleep_rem, color = vore)) +
      geom_point() + facet_wrap(input$facet.by)
    
    return(p)
  })
 
}

# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = ui, server = server)

#Bonus: use the whole msleep data set and see what conclusions you can draw. Do they
# support your original conclusions? 

# Bonus bonus: add a radio button to in shiny that will add another layer of interaction