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
for (spec in unique(iris$Species)) {
    print(mean(iris$Sepal.Length[iris$Species == spec]))
}

# - using tapply()
tapply(iris$Sepal.Length, iris$Species, mean)

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
# tapply() is about 40 times faster than the for loop


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
x <- seq(-pi,pi,length=100)
d <- data.frame(x,y=sin(x), z=cos(x), w=sin((x+3)/2), u=cos(x)*sin(x))
# Plot the columns of `d` in different colors against `x` using a for loop
plot(NULL, xlim=range(x), ylim=range(d), xlab="x", ylab="function")
for(i in seq_along(d)){
    lines(x, d[,i], col=i, lwd=3, lty=i)
}
legend("topleft", 
        legend=colnames(d), 
        col=seq_along(d), 
        lty=seq_along(d), 
        lwd=3,
        bty='n')

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Reading many files at once
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Using list.files(), find all the files in the "Data" folder that have the "sampleX_tempK_time-UNIT.csv" pattern.
# Hint: look at the pattern argument of list.files()

flist <- list.files(path="Data", pattern="sample", full.names = TRUE)

# Using a for loop, read all these files into a list of data.frames.
# Name the elements of this list with the file names without the extension.
# Hint: look at the basename() function

mylist <- list()
for (i in seq_along(flist)) {
    mylist[[i]]      <- read.csv(flist[i])
    names(mylist)[i] <- flist[i] |> basename() |> sub("\\.csv", "", x=_)
}
mylist

# Using a for loop, read all these files into a single tidy data.frame containing all the data from the list stacked on top of each other. 
# Add a column with the file name.
# Hint: look at the rbind() function

mylist2 <- data.frame()
for (f in flist) {
    temp      <- read.csv(f)
    temp$file <- f |> basename() |> sub("\\.csv", "", x=_)
    mylist2   <- rbind(mylist2, temp)
}
mylist2

# Using lapply() and read.csv(), read all these files into a list of data.frames. 
# Name the elements of this list with the file names without the extension.
# Hint: look at the basename() function
mylist3 <- lapply(flist, read.csv)
names(mylist3) <- flist |> basename() |> gsub("\\.csv", "", x=_)
mylist3$sample1_800K_20min

# Do the same using Map() and read.csv()
mylist4 <- Map(read.csv, flist)
mylist4[[1]]

# Do the same using purrr::map() and read.csv()
flist |> purrr::map(read.csv)

# Using do.call() and rbind(), create a single tidy data.frame containing all the data from the list stacked on top of each other. 
# Hint: look at the do.call() function
d <- do.call(rbind, mylist4)
# Add a column with the file name.
# Hint2: look at the row.name() function
d$file <- row.names(d)
row.names(d) <- NULL # delete the row names
d$file <- sub(".csv\\..*", "", d$file) # remove file extension and number from the file column
head(d)









# Advanced: using the tidyverse (see URFIST R class #2 in 3 weeks)
mylist6 <- tibble(flist) |> 
    mutate(data = map(flist, read.csv)) |> 
    unnest(data)







