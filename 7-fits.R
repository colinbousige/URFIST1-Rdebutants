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



# Read the data in `Data/fit2.csv` into a data.frame called `d2`.
# Plot the data, and make the appropriate fit using `lm()`.
# Overlay the result of the fit as a red line
# Hint: look at `poly()`. Polynomial fits are actually linear fits!




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
    ___
}

# To find the starting values for the parameters, we will add as a line to the plot the sum of two Lorentzian peaks with guessed parameters so that the starting point is not too far from the data to fit.
lines(d$w, ___, col='red')

# Perform the fit using `nls()`, then add the resulting fit to the plot as a red line.
# Hint: look at `predict()`
fit <- nls(data = ___, # what is the data.frame with our data
           ___ ~ ___, # what is the formula to fit? `~` means `as a function of`
           start = list(___)) # initial values for the parameters to fit
plot(___)
lines(___)



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
    temp <- read.csv(f, header=___, col.names=___)
    infos <- ___ |> # remove the file path
        gsub(___, ___, x=_) |> # remove "sec.csv"
        ___ |> #  # remove "K"
        ___ |> # split around the "_" character
        ___ |> # make the list into a vector
        ___ # make it numeric
    temperature <- infos[1]
    time        <- infos[2]
    out         <- data.frame(___ = ___, 
                              ___ = ___, 
                              ___ = ___, 
                              ___ = ___)
    sizes       <- rbind(sizes, out)
}

# Now, let's plot the mean size L as a function of time for each temperature using esquisse. Copy the code here, we will then tune it a bit
esquisse::esquisser(sizes)

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
for (temp in ___) {
    d <- ___ # subset of `sizes` for this temperature
    fit <- lm(data = ___, ___ ~ ___) # make the linear fit
    # plot the data and the fit
    points(___, ___, pch=19, cex=1, col=colors[___])
    abline(fit, col=___)
    # create a temporary data.frame with the temperature, 
    # the intercept and the slope
    out <- data.frame(temperature = temp, 
                      intercept   = ___, 
                      slope       = ___)
    # save the result in the fits data.frame
    fits <- rbind(fits, out)
}

# Plot the slope as a function of temperature. What can you say about it?
fits


# The growth of nanotubes is an activated process, so the slope should be proportional to exp(-Ea/kT), where Ea is the activation energy, k is the Boltzmann constant, and T is the temperature.
# Using nls(), fit the slope as a function of temperature with a function of the form a*exp(-Ea/kT), and add the resulting fit to the plot as a red line.
# What is the activation energy?


# Could you have fitted the data with another function? Why?



