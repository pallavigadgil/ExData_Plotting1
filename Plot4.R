## Read data
powCon <-read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")


## Limit to 2 days data in Feb 2007

powCon$Date <- as.Date(powCon$Date, format="%d/%m/%Y")
febDf <- powCon[(powCon$Date=="2007-02-01") | (powCon$Date=="2007-02-02"),]

##convert numeric
febDf$Global_active_power <- as.numeric(febDf$Global_active_power)
febDf$Sub_metering_1 <- as.numeric(febDf$Sub_metering_1)
febDf$Sub_metering_2 <- as.numeric(febDf$Sub_metering_2)
febDf$Sub_metering_3 <- as.numeric(febDf$Sub_metering_3)
febDf$Voltage <- as.numeric(febDf$Voltage)
febDf$Global_reactive_power <- as.numeric(febDf$Global_reactive_power)

##Convert timestamp
febDf<-cbind(febDf, "DateTime" = as.POSIXct(paste(febDf$Date, febDf$Time)))

##par
png("./ExploratoryDataAnalysis/plot4.png", width=480, height=480)
par(mfrow=c(2,2))


##Plot1

plot(febDf$DateTime,febDf$Global_active_power,type="l", xlab="",ylab = "Global Active Power (kilowatts)")


##create plot2
plot(febDf$DateTime, febDf$Voltage, type="l", xlab="datetime", ylab="Voltage")



##Plot 3
with(febDf,plot(DateTime,Sub_metering_1, xlab="", ylab="Energy sub metering",type="l"))
lines(febDf$DateTime,febDf$Sub_metering_2,col="red")
lines(febDf$DateTime,febDf$Sub_metering_3,col="blue")
legend("topright",  col = c("black", "red", "blue"),   legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##plot4
plot(febDf$DateTime,febDf$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power",type="l")

dev.off()
