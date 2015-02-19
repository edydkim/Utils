rankall <- function(outcome, num = "best") {
    df <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
    
    outcome <- gsub(" ", ".", outcome)
    
    if (length(grep(outcome, colnames(df), ignore.case = TRUE)) == 0) stop("invalid outcome")
    
    mortality <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    target_colname<-mortality[grep(outcome, tolower(mortality))]

    pos = match(target_colname, colnames(df))
    
    df[, pos] <- as.numeric(df[, pos])
    
    target <- tapply(df[, pos], df$State, function(elm) {
        if (num == "best")  num <- 1
        else if (num == "worst") num <- length(sort(elm))
        value_ranked <- as.double(sort(elm))[num]; }
    )
    
    res <- matrix(, ncol = 2)
    for (s in unique(df$State)) {
        states <- df[df$State == s, ]
        idxs <- which(states[, pos] == target[s]);
        hn <- sort(states[idxs, "Hospital.Name"])[1];
        res <- rbind(res, c(hn, s))
    }
    
    colnames(res) <- c("hospital", "state")
    res <- as.data.frame(res)
    
    order.pop <- order(res$state)
    res[order.pop, ]
}
