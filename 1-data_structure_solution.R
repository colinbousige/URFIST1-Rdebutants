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

x <- 2.5
cos(exp(x^2))

# Assuming the `x` and `y` defined below, modify the following code so that it does not return an error:

x <- "100.3"
y <- 99.6
floor(as.numeric(x)) - ceiling(y)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Booleans (TRUE/FALSE) and logical tests (==, !=, >, <, >=, <=)
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Let's define two random variables `x` and `y`. Are the two variables equal? which one is smaller?

x <- runif(1)
y <- runif(1)
x<y # write the test here

# Using the `if(){}else{}`{.R} syntax, print "x is larger than y", "x is equal to y", or "x is smaller than y".

if (x > y) {
    "x is larger than y"
} else if (x == y) {
    "x is equal to y"
} else {
    "x is smaller than y"
}

# Using the `ifelse()`{.R} function, print "x is larger or equal to y" or "x is smaller than y".

ifelse(x>=y, "x is larger or equal to y", "x is smaller than y")



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Strings (character) and concatenation (paste0(), paste(), str_c())
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Save your name as a string in a variable, and print "My name is: yourname" using this variable.

name <- "Colin"
paste("My name is:", name)

# Is your name "Martin" or "martin"? Test if `name` is equal to "martin"
# you may use `tolower()` to make sure that `name` is in lower case

tolower(name) == "martin"

# Replace all "e" by "A" in the following string:

x <- "aaaeebbbeebiieelakdceee"
gsub("e", "A", x)

# Do the same using the `stringr` function `str_replace_all()`
# Take a look at the cheatsheet here : https://github.com/rstudio/cheatsheets/blob/main/strings.pdf

library(stringr)
str_replace_all(x, "e", "A")

# Using the `str_detect()` function from the `stringr` package, test if the string `x` contains the letter "e":
x |> str_detect('e')

# Using the `str_remove_all()` function from the `stringr` package, remove all "e" from the string `x`:

x |> str_remove_all('e')



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
c(9, 18, 27, 36, 45, 54, 63, 72, 81, 90)
seq(9, 90, by = 9)
seq(9, 90, length=10)
1:10 * 9
seq(1,10,1) * 9

# Let `a <- c(2, 4, 6, 8)` and `b <- c(TRUE, FALSE, TRUE, FALSE)`.
# Without typing it into Rstudio, what will be the output for the R expression `max(a[b])`?


# Using `plot(x,y)` and `lines(x,y)`, plot the following functions for `x` in `[-10, 10]`:
# y = sin(x)/x as blue points
# y = cos(x) as red line
# play on the `ylim` parameter to see all data in the plot
# add a legend to the plot
x <- seq(-10, 10, length.out = 100)
plot(x, sin(x)/x, col = "blue", ylim = c(-1,1), pch=16)
lines(x, cos(x), col = "red")
legend("topleft",
       bty = "n",
       pch = c(16,NA),
       lty = c(NA,1),
       col = c("blue", "red"),
       legend = c("sin(x)/x", "cos(x)")
       )

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# We have the following `x` vector: `x <- c("10K", "100K", "200K", "500K", "1000K")`. 
# Get rid of the  `"K"` character and turn this into a numerical vector.
# Hint: Use gsub() or str_remove_all(), and as.numeric()
x <- c("10K", "100K", "200K", "500K", "1000K")
x |> str_remove_all("K") |> as.numeric()


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# We have the following `times` vector: `times <- c("010_min", "100_sec", "200_sec", "050_min")`
# We want a numerical vector containing times in seconds only.
# Using `substr()`, create 2 vectors `times_values` and `times_units` containing the numbers and the units from `times`.

times <- c("010_min", "100_sec", "200_sec", "050_min")
times_values <- substr(times, 1, 3) |> as.numeric()
times_units  <- substr(times, 5, 7)

# You could do the same using `strsplit()`, which returns a list, and then using `unlist()`
strsplit("test", "e")
unlist(strsplit("test", "e"))
# Or, using the pipe operator `|>` and `sapply()`:
strsplit("test", "e") |> 
    sapply("[", 1)
strsplit("test", "e") |> 
    sapply("[", 2)


times_values <- strsplit(times, "_") |> sapply("[", 1) |> as.numeric()
times_units <- strsplit(times, "_") |> sapply("[", 2)

# Now, using `ifelse(test, yes, no)`, create the `times_sec` vector containing the numerical values of time all converted to seconds.

times_sec <- ifelse(times_units=='sec', times_values, times_values*60)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Let's say we have these population data for these cities for year 2012:
cities <- c("Angers", "Bordeaux", "Brest", "Dijon", "Grenoble", "Le Havre")
pop <- c(149017, 241287, 139676, 152071, 158346, 173142)

# Use `names()` to name values of `pop` with the corresponding cities. 
# Print the vector again. Are there any change?
names(pop) <- cities
cities

# What is the population of the second city? What is the name of the second city?
pop[2]
names(pop[2])

# What are the cities with more than 200000 people? Save the list of these cities into a vector named `cities200k`. 

cities200k <- cities[pop<200e3]
cities200k

# Sort the `pop` vector by decreasing order of population
sorted_pop <- sort(pop, decreasing = TRUE)

# What is the maximum population? What is the city with the maximum population?
max(pop)
cities[which.max(pop)]

# What is the population of two most populated cities?
sorted_pop[1:2]

# Compute the population mean over all cities
mean(pop)

# Compute the population standard deviation over all cities
sd(pop)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Data types : categorical (factor), numerical, booleans, strings, dates, etc.
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

passenger <- c('male','male','female','male','female','female','female','male','male')

# What is the data type of `passenger`?
# it's a categorical vector, but it's not a factor yet

# Make passenger a vector of categorical data with `factor()`, save it in `passenger_fct`
passenger_fct <- factor(passenger)

# What is the number of levels of `passenger_fct`?
levels(passenger_fct) |> length() 

# What are the levels of `passenger_fct`?
levels(passenger_fct)

# Using `table()`, count the occurrences of each level of `passenger_fct`
table(passenger_fct)

# Using `as.numeric()`, convert `passenger_fct` to a numerical vector. 
# What are its values?
passenger_fct |> as.numeric()

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

x <- seq(-pi, pi, length.out = 10)
y <- sin(x)
z <- x + y
df <- data.frame(x, y, z)

# Print the dimensions of the table df.
# Hint: Take a look at the dim() function
dim(df)

# Print the structure of the table df.
# Hint: Take a look at the str() function
str(df)

# Print the 4 first lines of the table df.
# Hint: Take a look at the head() function
head(df, 4)

# Print the second column (*i.e.* `y`) with three different methods.

df[,2]
df[,'y']
df$y

# Access the third line of the table df.
df[3,]

# Access the third element of the column `z` in 2 different manners.
df[3,'z']
df$z[3]

# Modify the column `z` so that it contains its value minus its minimum.
# Hint: Take a look at the min() function
df$z <- df$z - min(df$z)

# Print the average of the `z` column.
# Hint: look at the mean() function
mean(df$z)

# Add a `signy` column to the table `df` containing "y positive" or "y negative".
# Hint: Take a look at the ifelse() function
df$signy <- ifelse(df$y > 0, "y positive", "y negative")

# Create a subset `df2` of `df` that contain all `df` lines where `z` is positive and just the `z` and `x` columns, using 3 different manners.
df2 <- df[df$z>0,c('z','x')]
df2 <- subset(df, z>0, select=c('z','x'))
df2 <- df |> subset(z>0, select=c('z','x'))

# Using `plot(x,y)` where `x` and `y` are vectors, plot the 2nd column as a function of the first.
plot(df$x, df$y)

# Change the column names of `df` to `x`, `sin` and `x_plus_sin`.
# Hint: Take a look at the colnames() function
names(df) <- c('x', 'sin', 'x_plus_sin', 'signy')

# Look into the functions `write.table()` and `write.csv()` to write a text file containing this `data.frame`.
write.table(df, file = "df.txt", quote = FALSE, row.names = FALSE)
write.csv(df, file = "df.csv", quote = FALSE, row.names = FALSE)
