#' Get SchoolInformation (Edubase)
#' @description Access to the
#' @param dataset
#' @param refresh force a refresh of the data
#' @param region represents the Local Authority (LA) code, defaults to 0 which is all English LA's
#' @param ... addtional parameters to pass into subsequent functions
#'
#' @return a tibble that has Edubase All Data in it
#' @export
#'
#' @examples myDataFrame <- getSchoolInformation()
get_education_data_england <- function(dataset = "All Data",region = 0, refresh = FALSE,...)
{


  invisible(.Edubase)
}

