#' read results file output from cg12 instrument and output a tidy data frame.
#'
#' @param file <chr> path to results file
#'
#' @value
#'   A data frame (tibble).
#'
#' @examples
#'   # read_cg12("12x96MTP_example.txt")
#'
#' @export
read_cg12 <- function(file) {
    string_file <- readr::read_file(file)
    r <- 'Results of (.+)(?:\\r?\\n)+\t?Plate: ([^;]+); Date: ([^;]+); Time: ([^;]+) - Wavelength: (.+)(?:\\r?\\n)+((?:.+\\r?\\n)+)'

    m <- stringr::str_match_all(string_file, r)[[1]][,2:7]

    wells <- tibble::tibble(meas_value = purrr::map(stringr::str_extract_all(m[,6], "[\\d\\.]+"), as.double),
                            well = purrr::map(meas_value, mtp_labels_from_length))

    data <- tibble::tibble(instrument = paste0("CG12-", m[,1]),
                           plate = m[,2],
                           datetime = lubridate::ymd_hms(paste(m[,3], m[,4])),
                           meas_type = as.integer(m[,5]))
    out <- tidyr::unnest(dplyr::bind_cols(data, wells))
    dplyr::select(out, instrument, plate, well, datetime, meas_type, meas_value)
}
