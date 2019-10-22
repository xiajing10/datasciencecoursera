rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## For each state, find the hospital of the given rank
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
  outdata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  if (!(outcome %in% c("heart attack","heart failure","pneumonia"))){
    stop("invalid outcome")
  }else if(outcome == "heart attack"){colnum = 11
  }else if(outcome == "heart failure"){colnum = 17
  }else if(outcome == "pneumonia"){colnum = 23
  }
}
