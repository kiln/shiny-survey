library(shiny)

htmlTemplate("template.html", 
  slider = sliderInput("n_bins", "Number of bins:", min=1, max=100, value=10, ticks = FALSE),
  plot = plotOutput("thePlot")
)