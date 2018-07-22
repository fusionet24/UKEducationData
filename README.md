
<!-- README.md is generated from README.Rmd. Please edit that file -->
UKEducationData
===============

The goal of UKEducationData is to provide a Unified API for easy access to UK Education Related Datasets. This will include government sources aswell as 3rd party sources where related.

Installation
------------

Install The development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("fusionet24/UKEducationData")
```

Example
-------

This is how you retrive data for [Get Schools Information](https://get-information-schools.service.gov.uk/):

``` r
data <- UKEducationData::getSchoolInformation()
#> Called from: UKEducationData::getSchoolInformation()
#> debug at /home/sbell/UKEducationData/R/data.R#15: if (refresh | is.null(.Edubase)) {
#>     edubaseResponse <- httr::GET(url = generateURIforData())
#>     if (httr::http_error(edubaseResponse)) {
#>         print("Something went wrong... Trying with yesterdays date for retrival")
#>         edubaseResponse <- httr::GET(generateURIforData(fileDate = calculateFileDate(date = {
#>             Sys.time() - 1
#>         })))
#>         if (httr::http_error(edubaseResponse)) {
#>             stop("An unexpected Error has occured")
#>         }
#>     }
#>     .Edubase <<- httr::content(edubaseResponse, type = "text/csv")
#> }
#> debug at /home/sbell/UKEducationData/R/data.R#17: edubaseResponse <- httr::GET(url = generateURIforData())
#> debug at /home/sbell/UKEducationData/R/data.R#18: if (httr::http_error(edubaseResponse)) {
#>     print("Something went wrong... Trying with yesterdays date for retrival")
#>     edubaseResponse <- httr::GET(generateURIforData(fileDate = calculateFileDate(date = {
#>         Sys.time() - 1
#>     })))
#>     if (httr::http_error(edubaseResponse)) {
#>         stop("An unexpected Error has occured")
#>     }
#> }
#> debug at /home/sbell/UKEducationData/R/data.R#35: .Edubase <<- httr::content(edubaseResponse, type = "text/csv")
#> No encoding supplied: defaulting to UTF-8.
#> Parsed with column specification:
#> cols(
#>   .default = col_character(),
#>   URN = col_integer(),
#>   `LA (code)` = col_integer(),
#>   EstablishmentNumber = col_integer(),
#>   `EstablishmentTypeGroup (code)` = col_integer(),
#>   `EstablishmentStatus (code)` = col_integer(),
#>   `PhaseOfEducation (code)` = col_integer(),
#>   StatutoryLowAge = col_integer(),
#>   StatutoryHighAge = col_integer(),
#>   `Boarders (code)` = col_integer(),
#>   `OfficialSixthForm (code)` = col_integer(),
#>   `Gender (code)` = col_integer(),
#>   `AdmissionsPolicy (code)` = col_integer(),
#>   SchoolCapacity = col_integer(),
#>   `SpecialClasses (code)` = col_integer(),
#>   NumberOfPupils = col_integer(),
#>   NumberOfBoys = col_integer(),
#>   NumberOfGirls = col_integer(),
#>   `TrustSchoolFlag (code)` = col_integer(),
#>   `Trusts (code)` = col_integer(),
#>   `Federations (code)` = col_integer()
#>   # ... with 14 more columns
#> )
#> See spec(...) for full column specifications.
#> Warning: 2 parsing failures.
#> row # A tibble: 2 x 5 col     row col                expected               actual file         expected   <int> <chr>              <chr>                  <chr>  <chr>        actual 1  1703 Federations (code) no trailing characters ~16659 <raw vector> file 2  1792 Federations (code) no trailing characters ~16659 <raw vector>
#> debug at /home/sbell/UKEducationData/R/data.R#39: invisible(.Edubase)
```
