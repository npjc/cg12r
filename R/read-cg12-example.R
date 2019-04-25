#' get a cg12 example data file
#'
#' @param file `<chr>` name of the file
#' @export
#' @examples
#' cg12_example("12x96MTP_example.txt")
#' cg12_example("SR1_results-2.txt")
#' cg12_example("SR1_results-3.txt")
#'
cg12_example <- function(file){
    system.file("extdata", file, package = "readcg12", mustWork = TRUE)
}
