library("shiny")
source("lib/generateData.R")

data = generateData()


shinyServer(function(input, output, session) {
	session$sendCustomMessage("init", data)
	observe({
	  session$sendCustomMessage("update", input$n_bins)
	})
})