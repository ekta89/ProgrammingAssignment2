## overall description of what the functions do
## The first function, makeCacheMatrix creates a special "matrix", which is really a matrix containing a function to
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse
## get the value of the inverse

## makeCacheMatrix function creates a special "matrix" object that can cache its
## inverse.

makeCacheMatrix <- function(x = matrix()) {
    
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
    setinverse = setinverse,
    getinverse = getinverse)
    

}

##  The following function calculates the inverse of the special "matrix" created
##  with the above function. However, it first checks to see if the inverse has
##  already been calculated. If so, it gets the inverse from the cache and skips
##  the computation. Otherwise, it calculates the inverse of the matrix and sets
##  the value of the inverse in the cache via the setinverse function.



cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        m <- x$getinverse()
        if(!is.null(m)) {
            message("getting cached data")
            return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
        
}
