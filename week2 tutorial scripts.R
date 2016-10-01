add2 <- function(x,y){
        x + y
}
Above10 <- function(x){
        use <- x > 10 ## creates a vector called use with t/f for whether each element in x is greater than 10  
        x[use] ##show the subset of x for which use is true, ie which is greater than 10
}

above <- function(x,n = 10){ ##note that you wrote fucntion here and it messed everything up ## n = 10 in definition of function sets default value for n
        use <- x > n
        x[use]
}

columnmean <- function(y, removeNA = TRUE ) {
        nc <- ncol(y) ## stores number of columns
        means <- numeric(nc) ## intialize a numeric vector of length equal to the number of columns
        for(i in 1:nc) {
                means[i] <- mean(y[, i], na.rm = removeNA) ##make the ith item in means the mean of the subset of y in column i ##na.rm is an argument in the means functions which tells it to ignore NAs
        }
        means
}    

