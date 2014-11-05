#  welchEMJ
#' Function for calculating Welch's t-test given pairs of means, SDs, and Ns. If vectors are input, the 
#' first element of each of the mean vectors will be compared, then
#' the second element, and so on.
#' 
#' @param m1 First mean (may be a vector)
#' @param m2 Second mean
#' @param s1 First standard deviation
#' @param s2 Second standard deviation
#' @param n1 First N
#' @param n2 Second N
#' 
#' @export
#' @return Data frame containing t, df, and p for each comparison performed.
#' 
#' @examples
#' welchEMJ(0,1,1,2,100,150) # Single comparison
#' welchEMJ(c(0,0),c(0.5,1),c(1,1),c(2,2),c(100,100),c(150,150)) # Two comparisons
#' 
#' @seealso \code{\link{CourseEvalTable}}
#' @keywords Welch, t-test

welchEMJ <- function(m1, m2, s1, s2, n1, n2)
{
  if(length(m1)!=length(m2) |
       length(m1)!=length(s1) |
       length(m1)!=length(s2) |
       length(m1)!=length(n1) |
       length(m1)!=length(n2)) {print("FAIL")}
  
  else {
    
    output <- data.frame(matrix(NA,length(m1),3))
    colnames(output) <- c("t","df","p")
    for (i in 1:length(m1))
    {
      mx <- m1[i]
      my <- m2[i]
      vx <- (s1[i])^2
      nx <- n1[i]
      vy <- (s2[i])^2
      ny <- n2[i]
      
      sample.t <- (mx-my)/sqrt(sum(vx/nx,vy/ny))
      
      stderrx <- sqrt(vx/nx)
      stderry <- sqrt(vy/ny)
      stderr <- sqrt(stderrx^2 + stderry^2)
      sample.df <- stderr^4/(stderrx^4/(nx - 1) + stderry^4/(ny - 1))
      p <- 2*pt(abs(sample.t),sample.df,lower.tail=FALSE)
      output[i,] <- cbind(t=sample.t,df=sample.df,p=p)
    }
    return(output)
  }  
}