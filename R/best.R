best <- function(state, outcome) {
    data <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
    
    outcome <- gsub(" ", ".", outcome)
    
    if (length(data[state %in% data$State]) == 0) stop("invalid state")
    if (length(grep(outcome, colnames(data), ignore.case = TRUE)) == 0) stop("invalid outcome")
    
    mortality <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    target_colname<-mortality[grep(outcome, tolower(mortality))]
    
    target_rows <- data[data$State == state,]
    
    min_idx = which.min(target_rows[, target_colname])
    
    res <- target_rows[min_idx, "Hospital.Name"]
    
    sort(res[1])[1]
}