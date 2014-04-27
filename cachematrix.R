## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
        
        
    }
    
    get <- function() x
    
    set_cachemat <- function(solve) m <<- inv #<<-mean
    get_cachemat <- function() m
    list(set = set, get = get,
         set_cachemat =  set_cachemat,
         get_cachemat = get_cachemat)
    
}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$get_cachemat()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$set_cachemat(inv)
    inv
}

m <- matrix( c(2, 4, 3, 1, 5, 7,6,6,5), nrow=3,  ncol=3) 
m_inv <-solve(m)