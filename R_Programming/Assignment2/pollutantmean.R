pollutantmean <- function(directory, pollutant, id = 1:332) {
    FilesList <- list.files(path = directory, full.names = TRUE)
    Data <- data.frame()
    for (i in id) {
        Data <- rbind(Data,read.csv(FilesList[i]))
    }
    
    mean(Data[, pollutant],na.rm = TRUE)
}