source("Init.R")
originalData <- Init()

# plot with 3 different lines for sub_metering_1/2/3
par(mfrow = c(1, 1))
with(originalData, {
    plot(DateTime, 
        Sub_metering_1, 
        ylab = "Energy sub metering",
        xlab = "",
        type="n",
        cex.lab = 0.8,
        cex.axis = 0.8)
    lines(DateTime, Sub_metering_1, col = "black")
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
    legend("topright", 
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"), 
       y.intersp = 0.8, # reduce vertical height to 0.8
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.8)
})

# copy to .png file
source("Copy2Png.R")
Copy2Png("plot3.png")