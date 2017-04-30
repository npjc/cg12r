context('read_cg12')

library(tidyverse)


test_that("parse measurment header of virtual batch config output",{
    # DEBUG
    x <- "\tPlate: S1L1; Date: 2017/4/20; Time: 16:01:41 - Wavelength: 620"
    result <- parse_measurment_header(x)
    expected <- tibble(plate = "S1L1",
                       date = "2017/4/20",
                       time = "16:01:41",
                       wavelength = "620")
    expect_equal(result, expected)

})

test_that("parse measurment header of virtual ThermoSkan FC output",{

    x <- "\tPlate: Plate 1 - Wavelength: 620"
    result <- parse_measurment_header(x)
    expected <- tibble(plate = "Plate 1",
                       wavelength = "620")
    expect_equal(result, expected)

})


test_that("parse measurment data",{
    # have to deal with the \r\n
    x <- '\t0.090\t0.088\t0.090\t0.091\t0.094\t0.089\t0.091\t0.088\t0.090\t0.091\t0.090\t0.094\r\n\t0.082\t0.082\t0.082\t0.082\t0.083\t0.081\t0.081\t0.082\t0.083\t0.086\t0.083\t0.083\r\n\t0.081\t0.083\t0.081\t0.080\t0.081\t0.080\t0.081\t0.082\t0.082\t0.085\t0.086\t0.087\r\n\t0.083\t0.080\t0.082\t0.080\t0.080\t0.083\t0.082\t0.079\t0.081\t0.080\t0.087\t0.083\r\n\t0.092\t0.092\t0.091\t0.089\t0.088\t0.086\t0.088\t0.087\t0.090\t0.088\t0.088\t0.087\r\n\t0.083\t0.087\t0.087\t0.086\t0.083\t0.084\t0.085\t0.085\t0.080\t0.084\t0.083\t0.081\r\n\t0.088\t0.085\t0.084\t0.085\t0.080\t0.082\t0.081\t0.080\t0.081\t0.082\t0.083\t0.080\r\n\t0.090\t0.084\t0.084\t0.087\t0.081\t0.080\t0.079\t0.079\t0.079\t0.082\t0.081\t0.080\r\n'
    result <- parse_measurment_data(x)
    expected <- read_csv("parse-measurment-data-expected.csv.gz", col_types = "iid")
    expect_equal(result, expected)

})
