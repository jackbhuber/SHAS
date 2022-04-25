recPoly <- function ( responseVector ){
  
  flevels <- sort( unique( as.vector( responseVector ) ) )
  flevels <- flevels[ !is.na( flevels ) ]
  
  ncat <- length(flevels)
  
  temp01 <- factor( responseVector, levels = flevels, labels = c( seq( 1:ncat ) ) )
  output <- as.numeric( as.character( temp01 ) ) - 1
  
  return( output )
  
}