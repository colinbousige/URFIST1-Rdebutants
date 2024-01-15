# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# #        Writing a for loop and methods for avoiding loops          # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Just for Colin, do not run:
# server = livecode::serve_file()

# Let's take a look at `iris` again:
# Compute the average sepal length for each species:
# - using a for loop


# - using tapply()



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
x <- seq(-pi,pi,length=100)
d <- data.frame(x,y=sin(x), z=cos(x), w=sin((x+3)/2), u=cos(x)*sin(x))
# Plot the columns of `d` in different colors against `x` using a for loop
plot(___)
for(___){
    ___
}

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Reading many files at once
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Using list.files(), find all the files in the "Data" folder that have the "sampleX_tempK_time-UNIT.csv" pattern.
# Hint: look at the pattern argument of list.files()

flist <- list.files(___)

# Using a for loop, read all these files into a list of data.frames.
# Name the elements of this list with the file names without the extension.
# Hint: look at the basename() function

mylist <- list()
for (i in seq_along(___)) {
    mylist[[i]]      <- ___
    names(mylist)[i] <- ___
}
mylist

# Using a for loop, read all these files into a single tidy data.frame containing all the data from the list stacked on top of each other. 
# Add a column with the file name.
# Hint: look at the rbind() function

mylist2 <- data.frame()
for (f in flist) {
    temp      <- ___
    temp$file <- ___
    mylist2   <- ___
}
mylist2

# Using lapply() and read.csv(), read all these files into a list of data.frames. 
# Name the elements of this list with the file names without the extension.
# Hint: look at the basename() function
mylist3 <- lapply(___, ___)
names(mylist3) <- ___
mylist3$sample1_800K_20min.csv

# Do the same using Map() and read.csv()
mylist4 <- Map(___, ___)
mylist4[[1]]

# Using do.call() and rbind(), create a single tidy data.frame containing all the data from the list stacked on top of each other. 
# Hint: look at the do.call() function
d <- do.call(___, ___)
# Add a column with the file name.
# Hint2: look at the row.name() function
d$file <- ___
row.names(d) <- NULL # delete the row names
d$file <- sub(".csv.*", "", d$file) # remove file extension and number from the file column
head(d)












microbenchmark::microbenchmark(
    for_loop = {
        species <- unique(iris$Species)
        for (spec in species) {
            mean(iris$Sepal.Length[iris$Species == spec])
        }
    },
    tapply = {
        tapply(iris$Sepal.Length, iris$Species, mean)
    },
    times = 100
)
