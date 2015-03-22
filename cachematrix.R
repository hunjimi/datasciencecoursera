# initialization of the function which requires a matrix as argument
makeCacheMatrix <- function(x = matrix()) { 

# initialization of m to NULL
	m <- NULL
# create function "set". pass the matrix to x and reset m to NULL
	set <- function(y){
		x <<- y
		m <<- NULL
	}

# return cached matrix value
	get <- function() x

# reuires the solve value and asigns to m
	setmatrix <- function(solve) m <<- solve

# returns the cached m value
	getmatrix <- function() m

# lists all functions
	list(set = set, get = get, 
	     setmatrix = setmatrix, getmatrix = getmatrix)
}

# initialization of the function which requires a makeCacheMatrix object
cacheSolve <- function(x = matrix(), ...) {

# gets the matrix and asigns it to m
	m <- x$getmatrix()

# if m is not null it will return a message on the command line and returns the value of m
    	if(!is.null(m)){
      	message("getting cached data")
     		return(m)
    }

# the funcion retuns the matrix and asigns i to the variable matrix
    matrix <- x$get()

# calculates the solve value and assigns to m
    m <- solve(matrix, ...)

# sets m
    x$setmatrix(m)
    
# retuns a matrix whic is an inverse of x
    m
}