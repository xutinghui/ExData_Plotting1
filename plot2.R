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

# draw plot with lines
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
dev.copy(png, file = "plot2.png", width=480, height=480)  ## Copy my plot to a PNG file
dev.off() 