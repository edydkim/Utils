ext <- function(x = list(), ...) {
   now <- 53.4
   dec <- rnorm(90, sd=1.5)
   goal <- 51
   day <- 1
   
   f_diff <- function() {
        diff_ <- vector()
        for (i in 1:90) {
            diff_ <- c(diff_, now - dec[i])
        }
        diff_
   }

   par(pch=22, col="red") 
    
    plot(c(1:90), f_diff(), type="n", main = "In 3 months",  xlab="days"
         , ylab="Weight (kg)")
    lines(c(1:90), f_diff(), type="b", lwd=1.5)
    
   f_diff()
}

fin <- ext()
summary(fin)
names(fin) <- c("day", "weight")
length(fin[fin <= 51]) / 90 * 100
length(fin[fin > 53]) / 90 * 100