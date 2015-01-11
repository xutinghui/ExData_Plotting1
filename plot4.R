source("Init.R")
originalData <- Init()

# create 4 plots: global active power / DateTime, Voltage / DateTime,
# Energy sub metering / DateTime, Global reactive power/DateTime
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(originalData, {
    plot(DateTime, 
         Global_active_power, 
         ylab = "Global Active Power",
         xlab = "",
         type="n",
         cex.lab = 0.8,
         cex.axis = 0.8)
    lines(DateTime, Global_active_power)
   
    plot(DateTime, 
         Voltage, 
         ylab = "Voltage",
         xlab = "datetime",
         type="n",
         cex.lab = 0.8,
         cex.axis = 0.8)
    lines(DateTime, Voltage)
    
    plot(DateTime, 
         Sub_metering_1, 
         ylab = "Energy sub metering",
         xlab = "",
         type="n",
         cex.lab = 0.8,
         cex.axis = 0.8,)
    lines(DateTime, Sub_metering_1, col = "black")
    lines(DateTime, Sub_metering_2, col = "red")
    lines(DateTime, Sub_metering_3, col = "blue")
    legend("topright", 
           lty = c(1, 1, 1),
           col = c("black", "red", "blue"), 
           y.intersp = 0.8,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           cex = 0.8,
           bty = "n") # remove legend border
    
    plot(DateTime, 
         Global_reactive_power, 
         ylab = "Global_reactive_power",
         xlab = "datetime",
         type="n",
         cex.lab = 0.8,
         cex.axis = 0.8)
    lines(DateTime, Global_reactive_power)
})

# copy to .png file
source("Copy2Png.R")
Copy2Png("plot4.png")
