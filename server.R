library(magrittr)
library(dplyr)
library(shiny)
library(jsonlite)

data = nycflights13::planes %>% 
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

filterOnYear = function(y) {
  if(y == "All"){
    return(data)
  } 
  return(filter(data, Year == y))
}

convertToJSON = function(d) {
  toJSON(d, dataframe = "rows")
}

shinyServer(function(input, output, session) {
	session$sendCustomMessage("init", convertToJSON(data))
	observe({
	  session$sendCustomMessage("update", convertToJSON(filterOnYear(input$year)))
	})
})
