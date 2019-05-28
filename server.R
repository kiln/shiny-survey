# Import packages, including shiny
library(magrittr)
library(dplyr)
library(shiny)
library(jsonlite)

# Create new dataframe using nycflights R package
data <- nycflights13::planes %>%
  select(
    Tailnum = tailnum,
    Year = year,
    Type = type,
    Manufacturer = manufacturer,
    Model = model,
    Engines = engines,
    Engine = engine,
    Seats = seats,
    -speed
    )

# Function to filter and return rows based on year input
filterOnYear <- function(y) {
  if(y == "All"){
    return(data)
  }
  return(filter(data, Year == y))
}

# Function which converts data dataframe to json object so it can be sent to Flourish API
convertToJSON <- function(d) {
  toJSON(d, dataframe = "rows")
}

# Initialise shiny server instance
shinyServer(function(input, output, session) {
  # Send a message to web page, with data and shape properties, as soon as session begins
	session$sendCustomMessage("init", list(data = convertToJSON(data), shape = "circle"))
	observe({
    # Send a message to web page with new data when filter value is changed
	  session$sendCustomMessage("updateData", convertToJSON(filterOnYear(input$year)))
	})
	observe({
    # Send a message to web page with new shape when shape value is changed
	  session$sendCustomMessage("updateShape", input$shape)
	})
})
