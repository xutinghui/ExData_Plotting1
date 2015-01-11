source("Init.R")
originalData <- Init()

# draw plot with lines
par(mfrow = c(1, 1))
with(originalData, {
    plot(DateTime, 
        Global_active_power, 
        ylab = "Global Active Power (kilowatts)",
        xlab = "",
        type="n",
        cex.lab = 0.8,
        cex.axis = 0.8)
    lines(DateTime, Global_active_power)
})

# copy to .png file
source("Copy2Png.R")
Copy2Png("plot2.png")