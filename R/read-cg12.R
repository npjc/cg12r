#' @importFrom rlang .data
.data

#' read GP-1 output file into tidy tibble
#'
#' @param file `<chr>` path to results file
#' @param all_fields `<lgl>` should all fields be included? Defaults to [FALSE].
#'
#' @return
#' [tibble()] with the following cols:
#'
#' - **plate** identifier as found in file,
#' - **well** identifier,
#' - **runtime** time since run start in seconds,
#' - **measure** numeric value of measurement as recorded,
#'
#' if `all_fields = TRUE`:
#'
#' - **instrument** character string as written to results file,
#' - **datetime** of measurement in ISO8601 (datetime format),
#' - **measure_type** the type of measurement; currently this is a stub to
#' allow for multi-measurement-type results parsing in the future if needed.
#'
#' @examples
#' file <- cg12_example("12x96MTP_example.txt")
#' read_cg12(file)
#' read_cg12(file, all_fields = TRUE)
#'
#' @export
read_cg12 <- function(file, all_fields = FALSE) {
    string_file <- readr::read_file(file)
    r <- 'Results of (.+)(?:\\r+?\\n+)+\t?Plate: ([^;]+); Date: ([^;]+); Time: ([^;]+) - Wavelength: (.+)(?:\\r+?\\n+)+((?:.+\\r+?\\n+)+)'
    m <- stringr::str_match_all(string_file, r)[[1]][,2:7]

    wells <- tibble::tibble(measure = purrr::map(stringr::str_extract_all(m[,6], "[\\d\\.]+"), as.double),
                            well = purrr::map(.data$measure, mtputils::well_labels_from_length))
    data <- tibble::tibble(instrument = paste0("CG12-", m[,1]),
                           plate = m[,2],
                           datetime = parse_cg12_datetime(m[,3], m[,4]),
                           measure_type = as.integer(m[,5]))

    d <- dplyr::bind_cols(data, wells)
    d <- tidyr::unnest(d, cols = c(.data$measure, .data$well))
    d <- dplyr::group_by(d, .data$plate, .data$well)
    d <- dplyr::mutate(d, runtime = as.integer(.data$datetime - min(.data$datetime)))
    d <- dplyr::ungroup(d)
    d <- dplyr::arrange(d, .data$plate, .data$well, .data$datetime)
    d <- dplyr::select(d, .data$instrument, .data$plate, .data$well,
                       .data$datetime, .data$runtime, .data$measure_type,
                       .data$measure)
    if (!all_fields) {
        d <- dplyr::select(d, -.data$instrument, -.data$datetime,
                           -.data$measure_type)
    }
    d
}

parse_cg12_datetime <- function(date, time) {
    readr::parse_datetime(paste(date, time), format = "%Y/%m/%d %H:%M:%S")
}
