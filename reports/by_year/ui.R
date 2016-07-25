shinyUI(fluidPage(
  titlePanel("Violent crime in northwest Philadelphia"),
  sidebarLayout(position = "left",
                sidebarPanel(dateRangeInput("years","Select date range:", start = "2016-01-01", end = "2016-07-24", min = "2006-01-01", max = "2016-07-24", startview = "year", separator = "to"),
                             
                             checkboxGroupInput("type", "Crime type:", choices = c("Homicides", "Assaults", "Sexual assaults"), selected = "Homicides"),
                             
                             selectInput("view", "View style:", choices = c("Overlay", "Side-by-side"), multiple = FALSE),
                             
                             p("This map shows the location of different types of violent crime
                               in northwest Philadelphia from the start of 2006 to July 24, 2016 
                               (the date the data were accessed). This visualization is incomplete 
                               as entries in the database without an easily accessible latitude and 
                               longitude (of which there are many) aren't shown on the map."),
                             
                             p("In the original data, the crimes were further subdivided. I've
                               ommited these categories for the sake of clarity and interpretability
                               of the map. The assault category was divided into assaults with a 
                               firearm, assaults without a firearm, and all other assaults. Homicides
                               were categorized as either criminal, negligent, or justifiable. The
                               sexual assault categories were the vaguest. I chose to include crimes
                               categorized as rape and a catch-all other category of noncommercial sex
                               offenses. It's very possible that some important nuance has been lost in
                               these categorizations."),
                             
                             p("The data were collected from", a("OpenDataPhilly", 
                               href = "https://www.opendataphilly.org/dataset/crime-incidents"), "and no
                               ownership is claimed. This work is licensed under the", a("MIT License.", 
                               href="https://opensource.org/licenses/MIT"))
                ),
                mainPanel(plotOutput("map", width = "100%"))
  )
))