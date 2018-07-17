#' @importFrom rstudioapi getActiveDocumentContext insertText
#' @importFrom miniUI miniPage gadgetTitleBar miniContentPanel
#' @import shiny
NULL


#' Cross Reference
#'
#' Addin to insert cross references in bookdown documents with a minimal user interface
#'
#' @return cross reference entry
#' @export
#'
#' @examples
#' # To run the addin place your cursor
#' # in a bookdown document
#'
crossreference <- function(){

  # Chunks
  context <-  getActiveDocumentContext()
  content <- context$contents
  chunks <- content[grepl("```{r", content, fixed = T)]
  chunks <- gsub("```{r", "", chunks, fixed = T)
  chunks <- gsub("([A-Za-z]+).*", "\\1", chunks)

  # UI
  ui <- miniPage(
    gadgetTitleBar("Cross Reference"),
    miniContentPanel(
      selectizeInput("chunk", "Chunk:", chunks),
      radioButtons("type", "Type", c("fig", "tab")),
      textOutput("preview")
    )
  )

  # Server
  server <- function(input, output, session) {

    reference <- reactiveValues(chunk = NULL,
                                type = NULL)

    observeEvent({
      input$chunk
      input$type
      },{
      reference$chunk <- input$chunk
      reference$type <- input$type
      output$preview <- renderText(paste0("\\@ref(", reference$type, ":", reference$chunk, ")"))
    })

    observeEvent(input$done, {
      text <- paste0("\\@ref(", reference$type, ":", reference$chunk, ")")
      insertText(text = text)
      stopApp()
    })

  }

  # Viewer
  viewer <- dialogViewer("Insert cross reference", width = 600, height = 500)
  runGadget(ui, server, viewer = viewer)
}
