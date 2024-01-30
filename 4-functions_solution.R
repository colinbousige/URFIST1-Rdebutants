# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# #                  Writing and using functions                      # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Just for Colin, do not run:
# server = livecode::serve_file()

# # # # # # # # # # 
# Exercise 1
# # # # # # # # # # 

# Write a function that computes the geometric mean of two values, sqrt(a*b).
# - Make it so that the second parameter has a default value of 1
# - Add error handling: 
#    - check that the provided parameters are numeric, exit with a meaningful error message otherwise
#    - check that the provided parameters have the same length or of length 1:
#       - if at least one parameter has length 1, show a warning message but continue with the function
#       - exit with a meaningful error message otherwise
# Hint: see `warning("Message")` and `stop("Message")`
geom_mean <- function(x, y=1){
    stopifnot(is.numeric(x), is.numeric(y))
    if(length(x) != length(y)){
        if(length(x) == 1){
            warning("x has length 1, it will be repeated to length(y)")
        } else if(length(y) == 1){
            warning("y has length 1, it will be repeated to length(x)")
        } else {
            stop("x and y must have the same length")
        }
    }
    return(sqrt(x*y))
}
# Test it:
geom_mean("a", 2)
geom_mean(1, 2)
geom_mean(1:2, 2)
geom_mean(1:2, 2:3)

# # # # # # # # # # 
# Exercise 2
# # # # # # # # # # 

# Create the sinus cardinal function, returning:
#  f(x) = sin(x)/x for x ≠ 0, and f(0) = 1.
# Hint: 
# - use a tolerance parameter
# - the function needs to be vectorized
# - add error handling: x needs to be a numerical vector or exit with a meaningful message.

sinc <- function(x, tol=1e-5){
    stopifnot(is.numeric(x))
    y <- sin(x)/x
    y[abs(x) < tol] <- 1
    return(y)
}

# Test it:
x <- seq(-6*pi,6*pi,.01)
plot(x, sinc(x))

# # # # # # # # # # 
# Exercise 3
# # # # # # # # # # 

# Write a function that will have two parameters: `filename` and `plot`.
# - `filename` is the path to a file of the type of `Data/ATG.txt` (give this as default)
# - `plot` is a boolean, defaulting to FALSE
# - add error handling: 
#     - `plot` needs to be a boolean (is.logical()?) or exit
#     - `filename` needs to lead to an existing file or exit (file.exists()?)
# If `plot` is FALSE, the function returns a tibble with only the following columns:
# - the read temperature (Tr column)
# - the weight (Value column)
# - filtered to contain only times at which the temperature is increasing
# If `plot` is TRUE, the function does the above operations and then outputs a nice plot of the weight as a function of the measured temperature, with proper labels, etc.
# 
# Also, add the proper function documentation. Place the cursor inside the function, 
# then go to Code > Insert Roxygen Skeleton and fill the fields.

#' @title Read ATG
#' @description This function reads an ATG file, filters the data, and optionally plots the data.
#' @param filename A string representing the path to the ATG file. Default is "Data/ATG.txt".
#' @param plot A logical value indicating whether to plot the data. Default is TRUE.
#' @return A tibble containing the filtered data from the ATG file.
#' @examples
#' \dontrun{
#' read_ATG("Data/ATG.txt", plot = TRUE)
#' }
#' @export
read_ATG <- function(filename="Data/ATG.txt", plot=TRUE){
    stopifnot(is.logical(plot))
    stopifnot(file.exists(filename))
    header_lines <- 10
    total_lines <- R.utils::countLines(filename)[1]
    lines_to_read <- total_lines - 50 - header_lines - 2 
    atg <- read.table(filename, 
                      skip = header_lines, 
                      header=TRUE,
                      comment.char = "[",
                      nrows = lines_to_read)
    increasing <- diff(atg$Tr) > 0
    atg <- atg[increasing, c("Tr", "Value")]
    if(plot){
        plot(atg$Tr, atg$Value, 
             xlab="Temperature [˚C]", ylab="Weight [mg]")
    }
    return(tibble::tibble(atg))
}

# Test it:
read_ATG()
read_ATG(plot=FALSE)


