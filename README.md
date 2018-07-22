
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
```
