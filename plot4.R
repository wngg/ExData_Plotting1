plot4 <- function() {
    datafile <- "household_power_consumption.txt"
    data_all <- read.table(datafile, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
    data <- subset(data_all, Date=="1/2/2007" | Date=="2/2/2007")
    rm(data_all)
    data$Datetime <- paste(data$Date,data$Time,sep=" ")
    data$Datetime <- strptime(data$Datetime, format="%d/%m/%Y %H:%M:%S")
    
    png(filename="plot4.png", width=480, height=480, units="px")
    par(mfcol=c(2,2))
    ## plot 4.1
    with(data, plot(Datetime, Global_active_power, xlab="", ylab="Global Active Power",type="l"))
    ## plot 4.2
    with(data, plot(Datetime, Sub_metering_1, col="black", xlab="", ylab="Energy sub metering", type="l"))
    with(data, lines(Datetime, Sub_metering_2, col="red"))
    with(data, lines(Datetime, Sub_metering_3, col="blue"))
    legend("topright", lty=1, bty="n", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    ## plot 4.3
    with(data, plot(Datetime, Voltage, xlab="datetime", ylab="Voltage",type="l"))
    ##plot 4.4
    with(data, plot(Datetime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power",type="l"))
    dev.off()
}
