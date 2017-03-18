## Read data
powCon <-read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")


## Limit to 2 days data in Feb 2007

powCon$Date <- as.Date(powCon$Date, format="%d/%m/%Y")
febDf <- powCon[(powCon$Date=="2007-02-01") | (powCon$Date=="2007-02-02"),]

##convert numeric
febDf$Sub_metering_1 <- as.numeric(febDf$Sub_metering_1)
febDf$Sub_metering_2 <- as.numeric(febDf$Sub_metering_2)

febDf$Sub_metering_3 <- as.numeric(febDf$Sub_metering_3)

##Convert timestamp
febDf<-cbind(febDf, "DateTime" = as.POSIXct(paste(febDf$Date, febDf$Time)))

png("./ExploratoryDataAnalysis/plot3.png",width=480, height=480)
with(febDf,plot(DateTime,Sub_metering_1, xlab="", ylab="Energy sub metering",type="l"))
lines(febDf$DateTime,febDf$Sub_metering_2,col="red")
lines(febDf$DateTime,febDf$Sub_metering_3,col="blue")
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
