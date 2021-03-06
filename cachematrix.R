## Questions regarding how to approach this assignment were asked on
## StackOverflow and amongst my friends. Though the work is my own.

## Matrix inversion is usually a costly computation and there may be 
## some benefit to caching the inverse of a matrix rather than 
## compute it repeatedly. The functions in the following operation 
## create a specific matrix which, as instructed, can cache 
## its inverse, and then solve the calculated inverse.

## makeCacheMatrix creates a special "matrix" object that 
## can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}


## cacheSolve computes the inverse of the special "matrix" returned 
## by makeCacheMatrix above. If the inverse has already been 
## calculated (and the matrix has not changed), then the cachesolve 
## should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}
