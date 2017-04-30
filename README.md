
<!-- README.md is generated from README.Rmd. Please edit that file -->
usage
-----

``` r
file <- cg12_example("SR1_results.txt")
read_cg12(file) %>% 
    bind_rows() %>% 
    write_csv("tidy-sr1-results.csv")
```

First, install the necessary tools:

``` r
install.packages(c("devtools", "tidyverse"))
devtools::install_github("npjc/cg12r")
```

``` r
library(tidyverse)
#> Loading tidyverse: ggplot2
#> Loading tidyverse: tibble
#> Loading tidyverse: tidyr
#> Loading tidyverse: readr
#> Loading tidyverse: purrr
#> Loading tidyverse: dplyr
#> Conflicts with tidy packages ----------------------------------------------
#> filter(): dplyr, stats
#> lag():    dplyr, stats
library(cg12r)
```

Examples
--------

#### Example

``` r
file <- cg12_example("SR1_results.txt")
read_lines(file, n_max = 50) %>% cat(sep = '\n')
#> Results of Photometric1
#> 
#>  Plate: Plate 1 - Wavelength: 620
#> 
#>  1.056   0.043   0.043   0.043   0.044   0.044   0.043   0.043   0.043   0.043   0.043   0.049   0.053   0.045   0.044   0.044   0.044   0.045   0.044   0.044   0.045   0.045   0.045   0.045
#>  0.460   0.043   0.043   0.043   0.043   0.044   0.049   0.051   0.051   0.043   0.043   0.044   0.050   0.043   0.044   0.051   0.051   0.046   0.044   0.044   0.044   0.044   0.044   0.045
#>  0.172   0.043   0.043   0.043   0.043   0.044   0.052   0.051   0.050   0.044   0.043   0.044   0.047   0.044   0.044   0.051   0.053   0.052   0.044   0.044   0.044   0.044   0.044   0.045
#>  0.092   0.043   0.043   0.043   0.043   0.044   0.052   0.052   0.047   0.044   0.043   0.044   0.048   0.043   0.044   0.046   0.053   0.053   0.044   0.043   0.044   0.044   0.044   0.045
#>  0.063   0.043   0.043   0.043   0.043   0.044   0.053   0.054   0.046   0.044   0.043   0.044   0.044   0.043   0.044   0.045   0.053   0.052   0.044   0.043   0.044   0.044   0.044   0.045
#>  0.054   0.043   0.043   0.043   0.043   0.044   0.051   0.051   0.044   0.043   0.043   0.044   0.044   0.043   0.043   0.044   0.052   0.051   0.044   0.043   0.044   0.044   0.044   0.045
#>  0.050   0.043   0.043   0.043   0.043   0.044   0.050   0.050   0.044   0.043   0.043   0.044   0.044   0.043   0.043   0.043   0.052   0.049   0.044   0.043   0.044   0.044   0.044   0.047
#>  0.049   0.043   0.043   0.043   0.043   0.044   0.050   0.050   0.044   0.044   0.043   0.044   0.044   0.043   0.043   0.043   0.052   0.047   0.044   0.044   0.045   0.044   0.044   0.053
#>  0.048   0.043   0.043   0.043   0.043   0.044   0.050   0.048   0.045   0.044   0.043   0.044   0.043   0.043   0.043   0.043   0.051   0.045   0.044   0.044   0.044   0.044   0.044   0.054
#>  0.048   0.043   0.043   0.043   0.043   0.044   0.050   0.049   0.046   0.044   0.044   0.044   0.044   0.044   0.046   0.046   0.051   0.046   0.044   0.046   0.044   0.044   0.045   0.053
#>  0.049   0.043   0.043   0.044   0.043   0.044   0.050   0.046   0.047   0.044   0.043   0.045   0.043   0.043   0.044   0.043   0.049   0.046   0.044   0.047   0.044   0.044   0.044   0.053
#>  0.050   0.043   0.043   0.043   0.043   0.043   0.051   0.046   0.048   0.044   0.044   0.044   0.044   0.044   0.044   0.043   0.048   0.047   0.046   0.048   0.044   0.044   0.044   0.053
#>  0.049   0.043   0.043   0.043   0.043   0.043   0.050   0.046   0.050   0.044   0.044   0.045   0.044   0.044   0.044   0.044   0.047   0.047   0.045   0.049   0.044   0.044   0.044   0.061
#>  0.050   0.044   0.043   0.043   0.044   0.044   0.051   0.045   0.051   0.044   0.045   0.046   0.048   0.044   0.044   0.044   0.047   0.049   0.045   0.050   0.044   0.045   0.044   0.054
#>  0.051   0.044   0.044   0.044   0.044   0.044   0.051   0.044   0.051   0.044   0.044   0.046   0.046   0.044   0.044   0.044   0.046   0.049   0.044   0.051   0.045   0.044   0.044   0.052
#>  0.049   0.044   0.044   0.044   0.044   0.044   0.051   0.044   0.051   0.044   0.044   0.044   0.045   0.044   0.044   0.045   0.045   0.049   0.044   0.051   0.048   0.044   0.045   0.053
#> 
#> Results of Photometric1
#> 
#>  Plate: Plate 1 - Wavelength: 620
#> 
#>  1.075                                                                                           
#>  0.485                                                                                           
#>  0.179                                                                                           
#>  0.093                                                                                           
#>  0.063                                                                                           
#>  0.054                                                                                           
#>  0.050                                                                                           
#>  0.049                                                                                           
#>  0.048                                                                                           
#>  0.048                                                                                           
#>  0.048                                                                                           
#>  0.050                                                                                           
#>  0.049                                                                                           
#>  0.050                                                                                           
#>  0.049                                                                                           
#>  0.048                                                                                           
#> 
#> Results of Photometric1
#> 
#>  Plate: Plate 1 - Wavelength: 620
#> 
#>      1.304                                                                                       
#>      0.890                                                                                       
#>      0.548                                                                                       
#>      0.288                                                                                       
read_cg12(file) %>% head()
#> [[1]]
#> # A tibble: 384 × 6
#>          instrument_header   plate wavelength plate_row_int plate_col_int
#>                      <chr>   <chr>      <chr>         <int>         <int>
#> 1  Results of Photometric1 Plate 1        620             1             1
#> 2  Results of Photometric1 Plate 1        620             2             1
#> 3  Results of Photometric1 Plate 1        620             3             1
#> 4  Results of Photometric1 Plate 1        620             4             1
#> 5  Results of Photometric1 Plate 1        620             5             1
#> 6  Results of Photometric1 Plate 1        620             6             1
#> 7  Results of Photometric1 Plate 1        620             7             1
#> 8  Results of Photometric1 Plate 1        620             8             1
#> 9  Results of Photometric1 Plate 1        620             9             1
#> 10 Results of Photometric1 Plate 1        620            10             1
#> # ... with 374 more rows, and 1 more variables: measurment <dbl>
#> 
#> [[2]]
#> # A tibble: 384 × 6
#>          instrument_header   plate wavelength plate_row_int plate_col_int
#>                      <chr>   <chr>      <chr>         <int>         <int>
#> 1  Results of Photometric1 Plate 1        620             1             1
#> 2  Results of Photometric1 Plate 1        620             2             1
#> 3  Results of Photometric1 Plate 1        620             3             1
#> 4  Results of Photometric1 Plate 1        620             4             1
#> 5  Results of Photometric1 Plate 1        620             5             1
#> 6  Results of Photometric1 Plate 1        620             6             1
#> 7  Results of Photometric1 Plate 1        620             7             1
#> 8  Results of Photometric1 Plate 1        620             8             1
#> 9  Results of Photometric1 Plate 1        620             9             1
#> 10 Results of Photometric1 Plate 1        620            10             1
#> # ... with 374 more rows, and 1 more variables: measurment <dbl>
#> 
#> [[3]]
#> # A tibble: 384 × 6
#>          instrument_header   plate wavelength plate_row_int plate_col_int
#>                      <chr>   <chr>      <chr>         <int>         <int>
#> 1  Results of Photometric1 Plate 1        620             1             1
#> 2  Results of Photometric1 Plate 1        620             2             1
#> 3  Results of Photometric1 Plate 1        620             3             1
#> 4  Results of Photometric1 Plate 1        620             4             1
#> 5  Results of Photometric1 Plate 1        620             5             1
#> 6  Results of Photometric1 Plate 1        620             6             1
#> 7  Results of Photometric1 Plate 1        620             7             1
#> 8  Results of Photometric1 Plate 1        620             8             1
#> 9  Results of Photometric1 Plate 1        620             9             1
#> 10 Results of Photometric1 Plate 1        620            10             1
#> # ... with 374 more rows, and 1 more variables: measurment <dbl>
#> 
#> [[4]]
#> # A tibble: 384 × 6
#>          instrument_header   plate wavelength plate_row_int plate_col_int
#>                      <chr>   <chr>      <chr>         <int>         <int>
#> 1  Results of Photometric1 Plate 1        620             1             1
#> 2  Results of Photometric1 Plate 1        620             2             1
#> 3  Results of Photometric1 Plate 1        620             3             1
#> 4  Results of Photometric1 Plate 1        620             4             1
#> 5  Results of Photometric1 Plate 1        620             5             1
#> 6  Results of Photometric1 Plate 1        620             6             1
#> 7  Results of Photometric1 Plate 1        620             7             1
#> 8  Results of Photometric1 Plate 1        620             8             1
#> 9  Results of Photometric1 Plate 1        620             9             1
#> 10 Results of Photometric1 Plate 1        620            10             1
#> # ... with 374 more rows, and 1 more variables: measurment <dbl>
#> 
#> [[5]]
#> # A tibble: 384 × 6
#>          instrument_header   plate wavelength plate_row_int plate_col_int
#>                      <chr>   <chr>      <chr>         <int>         <int>
#> 1  Results of Photometric1 Plate 1        620             1             1
#> 2  Results of Photometric1 Plate 1        620             2             1
#> 3  Results of Photometric1 Plate 1        620             3             1
#> 4  Results of Photometric1 Plate 1        620             4             1
#> 5  Results of Photometric1 Plate 1        620             5             1
#> 6  Results of Photometric1 Plate 1        620             6             1
#> 7  Results of Photometric1 Plate 1        620             7             1
#> 8  Results of Photometric1 Plate 1        620             8             1
#> 9  Results of Photometric1 Plate 1        620             9             1
#> 10 Results of Photometric1 Plate 1        620            10             1
#> # ... with 374 more rows, and 1 more variables: measurment <dbl>
#> 
#> [[6]]
#> # A tibble: 384 × 6
#>          instrument_header   plate wavelength plate_row_int plate_col_int
#>                      <chr>   <chr>      <chr>         <int>         <int>
#> 1  Results of Photometric1 Plate 1        620             1             1
#> 2  Results of Photometric1 Plate 1        620             2             1
#> 3  Results of Photometric1 Plate 1        620             3             1
#> 4  Results of Photometric1 Plate 1        620             4             1
#> 5  Results of Photometric1 Plate 1        620             5             1
#> 6  Results of Photometric1 Plate 1        620             6             1
#> 7  Results of Photometric1 Plate 1        620             7             1
#> 8  Results of Photometric1 Plate 1        620             8             1
#> 9  Results of Photometric1 Plate 1        620             9             1
#> 10 Results of Photometric1 Plate 1        620            10             1
#> # ... with 374 more rows, and 1 more variables: measurment <dbl>
read_cg12(file) %>% bind_rows()
#> # A tibble: 2,304 × 6
#>          instrument_header   plate wavelength plate_row_int plate_col_int
#>                      <chr>   <chr>      <chr>         <int>         <int>
#> 1  Results of Photometric1 Plate 1        620             1             1
#> 2  Results of Photometric1 Plate 1        620             2             1
#> 3  Results of Photometric1 Plate 1        620             3             1
#> 4  Results of Photometric1 Plate 1        620             4             1
#> 5  Results of Photometric1 Plate 1        620             5             1
#> 6  Results of Photometric1 Plate 1        620             6             1
#> 7  Results of Photometric1 Plate 1        620             7             1
#> 8  Results of Photometric1 Plate 1        620             8             1
#> 9  Results of Photometric1 Plate 1        620             9             1
#> 10 Results of Photometric1 Plate 1        620            10             1
#> # ... with 2,294 more rows, and 1 more variables: measurment <dbl>
```

``` r
file <- cg12_example("SR1_results-2.txt")
read_lines(file, n_max = 50) %>% cat(sep = '\n')
#> Results of Photometric1
#> 
#>  Plate: Plate1 - Wavelength: 620
#> 
#>  0.207   0.221   0.225   0.236   0.210   0.230   0.223   0.249   0.231   0.251   0.220   0.260   0.221   0.248   0.236   0.246   0.228   0.251   0.186   0.213   0.234   0.293   0.296   0.327
#>  0.228   0.093   0.256   0.091   0.231   0.094   0.246   0.097   0.254   0.095   0.262   0.095   0.250   0.096   0.258   0.093   0.266   0.096   0.220   0.096   0.299   0.093   0.330   0.092
#>  0.252   0.245   0.245   0.232   0.233   0.218   0.207   0.277   0.302   0.281   0.264   0.270   0.372   0.362   0.222   0.220   0.217   0.222   0.263   0.266   0.313   0.328   0.317   0.272
#>  0.251   0.368   0.238   0.365   0.243   0.375   0.222   0.283   0.298   0.425   0.273   0.416   0.406   0.507   0.226   0.381   0.223   0.371   0.296   0.366   0.313   0.459   0.264   0.415
#>  0.234   0.093   0.257   0.098   0.229   0.108   0.232   0.104   0.254   0.096   0.237   0.091   0.252   0.095   0.265   0.097   0.219   0.093   0.258   0.095   0.287   0.093   0.219   0.096
#>  0.238   0.385   0.255   0.404   0.224   0.373   0.257   0.401   0.259   0.408   0.253   0.377   0.258   0.415   0.266   0.406   0.223   0.363   0.283   0.445   0.276   0.463   0.259   0.332
#>  0.236   0.204   0.242   0.213   0.219   0.221   0.248   0.214   0.259   0.228   0.253   0.238   0.264   0.239   0.260   0.232   0.279   0.262   0.251   0.214   0.342   0.287   0.313   0.298
#>  0.094   0.212   0.093   0.231   0.123   0.227   0.093   0.237   0.095   0.239   0.099   0.253   0.094   0.245   0.094   0.245   0.092   0.277   0.110   0.216   0.112   0.273   0.109   0.347
#>  0.261   0.249   0.238   0.230   0.226   0.215   0.224   0.211   0.283   0.265   0.261   0.269   0.363   0.353   0.221   0.206   0.213   0.211   0.258   0.250   0.289   0.326   0.257   0.230
#>  0.269   0.230   0.261   0.213   0.264   0.221   0.229   0.200   0.291   0.247   0.264   0.240   0.371   0.345   0.225   0.192   0.233   0.204   0.283   0.243   0.291   0.274   0.290   0.237
#>  0.238   0.254   0.243   0.253   0.230   0.236   0.241   0.243   0.251   0.269   0.233   0.247   0.240   0.258   0.225   0.245   0.226   0.239   0.257   0.267   0.251   0.285   0.250   0.246
#>  0.258   0.223   0.249   0.230   0.231   0.220   0.242   0.214   0.246   0.221   0.233   0.215   0.245   0.226   0.238   0.222   0.230   0.230   0.234   0.240   0.260   0.244   0.236   0.214
#>  0.220   0.213   0.240   0.229   0.233   0.238   0.235   0.230   0.249   0.237   0.252   0.250   0.244   0.256   0.245   0.249   0.247   0.233   0.217   0.206   0.280   0.286   0.325   0.335
#>  0.263   0.222   0.268   0.227   0.266   0.231   0.263   0.233   0.273   0.225   0.263   0.229   0.268   0.234   0.240   0.234   0.248   0.241   0.220   0.204   0.268   0.234   0.304   0.281
#>  0.256   0.239   0.237   0.231   0.223   0.227   0.214   0.205   0.285   0.247   0.271   0.282   0.367   0.337   0.217   0.219   0.222   0.214   0.266   0.297   0.318   0.289   0.270   0.239
#>  0.241   0.231   0.222   0.225   0.223   0.220   0.204   0.206   0.240   0.270   0.257   0.252   0.332   0.357   0.226   0.192   0.209   0.215   0.270   0.236   0.245   0.246   0.235   0.211
#> 
#> Results of Photometric1
#> 
#>  Plate: Plate1 - Wavelength: 620
#> 
#>  0.208   0.222   0.226   0.237   0.210   0.231   0.226   0.251   0.235   0.249   0.223   0.260   0.222   0.246   0.229   0.236   0.217   0.231   0.183   0.198   0.232   0.284   0.275   0.329
#>  0.230   0.093   0.257   0.091   0.232   0.093   0.247   0.097   0.257   0.096   0.267   0.095   0.249   0.096   0.249   0.110   0.228   0.106   0.205   0.108   0.285   0.092   0.319   0.092
#>  0.251   0.246   0.244   0.235   0.233   0.220   0.210   0.282   0.301   0.276   0.264   0.262   0.383   0.370   0.223   0.212   0.215   0.213   0.240   0.252   0.311   0.286   0.315   0.292
#>  0.251   0.370   0.238   0.367   0.241   0.377   0.225   0.278   0.301   0.424   0.273   0.412   0.418   0.513   0.223   0.360   0.221   0.357   0.270   0.344   0.309   0.443   0.258   0.405
#>  0.238   0.094   0.261   0.098   0.230   0.108   0.237   0.105   0.257   0.097   0.239   0.092   0.248   0.095   0.257   0.101   0.220   0.096   0.254   0.095   0.286   0.093   0.262   0.098
#>  0.242   0.392   0.258   0.410   0.226   0.385   0.261   0.404   0.259   0.411   0.253   0.379   0.260   0.406   0.260   0.394   0.222   0.363   0.282   0.429   0.288   0.466   0.265   0.410
#>  0.234   0.206   0.246   0.212   0.201   0.222   0.251   0.217   0.260   0.236   0.251   0.240   0.260   0.238   0.249   0.228   0.269   0.246   0.229   0.209   0.329   0.277   0.345   0.339
#>  0.093   0.212   0.093   0.223   0.161   0.218   0.093   0.240   0.097   0.242   0.104   0.254   0.094   0.246   0.094   0.237   0.092   0.259   0.132   0.193   0.128   0.275   0.129   0.349
#>  0.259   0.249   0.240   0.228   0.226   0.216   0.227   0.211   0.283   0.267   0.263   0.268   0.375   0.361   0.219   0.204   0.207   0.212   0.234   0.255   0.254   0.275   0.230   0.248
#>  0.270   0.231   0.257   0.213   0.265   0.224   0.230   0.202   0.292   0.248   0.264   0.240   0.381   0.352   0.223   0.190   0.226   0.198   0.252   0.222   0.251   0.228   0.270   0.216
#>  0.241   0.257   0.246   0.261   0.232   0.241   0.245   0.245   0.256   0.271   0.233   0.246   0.244   0.259   0.241   0.243   0.222   0.232   0.259   0.257   0.258   0.281   0.262   0.255
#>  0.258   0.225   0.255   0.232   0.233   0.221   0.245   0.215   0.251   0.226   0.234   0.217   0.246   0.224   0.238   0.218   0.231   0.224   0.237   0.234   0.256   0.241   0.232   0.221
#>  0.221   0.218   0.242   0.231   0.236   0.239   0.237   0.231   0.252   0.239   0.256   0.250   0.243   0.252   0.242   0.248   0.243   0.226   0.211   0.204   0.270   0.267   0.292   0.315
#>  0.266   0.223   0.273   0.231   0.269   0.236   0.267   0.237   0.276   0.237   0.265   0.234   0.267   0.237   0.243   0.230   0.242   0.235   0.215   0.193   0.272   0.232   0.278   0.257
#>  0.240   0.246   0.239   0.232   0.225   0.227   0.220   0.217   0.283   0.252   0.272   0.285   0.368   0.308   0.241   0.247   0.225   0.211   0.240   0.316   0.276   0.255   0.249   0.246
#>  0.246   0.236   0.233   0.224   0.224   0.212   0.219   0.208   0.239   0.271   0.259   0.259   0.334   0.301   0.257   0.218   0.212   0.212   0.245   0.226   0.228   0.233   0.248   0.208
#> 
#> Results of Photometric1
#> 
#>  Plate: Plate1 - Wavelength: 620
#> 
#>  0.207   0.219   0.224   0.233   0.208   0.229   0.222   0.248   0.230   0.245   0.222   0.257   0.216   0.241   0.223   0.224   0.203   0.223   0.180   0.183   0.237   0.274   0.266   0.322
#>  0.227   0.093   0.253   0.091   0.228   0.093   0.244   0.097   0.255   0.106   0.254   0.095   0.244   0.096   0.241   0.129   0.206   0.116   0.198   0.122   0.282   0.108   0.312   0.092
#>  0.247   0.242   0.243   0.231   0.228   0.216   0.208   0.274   0.295   0.272   0.259   0.255   0.398   0.384   0.220   0.209   0.211   0.211   0.230   0.245   0.295   0.289   0.303   0.285
#>  0.248   0.363   0.237   0.365   0.237   0.370   0.226   0.272   0.293   0.415   0.267   0.403   0.432   0.522   0.221   0.339   0.218   0.349   0.258   0.338   0.297   0.442   0.273   0.431
read_cg12(file) %>% head()
#> Warning: 4 parsing failures.
#> row col   expected                                     actual         file
#>  17  X1 a double   ------------------------------------------ literal data
#>  17  -- 25 columns 1 columns                                  literal data
#>  18  X1 a double   Results of Photometric1                    literal data
#>  18  -- 25 columns 1 columns                                  literal data
#> Warning: 2 parsing failures.
#> row col   expected                  actual         file
#>   9  X1 a double   Results of Photometric1 literal data
#>   9  -- 13 columns 1 columns               literal data
#> [[1]]
#> # A tibble: 384 × 6
#>          instrument_header  plate wavelength plate_row_int plate_col_int
#>                      <chr>  <chr>      <chr>         <int>         <int>
#> 1  Results of Photometric1 Plate1        620             1             1
#> 2  Results of Photometric1 Plate1        620             2             1
#> 3  Results of Photometric1 Plate1        620             3             1
#> 4  Results of Photometric1 Plate1        620             4             1
#> 5  Results of Photometric1 Plate1        620             5             1
#> 6  Results of Photometric1 Plate1        620             6             1
#> 7  Results of Photometric1 Plate1        620             7             1
#> 8  Results of Photometric1 Plate1        620             8             1
#> 9  Results of Photometric1 Plate1        620             9             1
#> 10 Results of Photometric1 Plate1        620            10             1
#> # ... with 374 more rows, and 1 more variables: measurment <dbl>
#> 
#> [[2]]
#> # A tibble: 384 × 6
#>          instrument_header  plate wavelength plate_row_int plate_col_int
#>                      <chr>  <chr>      <chr>         <int>         <int>
#> 1  Results of Photometric1 Plate1        620             1             1
#> 2  Results of Photometric1 Plate1        620             2             1
#> 3  Results of Photometric1 Plate1        620             3             1
#> 4  Results of Photometric1 Plate1        620             4             1
#> 5  Results of Photometric1 Plate1        620             5             1
#> 6  Results of Photometric1 Plate1        620             6             1
#> 7  Results of Photometric1 Plate1        620             7             1
#> 8  Results of Photometric1 Plate1        620             8             1
#> 9  Results of Photometric1 Plate1        620             9             1
#> 10 Results of Photometric1 Plate1        620            10             1
#> # ... with 374 more rows, and 1 more variables: measurment <dbl>
#> 
#> [[3]]
#> # A tibble: 384 × 6
#>          instrument_header  plate wavelength plate_row_int plate_col_int
#>                      <chr>  <chr>      <chr>         <int>         <int>
#> 1  Results of Photometric1 Plate1        620             1             1
#> 2  Results of Photometric1 Plate1        620             2             1
#> 3  Results of Photometric1 Plate1        620             3             1
#> 4  Results of Photometric1 Plate1        620             4             1
#> 5  Results of Photometric1 Plate1        620             5             1
#> 6  Results of Photometric1 Plate1        620             6             1
#> 7  Results of Photometric1 Plate1        620             7             1
#> 8  Results of Photometric1 Plate1        620             8             1
#> 9  Results of Photometric1 Plate1        620             9             1
#> 10 Results of Photometric1 Plate1        620            10             1
#> # ... with 374 more rows, and 1 more variables: measurment <dbl>
#> 
#> [[4]]
#> # A tibble: 384 × 6
#>          instrument_header  plate wavelength plate_row_int plate_col_int
#>                      <chr>  <chr>      <chr>         <int>         <int>
#> 1  Results of Photometric1 Plate1        620             1             1
#> 2  Results of Photometric1 Plate1        620             2             1
#> 3  Results of Photometric1 Plate1        620             3             1
#> 4  Results of Photometric1 Plate1        620             4             1
#> 5  Results of Photometric1 Plate1        620             5             1
#> 6  Results of Photometric1 Plate1        620             6             1
#> 7  Results of Photometric1 Plate1        620             7             1
#> 8  Results of Photometric1 Plate1        620             8             1
#> 9  Results of Photometric1 Plate1        620             9             1
#> 10 Results of Photometric1 Plate1        620            10             1
#> # ... with 374 more rows, and 1 more variables: measurment <dbl>
#> 
#> [[5]]
#> # A tibble: 384 × 6
#>          instrument_header  plate wavelength plate_row_int plate_col_int
#>                      <chr>  <chr>      <chr>         <int>         <int>
#> 1  Results of Photometric1 Plate1        620             1             1
#> 2  Results of Photometric1 Plate1        620             2             1
#> 3  Results of Photometric1 Plate1        620             3             1
#> 4  Results of Photometric1 Plate1        620             4             1
#> 5  Results of Photometric1 Plate1        620             5             1
#> 6  Results of Photometric1 Plate1        620             6             1
#> 7  Results of Photometric1 Plate1        620             7             1
#> 8  Results of Photometric1 Plate1        620             8             1
#> 9  Results of Photometric1 Plate1        620             9             1
#> 10 Results of Photometric1 Plate1        620            10             1
#> # ... with 374 more rows, and 1 more variables: measurment <dbl>
#> 
#> [[6]]
#> # A tibble: 384 × 6
#>          instrument_header  plate wavelength plate_row_int plate_col_int
#>                      <chr>  <chr>      <chr>         <int>         <int>
#> 1  Results of Photometric1 Plate1        620             1             1
#> 2  Results of Photometric1 Plate1        620             2             1
#> 3  Results of Photometric1 Plate1        620             3             1
#> 4  Results of Photometric1 Plate1        620             4             1
#> 5  Results of Photometric1 Plate1        620             5             1
#> 6  Results of Photometric1 Plate1        620             6             1
#> 7  Results of Photometric1 Plate1        620             7             1
#> 8  Results of Photometric1 Plate1        620             8             1
#> 9  Results of Photometric1 Plate1        620             9             1
#> 10 Results of Photometric1 Plate1        620            10             1
#> # ... with 374 more rows, and 1 more variables: measurment <dbl>
read_cg12(file) %>% bind_rows()
#> Warning: 4 parsing failures.
#> row col   expected                                     actual         file
#>  17  X1 a double   ------------------------------------------ literal data
#>  17  -- 25 columns 1 columns                                  literal data
#>  18  X1 a double   Results of Photometric1                    literal data
#>  18  -- 25 columns 1 columns                                  literal data

#> Warning: 2 parsing failures.
#> row col   expected                  actual         file
#>   9  X1 a double   Results of Photometric1 literal data
#>   9  -- 13 columns 1 columns               literal data
#> # A tibble: 310,236 × 8
#>          instrument_header  plate wavelength plate_row_int plate_col_int
#>                      <chr>  <chr>      <chr>         <int>         <int>
#> 1  Results of Photometric1 Plate1        620             1             1
#> 2  Results of Photometric1 Plate1        620             2             1
#> 3  Results of Photometric1 Plate1        620             3             1
#> 4  Results of Photometric1 Plate1        620             4             1
#> 5  Results of Photometric1 Plate1        620             5             1
#> 6  Results of Photometric1 Plate1        620             6             1
#> 7  Results of Photometric1 Plate1        620             7             1
#> 8  Results of Photometric1 Plate1        620             8             1
#> 9  Results of Photometric1 Plate1        620             9             1
#> 10 Results of Photometric1 Plate1        620            10             1
#> # ... with 310,226 more rows, and 3 more variables: measurment <dbl>,
#> #   date <chr>, time <chr>
```

``` r
file <- cg12_example("SR1_results-3.txt")
read_lines(file, n_max = 50) %>% cat(sep = '\n')
#> Results of Photometric1
#> 
#>  Plate: S1L1; Date: 2017/4/21; Time: 16:32:56 - Wavelength: 620
#> 
#>  0.084   0.085   0.086   0.084   0.085   0.085   0.086   0.085   0.085   0.354   0.367   0.448
#>  0.087   0.085   0.085   0.085   0.084   0.085   0.084   0.086   0.085   0.086   0.085   0.085
#>  0.085   0.085   0.086   0.085   0.085   0.085   0.084   0.085   0.085   0.088   0.086   0.085
#>  0.086   0.085   0.085   0.086   0.085   0.085   0.085   0.085   0.084   0.086   0.087   0.084
#>  0.085   0.087   0.085   0.086   0.086   0.085   0.085   0.085   0.086   0.085   0.086   0.085
#>  0.086   0.084   0.085   0.085   0.085   0.084   0.084   0.084   0.084   0.084   0.083   0.084
#>  0.084   0.085   0.084   0.084   0.084   0.085   0.084   0.084   0.084   0.084   0.084   0.085
#>  0.084   0.084   0.083   0.084   0.084   0.084   0.085   0.085   0.083   0.086   0.085   0.084
#> 
#> Results of Photometric1
#> 
#>  Plate: S1L2; Date: 2017/4/21; Time: 16:33:58 - Wavelength: 620
#> 
#>  0.399   0.085   0.086   0.084   0.088   0.085   0.084   0.085   0.085   0.087   0.086   0.085
#>  0.086   0.086   0.086   0.084   0.084   0.086   0.086   0.085   0.085   0.087   0.085   0.085
#>  0.085   0.085   0.085   0.085   0.084   0.085   0.085   0.085   0.086   0.090   0.087   0.087
#>  0.084   0.085   0.084   0.085   0.085   0.085   0.085   0.085   0.086   0.087   0.085   0.085
#>  0.085   0.086   0.085   0.084   0.085   0.085   0.085   0.087   0.086   0.085   0.087   0.547
#>  0.085   0.084   0.086   0.084   0.085   0.085   0.085   0.086   0.086   0.086   0.086   0.089
#>  0.086   0.085   0.085   0.085   0.085   0.085   0.084   0.085   0.085   0.085   0.085   0.086
#>  0.085   0.086   0.084   0.084   0.085   0.085   0.085   0.086   0.086   0.085   0.087   0.086
#> 
#> Results of Photometric1
#> 
#>  Plate: S2L1; Date: 2017/4/21; Time: 16:35:00 - Wavelength: 620
#> 
#>  0.085   0.087   0.084   0.085   0.086   0.086   0.085   0.085   0.085   0.085   0.085   0.087
#>  0.086   0.084   0.089   0.086   0.085   0.086   0.086   0.085   0.084   0.088   0.085   0.088
#>  0.085   0.084   0.085   0.085   0.086   0.085   0.084   0.085   0.086   0.086   0.088   0.085
#>  0.084   0.085   0.086   0.085   0.084   0.086   0.085   0.086   0.085   0.086   0.085   0.085
#>  0.085   0.086   0.086   0.085   0.085   0.085   0.085   0.085   0.084   0.086   0.085   0.084
#>  0.086   0.086   0.085   0.086   0.086   0.087   0.085   0.087   0.086   0.088   0.086   0.085
#>  0.088   0.085   0.086   0.084   0.085   0.085   0.086   0.086   0.086   0.085   0.087   0.087
#>  0.084   0.090   0.087   0.086   0.085   0.086   0.086   0.086   0.087   0.086   0.085   0.085
#> 
#> Results of Photometric1
#> 
#>  Plate: S2L2; Date: 2017/4/21; Time: 16:35:57 - Wavelength: 620
#> 
#>  0.084   0.084   0.085   0.084   0.084   0.085   0.084   0.085   0.086   0.088   0.085   0.086
#>  0.084   0.086   0.085   0.084   0.086   0.086   0.084   0.085   0.085   0.085   0.086   0.084
#>  0.084   0.085   0.085   0.084   0.085   0.084   0.085   0.086   0.086   0.088   0.085   0.086
#>  0.086   0.084   0.085   0.085   0.084   0.085   0.085   0.085   0.085   0.086   0.087   0.086
#>  0.086   0.085   0.085   0.085   0.084   0.085   0.085   0.086   0.085   0.086   0.087   0.085
#>  0.086   0.085   0.086   0.084   0.086   0.086   0.086   0.086   0.085   0.087   0.086   0.085
#>  0.086   0.085   0.085   0.085   0.085   0.087   0.085   0.086   0.085   0.085   0.086   0.086
read_cg12(file) %>% head()
#> [[1]]
#> # A tibble: 96 × 8
#>          instrument_header plate      date     time wavelength
#>                      <chr> <chr>     <chr>    <chr>      <chr>
#> 1  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 2  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 3  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 4  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 5  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 6  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 7  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 8  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 9  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 10 Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> # ... with 86 more rows, and 3 more variables: plate_row_int <int>,
#> #   plate_col_int <int>, measurment <dbl>
#> 
#> [[2]]
#> # A tibble: 96 × 8
#>          instrument_header plate      date     time wavelength
#>                      <chr> <chr>     <chr>    <chr>      <chr>
#> 1  Results of Photometric1  S1L2 2017/4/21 16:33:58        620
#> 2  Results of Photometric1  S1L2 2017/4/21 16:33:58        620
#> 3  Results of Photometric1  S1L2 2017/4/21 16:33:58        620
#> 4  Results of Photometric1  S1L2 2017/4/21 16:33:58        620
#> 5  Results of Photometric1  S1L2 2017/4/21 16:33:58        620
#> 6  Results of Photometric1  S1L2 2017/4/21 16:33:58        620
#> 7  Results of Photometric1  S1L2 2017/4/21 16:33:58        620
#> 8  Results of Photometric1  S1L2 2017/4/21 16:33:58        620
#> 9  Results of Photometric1  S1L2 2017/4/21 16:33:58        620
#> 10 Results of Photometric1  S1L2 2017/4/21 16:33:58        620
#> # ... with 86 more rows, and 3 more variables: plate_row_int <int>,
#> #   plate_col_int <int>, measurment <dbl>
#> 
#> [[3]]
#> # A tibble: 96 × 8
#>          instrument_header plate      date     time wavelength
#>                      <chr> <chr>     <chr>    <chr>      <chr>
#> 1  Results of Photometric1  S2L1 2017/4/21 16:35:00        620
#> 2  Results of Photometric1  S2L1 2017/4/21 16:35:00        620
#> 3  Results of Photometric1  S2L1 2017/4/21 16:35:00        620
#> 4  Results of Photometric1  S2L1 2017/4/21 16:35:00        620
#> 5  Results of Photometric1  S2L1 2017/4/21 16:35:00        620
#> 6  Results of Photometric1  S2L1 2017/4/21 16:35:00        620
#> 7  Results of Photometric1  S2L1 2017/4/21 16:35:00        620
#> 8  Results of Photometric1  S2L1 2017/4/21 16:35:00        620
#> 9  Results of Photometric1  S2L1 2017/4/21 16:35:00        620
#> 10 Results of Photometric1  S2L1 2017/4/21 16:35:00        620
#> # ... with 86 more rows, and 3 more variables: plate_row_int <int>,
#> #   plate_col_int <int>, measurment <dbl>
#> 
#> [[4]]
#> # A tibble: 96 × 8
#>          instrument_header plate      date     time wavelength
#>                      <chr> <chr>     <chr>    <chr>      <chr>
#> 1  Results of Photometric1  S2L2 2017/4/21 16:35:57        620
#> 2  Results of Photometric1  S2L2 2017/4/21 16:35:57        620
#> 3  Results of Photometric1  S2L2 2017/4/21 16:35:57        620
#> 4  Results of Photometric1  S2L2 2017/4/21 16:35:57        620
#> 5  Results of Photometric1  S2L2 2017/4/21 16:35:57        620
#> 6  Results of Photometric1  S2L2 2017/4/21 16:35:57        620
#> 7  Results of Photometric1  S2L2 2017/4/21 16:35:57        620
#> 8  Results of Photometric1  S2L2 2017/4/21 16:35:57        620
#> 9  Results of Photometric1  S2L2 2017/4/21 16:35:57        620
#> 10 Results of Photometric1  S2L2 2017/4/21 16:35:57        620
#> # ... with 86 more rows, and 3 more variables: plate_row_int <int>,
#> #   plate_col_int <int>, measurment <dbl>
#> 
#> [[5]]
#> # A tibble: 96 × 8
#>          instrument_header plate      date     time wavelength
#>                      <chr> <chr>     <chr>    <chr>      <chr>
#> 1  Results of Photometric1  S3L1 2017/4/21 16:37:06        620
#> 2  Results of Photometric1  S3L1 2017/4/21 16:37:06        620
#> 3  Results of Photometric1  S3L1 2017/4/21 16:37:06        620
#> 4  Results of Photometric1  S3L1 2017/4/21 16:37:06        620
#> 5  Results of Photometric1  S3L1 2017/4/21 16:37:06        620
#> 6  Results of Photometric1  S3L1 2017/4/21 16:37:06        620
#> 7  Results of Photometric1  S3L1 2017/4/21 16:37:06        620
#> 8  Results of Photometric1  S3L1 2017/4/21 16:37:06        620
#> 9  Results of Photometric1  S3L1 2017/4/21 16:37:06        620
#> 10 Results of Photometric1  S3L1 2017/4/21 16:37:06        620
#> # ... with 86 more rows, and 3 more variables: plate_row_int <int>,
#> #   plate_col_int <int>, measurment <dbl>
#> 
#> [[6]]
#> # A tibble: 96 × 8
#>          instrument_header plate      date     time wavelength
#>                      <chr> <chr>     <chr>    <chr>      <chr>
#> 1  Results of Photometric1  S3L2 2017/4/21 16:38:03        620
#> 2  Results of Photometric1  S3L2 2017/4/21 16:38:03        620
#> 3  Results of Photometric1  S3L2 2017/4/21 16:38:03        620
#> 4  Results of Photometric1  S3L2 2017/4/21 16:38:03        620
#> 5  Results of Photometric1  S3L2 2017/4/21 16:38:03        620
#> 6  Results of Photometric1  S3L2 2017/4/21 16:38:03        620
#> 7  Results of Photometric1  S3L2 2017/4/21 16:38:03        620
#> 8  Results of Photometric1  S3L2 2017/4/21 16:38:03        620
#> 9  Results of Photometric1  S3L2 2017/4/21 16:38:03        620
#> 10 Results of Photometric1  S3L2 2017/4/21 16:38:03        620
#> # ... with 86 more rows, and 3 more variables: plate_row_int <int>,
#> #   plate_col_int <int>, measurment <dbl>
read_cg12(file) %>% bind_rows()
#> # A tibble: 82,944 × 8
#>          instrument_header plate      date     time wavelength
#>                      <chr> <chr>     <chr>    <chr>      <chr>
#> 1  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 2  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 3  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 4  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 5  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 6  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 7  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 8  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 9  Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> 10 Results of Photometric1  S1L1 2017/4/21 16:32:56        620
#> # ... with 82,934 more rows, and 3 more variables: plate_row_int <int>,
#> #   plate_col_int <int>, measurment <dbl>
```
