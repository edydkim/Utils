complete <- function(directory, id = 1:332) {
    temp <- data.frame()
    total <- data.frame()
    
    for(i in 1:332) {
        file_name <- sprintf("%03d.csv", i)
        file_name <- paste(directory, file_name, sep="/")
        
        data <- read.csv(file_name)
        
        filtered <- data[data$ID %in% id & !is.na(data$sulfate) & !is.na(data$nitrate), ]
        
        temp <- rbind(temp, filtered)
    }
    
    for (j in id) {        
        total <- rbind(total, c(j, nrow(temp[temp$ID == j,])))
    }
    
    names(total) <- c("id", "nobs")
    total
}
