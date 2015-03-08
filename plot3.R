plot3 <- function() {
    datafile <- "household_power_consumption.txt"
    data_all <- read.table(datafile, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
    data <- subset(data_all, Date=="1/2/2007" | Date=="2/2/2007")
    rm(data_all)
    data$Datetime <- paste(data$Date,data$Time,sep=" ")
    data$Datetime <- strptime(data$Datetime, format="%d/%m/%Y %H:%M:%S")
    
    png(filename="plot3.png", width=480, height=480, units="px")
    with(data, plot(Datetime, Sub_metering_1, col="black", xlab="", ylab="Energy sub metering", type="l"))
    with(data, lines(Datetime, Sub_metering_2, col="red"))
    with(data, lines(Datetime, Sub_metering_3, col="blue"))
    legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    dev.off()
}
