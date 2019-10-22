corr <- function(directory, threshold = 0) {
    comp_cases <- complete(directory)
    files_list <- list.files(path = directory, full.names = TRUE)
    comp_id <- comp_cases[comp_cases$nobs > threshold, 1]
    correlations <- numeric()
    for (i in comp_id) {
        dat <- (read.csv(files_list[i]))
        dff <- dat[complete.cases(dat),]
        correlations <- c(correlations, cor(dff$sulfate, dff$nitrate))
    }
    correlations
}