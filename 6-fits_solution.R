# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # Modelling data: linear fits with `lm()`, and non-linear fits with `nls()` # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# Just for Colin, do not run:
# server = livecode::serve_file()

# # # # # # # # # # # # # # # # # # # 
# Linear fitting
# # # # # # # # # # # # # # # # # # # 

# Read the data in `Data/fit1.csv` into a data.frame called `d1`.
# Plot the data, and make the appropriate fit using `lm()`.
# Overlay the result of the fit as a red line
# Hint: look at `predict()`
d1 <- read.csv("Data/fit1.csv")
plot(d1)
fit <- lm(data = d1, y ~ x)
abline(fit, col='red')
# or :
lines(d1$x, predict(fit), lty=2, col='blue')

# Read the data in `Data/fit2.csv` into a data.frame called `d2`.
# Plot the data, and make the appropriate fit using `lm()`.
# Overlay the result of the fit as a red line
# Hint: look at `poly()`. Polynomial fits are actually linear fits!
d2 <- read.csv("Data/fit2.csv")
plot(d2)
fit2 <- lm(data = d2, y ~ poly(x, 2))
summary(fit2)
lines(d2$x, predict(fit3), lty=2, col='blue')
fit3 <- lm(data = d2, y ~ poly(x, 3))
summary(fit3)
lines(d2$x, predict(fit2), lty=2, col='red')

# Or better, create a function that does the fit and the plot for you
myfit <- function(data=d2, degree=1){
  fit <- lm(data = data, y ~ poly(x, degree))
  lines(data$x, predict(fit), lty=2, lwd=2, col=degree)
  return(fit)
}
plot(d2)
myfit(degree=1)
myfit(degree=2)
myfit(degree=3)
myfit(degree=4)

# # # # # # # # # # # # # # # # # # # 
# Nonlinear fitting
# # # # # # # # # # # # # # # # # # # 

# Read `Data/rubis_01.txt` into a data.frame called `d` with the column names `w` and `int`.
# Hint: look at the options of `read.table()`
d <- read.table("Data/rubis_01.txt", 
                header=FALSE,
                col.names=c('w','int'))

# Plot the intensity as a function of wavenumber using `plot()`.
plot(d)

# The two peaks are Lorentzian peaks, of the form:
# a/(1 + ((w-w0)/b)^2), 
# where a, b, and x0 are the parameters to be fitted.
# Create a function `lor()` that defines a Lorentzian peak.
lor <- function(w, a, w0, b) {
    a/(1 + ((w-w0)/b)^2)
}

# To find the starting values for the parameters, we will add as a line to the plot the sum of two Lorentzian peaks with guessed parameters so that the starting point is not too far from the data to fit.
plot(d)
lines(d$w, 
      lor(d$w, a=2e3, w0=3210, b=10) + lor(d$w, a=2e3, w0=3170, b=10), 
      col='red')

# Perform the fit using `nls()`, then add the resulting fit to the plot as a red line.
# Hint: look at `predict()`
fit <- nls(data = d, # what is the data.frame with our data
           int ~ c + lor(w, a1, w1, b1) + lor(w, a2, w2, b2), # what is the formula to fit? `~` means `as a function of`
           start = list(c=0.1, 
                        a1=2e3, w1=3210, b1=10, 
                        a2=2e3, w2=3170, b2=10),
           ) # initial values for the parameters to fit
plot(d)
lines(d$w, predict(fit), col='red')
summary(fit)
broom::tidy(fit)

# # # # # # # # # # # # # # # # # # # 
# Full example
# # # # # # # # # # # # # # # # # # # 

# Let's read all the files in the `Data/fits` folder. They contain distributions of observed carbon nanotube sizes as a function of temperature and time.
flist <- list.files(path="Data/fits", 
                    pattern = ".csv", 
                    full.names = TRUE)
# Using a for loop, read all these files and store the mean size L and the standard deviation sigma in a data.frame called `sizes`. 
# This data.frame should have 4 columns: `temperature`, `time`, `L`, and `sigma`.
# The file names contain the temperature and time of the experiment. Extract these values and add them as columns to the data.frame.
sizes <- data.frame()
for(f in flist){
    # test on f <- flist[1]
    temp <- read.csv(f, header=FALSE, col.names='L')
    infos <- basename(f) |> # remove the file path
        gsub('sec\\.csv', '', x=_) |> # remove "sec.csv"
        gsub('K', '', x=_) |> #  # remove "K"
        strsplit('_') |> # split around the "_" character
        unlist() |> # make the list into a vector
        as.numeric() # make it numeric
    temperature <- infos[1]
    time        <- infos[2]
    out         <- data.frame(temperature = temperature, 
                              time        = time, 
                              L           = mean(temp$L), 
                              sigma       = sd(temp$L)
                              )
    sizes       <- rbind(sizes, out)
}

# Now, let's plot the mean size L as a function of time for each temperature using esquisse. Copy the code here, we will then tune it a bit
esquisse::esquisser(sizes)
colors <- colorRampPalette(c("black","royalblue","seagreen","orange","red"))
sizes |> 
    ggplot(aes(x=time, y=L, color=factor(temperature))) + 
    geom_point()+
    geom_errorbar(aes(ymin=L-sigma, ymax=L+sigma))+
    theme_bw()+
    labs(x="Time [s]", y="Size [nm]", color="Temperature [K]")+
    theme(text = element_text(size=18))+
    scale_color_manual(values = colors(length(unique(sizes$temperature))))


# The data looks like it could be fitted with a linear function for each temperature. Using a for loop, perform a linear fit for each temperature and store the resulting coefficients in a list called `fits`.
# While you are at it, plot the data and the fits on the same graph.
# Hint: use `subset()` to split the data.frame by temperature

# Initialize an empty dataframe to store the results
fits <- data.frame()
# Initialize an empty plot
plot(NULL,NULL, 
     xlim=c(0, max(sizes$time)), 
     ylim=c(0, max(sizes$L)), 
     xlab="Time [s]", 
     ylab="Size [nm]")
# create a named color palette
colors <- rainbow(length(unique(sizes$temperature)))
names(colors) <- unique(sizes$temperature)

# Iteration on all temperatures in `sizes`
for (temp in sort(unique(sizes$temperature))) {
    d <- sizes |> subset(temperature == temp) # subset of `sizes` for this temperature
    fit <- lm(data = d, L ~ time) # make the linear fit
    # plot the data and the fit
    points(d$time, d$L, pch=19, cex=1, col=colors[paste(temp)])
    abline(fit, col=colors[paste(temp)])
    # create a temporary data.frame with the temperature, 
    # the intercept and the slope
    out <- data.frame(temperature = temp, 
                      intercept   = coef(fit)[1], 
                      slope       = coef(fit)[2])
    # save the result in the fits data.frame
    fits <- rbind(fits, out)
}
fits
# Plot the slope as a function of temperature. What can you say about it?

plot(fits$temperature, fits$slope, pch=19, cex=1, col="black")

# The growth of nanotubes is an activated process, so the slope should be proportional to exp(-Ea/T), where Ea is the activation energy in Kelvins, and T is the temperature.
# Using nls(), fit the slope as a function of temperature with a function of the form a*exp(-Ea/T), and add the resulting fit to the plot as a red line.
# A good starting point for the fit is a=7e6 and Ea=18e3. Check that it's the case.
# What is the activation energy?
lines(fits$temperature, 
      7e6*exp(-18e3/fits$temperature), 
      col="red", lwd=2)
fit2 <- nls(data = fits, slope ~ a*exp(-Ea/temperature), 
            start = list(a=7e6, Ea=18e3))
coef(fit2)['Ea']

# Could you have fitted the data with another function? Why?
fits$temp_inv <- 1/fits$temperature
fit_linear <- lm(data = fits, log(slope) ~ temp_inv)
Ea <- -coef(fit_linear)[2]
Ea

# Plot the results of the two fits on the same graph to compare them.

par(family = "Helvetica", cex.lab=1.5, cex.axis=1.4, 
    mgp = c(2.5, .5, 0), tck=0.02, mar=c(4, 5, .5, .5), lwd=2, las=1)
plot(fits$temperature, fits$slope, 
     pch=16, cex=2, col="black",
     xlab="Temperature [K]", 
     ylab="",
     axes = FALSE)
lines(fits$temperature, predict(fit2), col="red", lwd=2)
lines(fits$temperature, exp(predict(fit_linear)), col="royalblue", lwd=2)
legend("topleft", 
      legend=c("nls fit", "linear fit"), 
      col=c("red", "royalblue"), 
      lty=1, lwd=2, bty='n', cex=1.5)
# Bottom
axis(1, at=seq(800,1000,50), labels=TRUE,tck=0.02)
axis(1, at=seq(800,1000,25), labels=FALSE,tck=0.01); # small inter-ticks
# Top
axis(3,at=seq(800,1000,50), labels=FALSE)
axis(3,at=seq(800,1000,25), labels=FALSE,tck=0.01); # small inter-ticks
# Left
axis(2,at=seq(0, 0.15, .02), labels=TRUE)
axis(2,at=seq(0, 0.15, .01), labels=FALSE,tck=0.01); # small inter-ticks
title(ylab = "Growth rate [nm/s]", line = 3.5) 
# Right
axis(4,at=seq(0, 0.15, .02), labels=FALSE)
axis(4,at=seq(0, 0.15, .01), labels=FALSE,tck=0.01); # small inter-ticks
# Draw a box
box()

# with ggplot2
fits |> 
    ggplot(aes(x = temperature, y = slope)) +
        geom_point(size=3)+
        geom_line(aes(y = predict(fit2), 
                      color="nls fit"),
                  linewidth=1)+
        geom_line(aes(y = exp(predict(fit_linear)), 
                      color="linear fit"), 
                  linewidth=1)+
        theme_bw()+
        theme(text = element_text(size=18), 
              legend.position = 'top')+
        scale_color_manual(values = c("nls fit" = "red", 
                                      "linear fit" = "royalblue"))+
        labs(x="Temperature [K]", 
             y="Growth rate [nm/s]",
             color=NULL)
