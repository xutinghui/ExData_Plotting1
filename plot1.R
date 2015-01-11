source("Init.R")
originalData <- Init()

# create histogram of the global_active_power field
par(mfrow = c(1, 1))
hist(originalData$"Global_active_power", 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power",
     breaks = 20,
     cex.lab = 0.8,
     cex.axis = 0.8,
     cex.main = 0.8)

# copy to .png file
source("Copy2Png.R")
Copy2Png("plot1.png")