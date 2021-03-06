
# Entropy Distance
#
# Argument: a matrix or data table containing at least 2 rows and 2 cols 

dist.entropy = function(x) {

    # test if the input dataset is acceptable
    if(is.matrix(x) == FALSE & is.data.frame(x) == FALSE) {
        stop("cannot apply a distance measure: wrong data format!")
    }
    # then, test whether the number of rows and cols is >1
    if(length(x[1,]) < 2 | length(x[,1]) < 2) {
        stop("at least 2 cols and 2 rows are needed to compute a distance!")
    }

    A = t(t(x + 1) / colSums(x + 1))
    B = t(t(log(x + 2)) / -(colSums(A * log(A))))
    y = dist(B, method="manhattan")

    return(y)
}
