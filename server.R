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

# TK on server sending messages to template.html
shinyServer(function(input, output, session) {
	session$sendCustomMessage("init", list(data = convertToJSON(data), shape = "circle"))
	observe({
	  session$sendCustomMessage("updateData", convertToJSON(filterOnYear(input$year)))
	})
	observe({
	  session$sendCustomMessage("updateShape", input$shape)
	})
})
