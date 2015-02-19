## Caching the Inverse of a Matrix
## Usage : value<-matrix(...), then cacheSolve(value)
## ex) tmatrix<-matrix(c(1:4), nrow = 2, ncol = 2);
##     imatrix<-makeCacheMatrix(tmatrix);
##     cacheSolve(imatrix);
## functions : makeCacheMatrix, cacheSolve
## created by edydkim, Jan/21/2015

## make a inverse matrix cached
makeCacheMatrix <- function(x = matrix()) {
    solved <- NULL
    
    set <- function(x_) {
        x <<- x_
        solved <<- NULL
    }
    get <- function() x
    setSolve <- function(solved_) solved <<- solved_
    getSolve <- function() solved
    list(set = set, get = get,
         setSolve = setSolve,
         getSolve = getSolve)
}

## get a inverse matrix using caching
cacheSolve <- function(x, ...) {
    solved <- x$getSolve()
    if(!is.null(solved)) {
        message("getting cached matrix inversed")
        return(solved)
    }
    data <- x$get()
    solved <- solve(data, ...)
    x$setSolve(solved)
    solved
}