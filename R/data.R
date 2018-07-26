
#' Get SchoolInformation (Edubase)
#' @description Access to the Edubase Dataset that describes all UK state schools and their Links/Relationships along with key statistics.
#' @param dataset which Get Schools Information Data ("All Data", "All Data Links", "All Open State Schools")
#' @param refresh force a refresh of the data
#' @param columnstoReturn Columns to return from the cached dataset
#' @param ... addtional parameters to pass into subsequent functions
#'
#' @return a tibble that has Edubase All Data in it
#' @export
#'
#' @examples myDataFrame <- getSchoolInformation()
getSchoolInformation <- function(dataset = "All Data",refresh = FALSE, columnstoReturn = NULL,...)
{
  dataOptions <- c("All Data","All Data Links","All Open State Schools")

  #list("http://ea-edubase-api-prod.azurewebsites.net/edubase")
  if(dataset %!in% dataOptions)
  {
    stop("This is not a vaild dataset choice.")
  }
  if (refresh | is.null(.Edubase))
    {
      edubaseResponse <- httr::GET(url = generateURIforData())
      if (httr::http_error(edubaseResponse))
      {
        print("Something went wrong... Trying with yesterdays date for retrival")

          edubaseResponse <- httr::GET(
                                      generateURIforData(fileDate =
                                                        calculateFileDate(date =
                                                                                {Sys.time() -1 }
                                                                          )
                                                        )
                                      )
        if(httr::http_error(edubaseResponse))
        {
          stop("An unexpected Error has occured")
        }

      }
      .Edubase <<- httr::content(edubaseResponse, type = "text/csv")# %>% dplyr::select(columnstoReturn)# Handle not NULL Case and pass for filter....
    }


  invisible(.Edubase)
  }
