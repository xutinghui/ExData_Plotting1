Init <- function() {
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
    
    return(originalData)
}