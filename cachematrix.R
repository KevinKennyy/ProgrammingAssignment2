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

Ejemplo de uso
A continuación, te muestro un ejemplo de cómo usar estas funciones:
# Crea una matriz invertible
my_matrix <- matrix(c(2, 1, 1, 2), nrow = 2, ncol = 2)

# Crea el objeto "matriz" especial usando makeCacheMatrix
cached_matrix <- makeCacheMatrix(my_matrix)

# Calcula y almacena en caché la inversa usando cacheSolve
inverse_matrix <- cacheSolve(cached_matrix)

# Muestra la inversa
print(inverse_matrix)

# Llama a cacheSolve nuevamente para obtener la inversa desde la caché
inverse_matrix <- cacheSolve(cached_matrix)

# Muestra la inversa desde la caché
print(inverse_matrix)

La primera llamada a cacheSolve calculará y almacenará en caché la inversa de la matriz. 
La segunda llamada recuperará la inversa desde la caché sin necesidad de recalcularla, mostrando el mensaje "getting cached data".
