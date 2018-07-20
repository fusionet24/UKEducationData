#' Generate the URI to request Data from
#'
#' @param source URI for Base Query
#' @param dataset Dataset that is requested
#' @param fileType the file type of the data
#' @param fileDate date of file to retrive.
#'
#' @return URI of file for retrival
#'
generateURIforData <- function(source="http://ea-edubase-api-prod.azurewebsites.net/edubase", dataset = "edubasealldata",fileType ="csv",fileDate = calculateFileDate())
{

  glue::glue("{source}/{dataset}{fileDate}.{fileType}")

}

#' Calulate File Date
#'
#' @param date current date or date thta wants calculating for retrival
#' @param dateFormat format to reshape the date.
#'
#' @return Posix that has current date rearranged
#'
calculateFileDate <- function(date = Sys.Date(), dateFormat ="%Y%m%d")
{
  format(date,dateFormat) #Format Date in given spec..... allow string for future stuff
}
