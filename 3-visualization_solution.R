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
plot(atg$t, atg$Value, type="l", lwd=2,
     xlab="Time [min]", ylab="Weight [mg]")
# Now we will add the temperature read, `Tr`, as a second y-axis.
# We will plot it as a red line: fill the missing parts in the following code:
par(new = TRUE)
plot(atg$t, atg$Tr, type="l", col="red",
     axes=FALSE, xlab="", ylab="")
axis(4, col="red", col.axis="red", las=1)
mtext("Temperature [ºC]", side=4, col="red", line=4) 
# Add a legend using legend()
legend("top", legend=c("Weight", "Temperature"), 
       col=c("black", "red"), lty=1, lwd=2, bty="n")


# # # # # # # # # # # # # # # # # # # # # # # # # 

# Let's use the following data:
d <- data.frame(A=rnorm(100, sd=.2),
                B=rnorm(100, mean=2, sd=.3),
                C=rnorm(100, mean=4, sd=.5))
# How would you plot it?
# Look into the options of `plot()` to get the proper data fields.
# Add a legend using legend()
# Also look into hist(), density(), boxplot()...

# Scatter plot
plot(d$A, d$B, col="red", xlim=c(-1,1), ylim=c(0,6), xlab="A", ylab="y", pch=16)
points(d$A, d$C, col="royalblue", pch=16)
legend("topright", legend=c("B", "C"), 
       col=c("red", "royalblue"), pch=16, bty="n")

# Density
plot(density(d$A), 
     col="red", xlab="Value", ylab="Density", 
     xlim=c(-1,6), ylim=c(0,2))
lines(density(d$B), col="royalblue")
lines(density(d$C), col="orange")
legend("topright", legend=c("A", "B", "C"), 
       col=c("red", "royalblue", "orange"), lty=1, lwd=2, bty="n")

# Density 2D
smoothScatter(d$A, d$B, colramp=colorRampPalette(c(NA, "red")), xlim=c(-1,1), ylim=c(0,6))
smoothScatter(d$A, d$C, colramp=colorRampPalette(c(NA, "blue")), add=TRUE)

# Histogram
hist(d$A, col="red", xlim=c(-1,6), ylim=c(0,15), breaks=20, xlab="Value", ylab="Frequency")
hist(d$B, col="royalblue", xlim=c(-1,6), ylim=c(0,40), breaks=20, add=TRUE)
hist(d$C, col="orange", xlim=c(-1,6), ylim=c(0,40), breaks=20, add=TRUE)
legend("topright", legend=c("A", "B", "C"), 
       col=c("red", "royalblue", "orange"), lty=1, lwd=2, bty="n")

# Boxplot
boxplot(d, 
        col=c("red", "royalblue", "orange"), 
        xlab="Sample", ylab="Value")

# # # # # # # # # # # # # # 
dd <- reshape(d,
              direction="long", varying=1:3, v.names="value", 
              timevar = "sample", times = c("A","B","C"))
# Using esquisse, play with the different options to plot the data.
esquisse::esquisser(dd)

boxplot(dd$value ~ dd$sample, 
        col=c("red", "royalblue", "orange"), 
        xlab="Sample", ylab="Value")

library(ggplot2)
ggplot(dd, aes(x=sample, y=value, fill=sample)) + 
  geom_boxplot() +
  labs(x="Sample", y="Value")+
  theme_bw() +
  theme(legend.position = "none",
        text = element_text(size=20))


# # # # # # # # # # # # # # # # # # # # # 
# Let's use the R data `iris`:
iris
# How would you plot it?
plot(iris$Sepal.Length, iris$Sepal.Width, col=iris$Species, pch=16)
legend("topright", legend=levels(iris$Species), 
       col=1:3, pch=16, bty="n")

boxplot(iris$Sepal.Length ~ iris$Species, 
        col=1:3, 
        xlab="Species", ylab="Sepal Length")

esquisse::esquisser(iris)

library(ggplot2)
ggplot(iris, aes(x=Species, y=Sepal.Length, fill=Species, color=Species)) + 
  geom_violin(alpha=.2) +
  geom_jitter(width = .05) +
  labs(x="Sample", y="Sepal Length")+
  theme_bw() +
  theme(legend.position = "none",
        text = element_text(size=20))

ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length, color=Species)) + 
  geom_point(size=5) +
  labs(x="Sepal Width", y="Sepal Length")+
  theme_bw() +
  theme(text = element_text(size=20))
