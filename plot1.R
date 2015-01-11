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

# create histogram of the global_active_power field
hist(originalData$"Global_active_power", 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power",
     breaks = 20,
     cex.lab = 0.8,
     cex.axis = 0.8,
     cex.main = 0.8)

# copy to .png file
dev.copy(png, file = "plot1.png", width=480, height=480)  ## Copy my plot to a PNG file
dev.off() 