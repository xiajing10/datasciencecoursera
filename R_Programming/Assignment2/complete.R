complete <- function(directory, id = 1:331) {
    FilesList <- list.files(path = directory, full.names = TRUE)
    cases <- data.frame()
    for (i in id) {
        dat <- read.csv(FilesList[i],header = TRUE)
        nobs <- sum(complete.cases(dat))
        cases <- rbind(cases,data.frame(i, nobs))
    }
    cases
}
    