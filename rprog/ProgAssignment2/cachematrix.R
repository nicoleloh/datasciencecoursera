## Matrix inversion is normally a costly computation. 
## The following functions will cache the inverse of a matrix, so that it can be 
## lookuped again instead of recomputing it thus minimizing costly computation. 
## The functions have been tested on square matrix
## (eg. "x <- matrix(1:4,2,2)")

## This makeCacheMatrix function do the following:-
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse matrix 
## 4. get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    matx <- NULL
    set <- function(y) {
        x <<- y
        matx <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) matx <<- inverse
    getinverse <- function() matx    
    list(set = set,
         get = get, 
         setinverse = setinverse, 
         getinverse = getinverse)
}

## This function, cacheSolve checks to see if an inverse matrix has been calculated.
## It gets the inverse matrix from the cache if it's already computed 
## (assuming the matrix did not change). 
## Otherwise, the function calculates the inverse matrix and cache it

cacheSolve <- function(x, ...) {
    matx <- x$getinverse()
        if(!is.null(matx)) {
        message ("get data from cache")
        return(matx)
    }
    data <- x$get()
    matx <- solve(data)
    x$setinverse(matx)
    matx   ## Return a matrix that is the inverse of 'x'
}