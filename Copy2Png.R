Copy2Png <- function(fileName){
    dev.copy(png, file = fileName, width=480, height=480)  
    dev.off() 
}