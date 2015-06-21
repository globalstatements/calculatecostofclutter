# ui.R

shinyUI(fluidPage(
  titlePanel(h1("Calculate the Cost of Clutter")),
  
  sidebarLayout(
    sidebarPanel(
      h2("Real Estate Value"),
      radioButtons(
        "radioneighborhood", 
        label = strong("Neighborhood"),
        choices = list("Rural or Low Rent District" = 1, 
                       "Residential or Commercial" = 2,
                       "High Rent District" = 3),
        selected = 2),
                 hr(),
                 h2("Item Size"),
                 sliderInput("sliderwidth", 
                             label = p(strong("Width"), 
                                       "(inches)"),
                             min = 0, max = 60, value = 4,
                             step=1),
                 sliderInput("sliderdepth", 
                             label = p(strong("Depth"), 
                                       "(inches)"),
                             min = 0, max = 20, value = 10,
                             step=2),
                 radioButtons("radioloc", label = strong("Location"),
                              choices = list("Shelf" = 1, 
                                             "Box" = 2,
                                             "Drawer" = 3,
                                             "Floor" = 4),
                              selected = 1),
                 
                 p()
                 ),
    mainPanel(
      p("Everything you own has a economic cost of owning it,",
        "quite apart from the original cost of purchasing it.",
        "The cost you pay to continue to own something is",
        "part of the cost to occupy the building",
        "you keep it in, in proportion to the space the item",
        "takes up. Use this calculator to estimate the",
        "cost of owning some of the things you own."),
      hr(),
      div(textOutput("neighborhoodtext")),
      div(textOutput("itemtext")),
      div(textOutput("boilerplate")),
      div(textOutput("answer"),
        style="margin-top: 35pt; text-align: center; font-size: 28pt; color: #089804;")
    )
  )
))
