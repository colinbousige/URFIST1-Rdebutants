# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# #                      Structure of data in R                       # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Just for Colin, do not run:
# server = livecode::serve_file()

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Numerical data (integer, double, complex, etc.)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Attribute to `x` the value `2.5`, and compute the cosinus of the exponential of its squared value:
# R can be used as a calculator, but it's not its main purpose!

x <- ___
___

# Assuming the `x` and `y` defined below, modify the following code so that it does not return an error:

x <- "100.3"
y <- 99.6
floor(x) - ceiling(y)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Booleans (TRUE/FALSE) and logical tests (==, !=, >, <, >=, <=)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Let's define two random variables `x` and `y`. Are the two variables equal? which one is smaller?

x <- runif(1)
y <- runif(1)
___ # write the test here

# Using the `if(){}else{}`{.R} syntax, print "x is larger than y", "x is equal to y", or "x is smaller than y".

if (test) {
    # what to do if TRUE?
} else if (other test) {
    # what to do if TRUE?
} else {
    # what to do in any other case?
}

# Using the `ifelse()`{.R} function, print "x is larger or equal to y" or "x is smaller than y".

ifelse(what do we need to test?, 
       what to do if TRUE?, 
       what to do if FALSE?) 



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Strings (character) and concatenation (paste0(), paste(), str_c())
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Save your name as a string in a variable, and print "My name is: yourname" using this variable.

name <- ___
paste(___, ___)

# Is your name "Martin" or "martin"? Test if `name` is equal to "martin"
# you may use `tolower()` to make sure that `name` is in lower case

___

# Replace all "e" by "A" in the following string:

x <- "aaaeebbbeebiieelakdceee"
gsub(___, ___, ___)

# Do the same using the `stringr` function `str_replace_all()` 
# Take a look at the cheatsheet here : https://github.com/rstudio/cheatsheets/blob/main/strings.pdf

library(stringr)
str_replace_all(___, ___, ___)

# Using the `str_detect()` function from the `stringr` package, test if the string `x` contains the letter "e":



# Using the `str_remove_all()` function from the `stringr` package, remove all "e" from the string `x`:




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Vectors
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Consider two vectors `x` and `y` such as:
x <- 1:5
y <- seq(0, 4, along=x)

# Without typing it into Rstudio, what are the values of `x`, `y`, and `x*y`?


# Consider two vectors `a` and `b` such as:

a <- c(1, 5, 4, 3, 6)
b <- c(3, 5, 2, 1, 9)

# Without typing it into Rstudio, what is the value of: `a<=b`?


# If 
x <- c(1:12, NA, 5:2)
# Without typing it into Rstudio, what is the value of: `length(x)`


# If 
a <- 12:5
# Without typing it into Rstudio, what is the value of: `is.numeric(a)`


# Consider two vectors `x` and `y` such as:
x <- 12:4
y <- c(0, 1, 2, 0, 1, 2, 0, 1, 2)
# Without typing it into Rstudio, what is the value of: `which(!is.finite(x/y))`?


# If 
x <- c('blue', 'red', 'green', 'yellow')
# Without typing it into Rstudio, what is the value of: `is.character(x)`?


# If 
x <- c('blue', 10, 'green', 20)
# Without typing it into Rstudio, what is the value of: `is.character(x)`?


# Assign value 5 to the variable x.
# Is there a difference between `1:x-1` and `1:(x-1)` ?
# Explain.


# Generate the sequence `9, 18, 27, 36, 45, 54, 63, 72, 81, 90` in 4 different manners.
c(___)
seq(___)
___:___
___

# Let `a <- c(2, 4, 6, 8)` and `b <- c(TRUE, FALSE, TRUE, FALSE)`.
# Without typing it into Rstudio, what will be the output for the R expression `max(a[b])`?


# Using `plot(x,y)` and `lines(x,y)`, plot the following functions for `x` in `[-10, 10]`:
# y = sin(x)/x as blue points
# y = cos(x) as red line
# play on the `ylim` parameter to see all data in the plot
# add a legend to the plot
x <- ___
plot(___, ___, col = "blue", ylim = ___)
lines(___)
legend("topleft",
       pch = c(1,NA),
       lty = c(NA,1),
       col = c("blue", "red"),
       legend = c("sin(x)/x", "cos(x)")
       )

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# We have the following `x` vector: `x <- c("10K", "100K", "200K", "500K", "1000K")`. 
# Get rid of the  `"K"` character and turn this into a numerical vector.
# Hint: Use gsub() or str_remove_all(), and as.numeric()
x <- c("10K", "100K", "200K", "500K", "1000K")



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# We have the following `times` vector: `times <- c("010_min", "100_sec", "200_sec", "050_min")`
# We want a numerical vector containing times in seconds only.
# Using `substr()`, create 2 vectors `times_values` and `times_units` containing the numbers and the units from `times`.

times <- c("010_min", "100_sec", "200_sec", "050_min")
times_values <- substr(string, start, stop)
times_units  <- ___

# You could do the same using `strsplit()`, which returns a list, and then using `unlist()`
strsplit("test", "e")
unlist(strsplit("test", "e"))
# Or, using the pipe operator `|>` and `sapply()`:
strsplit("test", "e") |> 
    sapply("[", 1)
strsplit("test", "e") |> 
    sapply("[", 2)

# Now, using `ifelse(test, yes, no)`, create the `times_sec` vector containing the numerical values of time all converted to seconds.

times_sec <- ifelse(test, yes, no)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Let's say we have these population data for these cities for year 2012:
cities <- c("Angers", "Bordeaux", "Brest", "Dijon", "Grenoble", "Le Havre")
pop <- c(149017, 241287, 139676, 152071, 158346, 173142)

# Use `names()` to name values of `pop` with the corresponding cities. 
# Print the vector again. Are there any change?
names(pop) <- ___

# What is the population of the second city? What is the name of the second city?


# What are the cities with more than 200000 people? Save the list of these cities into a vector named `cities200k`. 

cities200k <- cities[___]
cities200k

# Sort the `pop` vector by decreasing order of population
sorted_pop <- sort(___, ___)

# What is the maximum population? What is the city with the maximum population?
max(___)
___[___]

# What is the population of two most populated cities?


# Compute the population mean over all cities


# Compute the population standard deviation over all cities


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Data types : categorical (factor), numerical, booleans, strings, dates, etc.
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

passenger <- c('male','male','female','male','female','female','female','male','male')

# What is the data type of `passenger`?

# Make passenger a vector of categorical data with `factor()`, save it in `passenger_fct`

# What is the number of levels of `passenger_fct`?

# What are the levels of `passenger_fct`?

# Using `table()`, count the occurrences of each level of `passenger_fct`

# Using `as.numeric()`, convert `passenger_fct` to a numerical vector. 
# What are its values?

# See and understand what the following lines do:
passenger == "male"
passenger[passenger == "male"]
females <- which(passenger == "female")
passenger[females]
"female" %in% passenger
"child" %in% passenger
! "child" %in% passenger

# Dates:
# See and understand what the following lines do:
Sys.Date()
start <- Sys.time()
end <- Sys.time()
difftime(end, start, units = "hours")

library(hms)
as_hms(difftime(end, start))

library(lubridate)
time_length(Sys.Date() - dmy("22-09-1986"), unit="years")
Sys.Date() + months(1) + years(1)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Table of data: data.frame()
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Create a 3 column `data.frame` called `df` containing three columns `x`, `y` and `z` with:

# - `x` a vector from -pi to pi of length 10
# - `y` the sinus of `x`
# - and `z` the sum of the two first columns.

x <- ___
y <- ___
z <- ___
df <- data.frame(___)

# Print the dimensions of the table df.
# Hint: Take a look at the dim() function


# Print the structure of the table df.
# Hint: Take a look at the str() function


# Print the 4 first lines of the table df.
# Hint: Take a look at the head() function


# Print the second column (*i.e.* `y`) with three different methods.

df[___]
df[___]
df$___

# Access the third line of the table df.
df[___]

# Access the third element of the column `z` in 2 different manners.
df[___]
df$___

# Modify the column `z` so that it contains its value minus its minimum.
# Hint: Take a look at the min() function


# Print the average of the `z` column.
# Hint: look at the mean() function


# Add a `signy` column to the table `df` containing "y positive" or "y negative".
# Hint: Take a look at the ifelse() function


# Create a subset `df2` of `df` that contain all `df` lines where `z` is positive and just the `z` and `x` columns, using 3 different manners.
df2 <- df[___,___]
df2 <- subset(___, ___, ___)
df2 <- df |> subset(___, ___)

# Using `plot(x,y)` where `x` and `y` are vectors, plot the 2nd column as a function of the first.
plot(___, ___)


# Change the column names of `df` to `x`, `sin`, `x_plus_sin` and `signy`.
# Hint: Take a look at the colnames() function


# Look into the functions `write.table()` and `write.csv()` to write a text file containing this `data.frame`.
write.table(___)
write.csv(___)
