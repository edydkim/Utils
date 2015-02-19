pollutantmean <- function(directory, pollutant, id = 1:332) {
    total <- data.frame()
    
    for(i in 1:332) {
        file_name <- sprintf("%03d.csv", i)
        file_name <- paste(directory, file_name, sep="/")
        
        data <- read.csv(file_name)
        
        filtered <- data[data$ID %in% id, ]

        total <- rbind(total, filtered)
    }
    
    sprintf("%.3f", mean(total[[pollutant]], na.rm = TRUE))
}