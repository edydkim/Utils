corr <- function(directory, threshold = 0) {
    total <- c()
    agg <- 0
    sampling <- 0
    select <- c(1:332)
    
    temp <- complete(directory, select)
    temp <- temp[!is.na(temp$nobs) & temp$nobs > threshold, ]
    for(i in temp$id) {     
        file_name <- sprintf("%03d.csv", i)
        file_name <- paste(directory, file_name, sep="/")
        
        data <- read.csv(file_name)
        total <- rbind(total, cor(data$nitrate, data$sulfate, use="complete.obs"))
    }
    
    as.vector(total)
}
