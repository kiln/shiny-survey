# shiny-survey
This is an initial example and exploration of how you can connect the Flourish API together with other data analysis and visualisation tools.

## What you need
* A working knowledge of both Javascript and R
* A Flourish account (quickly sign up [here](https://app.flourish.studio/register) if you don't have one)
* Flourish API keys
* RStudio or some other IDE that can run a [Shiny app](https://shiny.rstudio.com/tutorial/written-tutorial/lesson1/)

## Running this example
Clone this repository, install its dependencies and build the JavaScript:
``` bash
git clone https://github.com/kiln/shiny-survey.git
cd shiny-survey
npm install
npm run build
```

The R side of this example uses four packages (shiny, dplyr, magrittr, jsonlite). If you don't have them installed, before you begin, open the RStudio console and run:
``` R
install.packages("dplyr")
install.packages("jsonlite")
install.packages("magrittr")
install.packages("shiny")
```

To start the Shiny server, in the RStudio console, run:
``` R
shiny::runApp(".", launch.browser = TRUE)
```
