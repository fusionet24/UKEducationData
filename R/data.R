
#' Get SchoolInformation (Edubase)
#' @description Access to the Edubase Dataset that describes all UK state schools and their Links/Relationships along with key statistics.
#' @param refresh force a refresh of the data
#' @param columnstoReturn Columns to return from the cached dataset
#' @param ... addtional parameters to pass into subsequent functions
#'
#' @return a tibble that has Edubase All Data in it
#' @export
#'
#' @examples getSchoolInformation()
getSchoolInformation <- function(refresh = TRUE, columnstoReturn = NULL,...)
{
  if (refresh)
    {
      edubaseResponse <- httr::GET(url = generateURIforData())
    }
  if (httr::http_error(edubaseResponse))
  {
    print("Something went wrong... Trying with yesterdays date for retrival")

    edubaseResponse <- httr::GET(
        generateURIforData(fileDate =
                         calculateFileDate(
                           date = {Sys.time() -1 }
                           )
                       )
      )
    if(httr::http_error(edubaseResponse))
    {
      stop("An unexpected Error has occured")
    }

  }
  httr::content(edubaseResponse, type = "text/csv")# %>% dplyr::select(columnstoReturn)# Handle not NULL Case and pass for filter....
}
