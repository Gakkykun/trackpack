#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  output$distPlot <- renderPlot({

    stats <- cranlogs::cran_downloads("lazytrade", from=input$daterange4[1], to=input$daterange4[2])
    ggplot2::ggplot(stats, aes(date, count)) +
      ggplot2::geom_col() +
      ggplot2::labs(
        title=sprintf(
          "{stats} downloads to %s",
          Sys.Date() - 1
        ),
        caption = "dat from {cranlogs}"
      ) +
      ggplot2::theme_minimal()

  })
}
