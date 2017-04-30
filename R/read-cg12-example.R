#' get example file for pkg demo
#'
#' @param file
#'
#' @examples
#'    cg12_example("SR1_results.txt")
#'    cg12_example("SR1_results-2.txt")
#'    cg12_example("SR1_results-3.txt")
#'
#' @export
cg12_example <- function(file){
    system.file("extdata", file, package = "cg12r", mustWork = TRUE)
}
