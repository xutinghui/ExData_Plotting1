# every minute there is one record, so there are 2*24*60 = 2880 records in 2 days
originalData <- read.table("household_power_consumption.txt", 
                           header = FALSE, 
                           sep = ";", 
                           na.strings = "?",
                           skip=grep("^1/2/2007", readLines("household_power_consumption.txt"))-1,
                           nrows = 2880)

# get header
header <- read.table("household_power_consumption.txt", 
                     header = FALSE, 
                     sep = ";", 
                     nrows = 1)

# assign the header for the data
names(originalData) <- as.vector(as.matrix(header))

# create a new column DateTime that combines formatted Date and Time
originalData$DateTime = strptime(paste(originalData$Date, originalData$Time), "%d/%m/%Y %H:%M:%S")

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
dev.copy(png, file = "plot4.png", width=480, height=480)  ## Copy my plot to a PNG file
dev.off() 
