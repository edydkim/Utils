rankhospital <- function(state, outcome, num = "best") {
    df <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
    
    outcome <- gsub(" ", ".", outcome)
    
    best(state, outcome)
    
    mortality <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    target_colname<-mortality[grep(outcome, tolower(mortality))]
    
    target_rows <- df[df$State == state,]
    
    target_rows[, target_colname] <- as.numeric(target_rows[, target_colname])
    
    pos = match(target_colname, colnames(target_rows))
    
    if (num == "best")  num <- 1
    else if (num == "worst") num <- length(target_rows[!is.na(target_rows[, pos]), target_colname])
    
    value_ranked <- sort(target_rows[, target_colname])[num]
    
    idxs = which(target_rows[, target_colname] == value_ranked)
    
    res <- target_rows[idxs, "Hospital.Name"]
    
    sort(res[1])[1]
}
