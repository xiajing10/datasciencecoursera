rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
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
  new <- new[order(new[,colnum],new[,2],na.last = NA),]
  if (num == "best"){
    return(new[1,2])
  }else if (num == "worst"){
    return(new[nrow(new),2])
  }else if (num <= nrow(new)){
    return(new[num,2])
  }else {return(NA)}

}
