shinyUI(fluidPage(
  titlePanel("Violent crime in northwest Philadelphia"),
  sidebarLayout(position = "left",
                sidebarPanel(helpText("Select date range:"),
                             dateRangeInput("years","", start = "2016-01-01", end = "2016-07-24", min = "2006-01-01", max = "2016-07-24", startview = "year", separator = "to"),
                             
                             helpText("Crime type:"),
                             checkboxGroupInput("type", "", choices = c("Homicides", "Assaults", "Sexual assaults"), selected = "Homicides"),
                             
                             p("This map shows the location of different types of violent crime
                               in northwest Philadelphia from 2006 to July 24, 2016 (the date the
                               data were accessed). This visualization is incomplete as no attempt
                               was made to interpret location descriptions corresponding to crimes
                               without a lattitude and longitude recorded in the database.
                               Furthermore, the descriptions displayed and used for sorting the
                               crimes are taken directly from the data with out alteration. It is
                               very possible that some subtle nuances have been glossed over,
                               particularly concerning the catch-all 'other' categories."),
                             
                             p("The data were collected from", a("OpenDataPhilly", 
                             href = "https://www.opendataphilly.org/dataset/crime-incidents"), "and no
                             ownership is claimed. This work is licensed under the", a("MIT License.", 
                             href="https://opensource.org/licenses/MIT"))
                ),
                mainPanel(plotOutput("map", width = "100%"))
  )
))