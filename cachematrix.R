## Put comments here that give an overall description of what your
## functions do

Función makeCacheMatrix

Esta función crea un objeto "matriz" especial que puede almacenar en caché su inversa. El objeto es en realidad una lista que contiene funciones para:

        - Establecer el valor de la matriz.
        - Obtener el valor de la matriz.
        - Establecer el valor de la inversa de la matriz.
        - Obtener el valor de la inversa de la matriz.

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL  # Inicializa el caché de la inversa como NULL
  
  # Función para establecer el valor de la matriz
  set <- function(y) {
    x <<- y  # Asigna la nueva matriz
    inv <<- NULL  # Resetea la inversa porque la matriz ha cambiado
  }
  
  # Función para obtener el valor de la matriz
  get <- function() {
    x
  }
  
  # Función para establecer el valor de la inversa
  setInverse <- function(inverse) {
    inv <<- inverse
  }
  
  # Función para obtener el valor de la inversa
  getInverse <- function() {
    inv
  }
  
  # Retorna una lista con las funciones definidas
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function
Función cacheSolve
Esta función calcula la inversa de la "matriz" especial devuelta por makeCacheMatrix. 
Si la inversa ya ha sido calculada (y la matriz no ha cambiado), entonces cacheSolve recupera la inversa de la caché.


cacheSolve <- function(x, ...) {
  inv <- x$getInverse()  # Intenta obtener la inversa de la caché
  
  # Si la inversa ya está en la caché, la retorna
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  
  # Si la inversa no está en la caché, calcula la inversa
  mat <- x$get()  # Obtiene la matriz original
  inv <- solve(mat, ...)  # Calcula la inversa
  x$setInverse(inv)  # Almacena la inversa en la caché
  
  inv  # Retorna la inversa calculada
}
