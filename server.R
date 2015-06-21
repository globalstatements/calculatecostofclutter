realestatevalue <- c("Rural or Low Rent District", 
                     "Residential or Commercial",
                     "High Rent District")

locationlabel <- c("on a shelf.", 
                   "in a box.",
                   "in a drawer.",
                   "on the floor.")

shinyServer(function(input, output) {
  
  output$neighborhoodtext <- renderText({ 
    paste("Real estate value:", 
          realestatevalue[as.integer(input$radioneighborhood)])
  })
  output$itemtext <- renderText({ 
    paste("Your item has", 
          "width", input$sliderwidth, "inches and",
          "depth", input$sliderdepth, "inches and is stored",
          locationlabel[as.integer(input$radioloc)])
  })
  output$boilerplate <- renderText({ 
    paste("The estimated cost of owning your item is:")
  })
  output$answer <- renderText({ 
    if (input$radioneighborhood == '1') rent <- 0.28
    if (input$radioneighborhood == '2') rent <- 0.79
    if (input$radioneighborhood == '3') rent <- 2.24
    maintenancefactor <- 2

    width <- as.numeric(input$sliderwidth)
    depth <- as.numeric(input$sliderdepth)
    area <- (width/12)*((depth + 19)/12) # floor
    if (input$radioloc == '1') area <- 
      (width/12)*(25.5/12)/5 # shelf
    if (input$radioloc == '2') area <-
      (width/12)*((depth + 4.75)/12)/4 # box
    if (input$radioloc == '3') area <-
      ((width + 2)/12)*((depth + 2)/12)/6 # drawer

    cost <- rent*maintenancefactor*area*12
    paste("$", as.character(round(cost, 2)), "per year")
  })
  
  
  
})
