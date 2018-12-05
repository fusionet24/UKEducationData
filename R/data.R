
#' Get SchoolInformation (Edubase)
#' @description Access to the Edubase Dataset that describes all UK state schools and their Links/Relationships along with key statistics.
#' @param dataset which Get Schools Information Data ("All Data", "All Data Links", "All Open State Schools")
#' @param refresh force a refresh of the data
#' @param ... addtional parameters to pass into subsequent functions
#'
#' @return a tibble that has Edubase All Data in it
#' @export
#'
#' @examples myDataFrame <- getSchoolInformation()
getSchoolInformation <- function(dataset = "All Data",refresh = FALSE,...)
{
  dataOptions <- data_frame(datasetName = c("All Data","All Data Links","All Open State Schools") , relative_uri = c( "edubasealldata","links_edubasealldata",NA))

  #list("http://ea-edubase-api-prod.azurewebsites.net/edubase")
  if(dataset %!in% dataOptions$datasetName)
  {
    stop(glue::glue("This is not a vaild dataset choice. Choices are {dataOptions}"))
  }
  if (refresh | is.null(.Edubase))
    {
      dataOptions %>%
          filter(datasetName %in% dataset) %>%
          pull(relative_uri)-> dataset
      edubaseResponse <- generateURIforData(dataset = dataset) %>%
                                                                purrr::map(httr::GET)

      failures <- purrr::map(edubaseResponse, httr::http_error) %>%
        purrr::reduce(any)

        if(failures)
        {
          stop("An unexpected Error has occured")
        }
      .Edubase <<- edubaseResponse %>% purrr::map(.f = content)# %>% dplyr::select(columnstoReturn)# Handle not NULL Case and pass for filter....

      }


  invisible(.Edubase)
  }
