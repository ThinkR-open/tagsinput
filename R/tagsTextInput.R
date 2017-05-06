
#' @importFrom htmltools htmlDependency
#' @importFrom utils packageVersion
#' @noRd
tagsInputDependencies <- function(){
  version <- as.character( packageVersion("tagsinput")[[1]] )
  src <- system.file( "js", package = "tagsinput" )
  dep <- htmlDependency(
    name = "tagsinput",
    version = version,
    src = src,
    script = "bootstrap-tagsinput.js",
    stylesheet = "bootstrap-tagsinput.css"
    )
  list( dep )
}


#' text input specific to tags
#'
#' @param ... see \code{\link[shiny]{textInput}}
#'
#' @importFrom shiny textInput
#' @importFrom htmltools tagAppendAttributes
#' @export
#'
#' @examples
#' \dontrun{
#'   library(shiny)
#'   ui <- fluidPage(
#'     tagsTextInput("text", "Text", "foo,bar"),
#'     textOutput("out")
#'   )
#'
#'   server <- function(input, output){
#'     output$out <- renderPrint(input$text)
#'   }
#'
#'   shinyApp( ui, server )
#'
#' }
tagsTextInput <- function(...) {
  res <- textInput(...)
  res$children[[2]] <- tagAppendAttributes( res$children[[2]], `data-role` = "tagsinput" )
  attr(res, "html_dependencies") <- tagsInputDependencies()
  res
}
