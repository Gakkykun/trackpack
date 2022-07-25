#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  output$distPlot <- renderPlot({

    library(ggplot2)
    library(cranlogs)
    stats <- cran_downloads("lazytrade", from=input$daterange4[1], to=input$daterange4[2])
    ggplot(stats, aes(date, count)) +
      geom_col() +
      labs(
        title=sprintf(
          "{stats} downloads to %s",
          Sys.Date() - 1
        ),
        caption = "dat from {cranlogs}"
      ) +
      theme_minimal()

  })
}
