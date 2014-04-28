## Put comments here that give an overall description of what your
## functions do

## Makes a cache copy of matrix as a 
## list that includes the matrix and its inverse

makeCacheMatrix <- function(x = matrix()) {
  
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
    
    
  }
  
  get <- function() x
  
  set_cachemat <- function(inv) m <<- inv 
  get_cachemat <- function() m
  list(set = set, get = get,
       set_cachemat =  set_cachemat,
       get_cachemat = get_cachemat)
  
}



## function for creating an instance of a matrix that
## calculates its inverse only if no instance in cached data already

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$get_cachemat()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$set_cachemat(m)
  m
}
