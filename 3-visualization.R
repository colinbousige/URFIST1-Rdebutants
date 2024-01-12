# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# #   Introduction to plot production with base plot and esquisse     # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Just for Colin, do not run:
# server = livecode::serve_file()

atg <- read.table("Data/ATG.txt", 
                  skip = 10, 
                  header=TRUE,
                  comment.char = "[",
                  nrows = 4088)
str(atg)

# Plot `Value` as a function of `t` with `plot()`.
# Change the axis labels to "Time [min]" and "Weight [mg]".
par(mar=c(5, 4, 4, 6) + 0.1)
plot(___)
# Now we will add the temperature read, `Tr`, as a second y-axis.
# We will plot it as a red line: fill the missing parts in the following code:
par(new = TRUE)
plot(___, ___, ___, ___, 
     axes=FALSE, xlab="", ylab="")
axis(4, col="red", col.axis="red", las=1)
mtext("Temperature [ºC]", side=4, col="red", line=4) 
# Add a legend using legend()
legend(___)


# # # # # # # # # # # # # # # # # # # # # # # # # 

# Let's use the following data:
d <- data.frame(A=rnorm(100, sd=.2),
                B=rnorm(100, mean=2, sd=.3),
                C=rnorm(100, mean=4, sd=.5))
# How would you plot it?
# Look into the options of `plot()` to get the proper data fields.
# Add a legend using legend()
# Also look into hist(), density(), boxplot()...



# # # # # # # # # # # # # # 
dd <- reshape(d,
              direction="long", varying=1:3, v.names="value", 
              timevar = "sample", times = c("A","B","C"))
# Using esquisse, play with the different options to plot the data.
esquisse::esquisser(dd)


# # # # # # # # # # # # # # # # # # # # # 
# Let's use the R data `iris`:
iris
# How would you plot it?
plot(___)
boxplot(___ ~ ___)
esquisse::esquisser(iris)
