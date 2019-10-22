best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  outdata <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  if (!(outcome %in% c("heart attack","heart failure","pneumonia"))){
    stop("invalid outcome")
  }else if(outcome == "heart attack"){colnum = 11
  }else if(outcome == "heart failure"){colnum = 17
  }else if(outcome == "pneumonia"){colnum = 23
  }
  if (!(state %in% outdata[,7])){
    stop("invalid state")
  }
  outdata[, colnum] <- as.numeric(outdata[, colnum])
  new <- outdata[outdata[7] == state,]
  bestout <- which.min(new[,11])
  return(new[bestout,2])
}
