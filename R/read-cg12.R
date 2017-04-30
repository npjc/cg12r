#' read results file output from cg12 instrument and output a tidy data frame
#'
#' @param file <chr> path to results file
#'
#' @value
#'   A data frame (tibble).
#'
#' @examples
#'   # read_cg12("SR1_results.txt")
#'
#' @export
read_cg12 <- function(file) {
    # read in file as string
    string_file <- readr::read_file(file)
    # parse measurments (one row per section)
    # matched  section ... Results line ... measurment line ... data matrix
    r <- '(Results.+)(?:\\r?\\n)+(.+)(?:\\r?\\n)+((?:.+\\r?\\n)+)'
    m <- stringr::str_match_all(string_file, r)
    out <- apply(m[[1]], 1, parse_result)
    out <- lapply(out, tidy_result)
    out
}



tidy_result <- function(x) {
    d <- tibble::as_tibble(x)
    d <- dplyr::select(d, -original_match)
    d <- tidyr::unnest(d, measurment_header)
    d <- tidyr::unnest(d, measurment_data)
    d
}



parse_result <- function(x) {
    original_match <- x[1]
    instrument_header <- x[2]
    measurment_header <- parse_measurment_header(x[3])
    measurment_data <- parse_measurment_data(x[4])

    l <- list(original_match = original_match,
              instrument_header = instrument_header,
              measurment_header = list(measurment_header),
              measurment_data = list(measurment_data))
    l
}

parse_measurment_header <- function(x) {
    r <- '\tPlate: ([^;]+); Date: ([^;]+); Time: ([^ ]+) - Wavelength: (.+)'
    var_names <- c("plate", "date", "time", "wavelength")

    no_match_detected <- !stringr::str_detect(x, r)
    if(no_match_detected) {
        # for results directly from ThermoSkan FC
        r <- '\tPlate: ([^;]+) - Wavelength: (.+)'
        var_names <- c("plate", "wavelength")
    }

    l <- as.list(stringr::str_match(x, r)[-1])
    l <- purrr::set_names(l, var_names)
    tibble::as_tibble(l)
}

parse_measurment_data <- function(x) {
    d <- readr::read_tsv(x, col_names = F, col_types = readr::cols(.default = readr::col_double()))
    d <- purrr::set_names(d, c("spacer", seq_len(length(d) - 1)))
    d <- dplyr::select(d, -spacer)
    d <- dplyr::mutate(d, plate_row_int = row_number())
    d <- tidyr::gather(d, plate_col_int, measurment, -plate_row_int, convert = T)
    d
}
