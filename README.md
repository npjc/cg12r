
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![CRAN
status](http://www.r-pkg.org/badges/version/cg12r)](https://cran.r-project.org/package=cg12r)
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

## usage

``` r
library(cg12r)
cg12_example("12x96MTP_example.txt")
#| [1] "/Library/Frameworks/R.framework/Versions/3.5/Resources/library/cg12r/extdata/12x96MTP_example.txt"
file <- cg12_example("12x96MTP_example.txt")
data <- read_cg12(file)
data
#| # A tibble: 123,744 x 6
#|    instrument        plate well  datetime            meas_type meas_value
#|    <chr>             <chr> <chr> <dttm>                  <int>      <dbl>
#|  1 CG12-Photometric1 S1L1  A01   2018-04-19 14:36:36       620      0.078
#|  2 CG12-Photometric1 S1L1  A02   2018-04-19 14:36:36       620      0.077
#|  3 CG12-Photometric1 S1L1  A03   2018-04-19 14:36:36       620      0.082
#|  4 CG12-Photometric1 S1L1  A04   2018-04-19 14:36:36       620      0.285
#|  5 CG12-Photometric1 S1L1  A05   2018-04-19 14:36:36       620      0.081
#|  6 CG12-Photometric1 S1L1  A06   2018-04-19 14:36:36       620      0.08 
#|  7 CG12-Photometric1 S1L1  A07   2018-04-19 14:36:36       620      0.142
#|  8 CG12-Photometric1 S1L1  A08   2018-04-19 14:36:36       620      0.083
#|  9 CG12-Photometric1 S1L1  A09   2018-04-19 14:36:36       620      0.077
#| 10 CG12-Photometric1 S1L1  A10   2018-04-19 14:36:36       620      0.101
#| # … with 123,734 more rows
```

### under development

plot plate-level variables onto the physical carousel layout

``` r
plot_carousel()
# data %>% 
#   group_by(plate) %>% 
#   summarise(nwells = length(unique(well)), nmeas = length(unique(datetime))) %>% 
#   plot_carousel()
```

<p align="center">

<img src="inst/extdata/carousel.svg" alt="carousel" height="800px">

</p>
