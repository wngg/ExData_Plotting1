plot2 <- function() {
    datafile <- "household_power_consumption.txt"
    data_all <- read.table(datafile, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
    data <- subset(data_all, Date=="1/2/2007" | Date=="2/2/2007")
    rm(data_all)
    data$Datetime <- paste(data$Date,data$Time,sep=" ")
    data$Datetime <- strptime(data$Datetime, format="%d/%m/%Y %H:%M:%S")
    
    png(filename="plot2.png", width=480, height=480, units="px")
    with(data, plot(Datetime, Global_active_power, xlab="", ylab="Global Active Power (kilowatts)",type="l"))
    dev.off()
}
