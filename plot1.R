plot1 <- function() {
    datafile <- "household_power_consumption.txt"
    data_all <- read.table(datafile, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
    data <- subset(data_all, Date=="1/2/2007" | Date=="2/2/2007")
    rm(data_all)
    data$Datetime <- paste(data$Date,data$Time,sep=" ")
    data$Datetime <- strptime(data$Datetime, format="%d/%m/%Y %H:%M:%S")
    
    png(filename="plot1.png", width=480, height=480, units="px")
    with(data, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))
    dev.off()
}
