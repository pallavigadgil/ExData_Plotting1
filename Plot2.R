## Read data
powCon <-read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")


## Limit to 2 days data in Feb 2007

powCon$Date <- as.Date(powCon$Date, format="%d/%m/%Y")
febDf <- powCon[(powCon$Date=="2007-02-01") | (powCon$Date=="2007-02-02"),]


##Plot2
##convert numeric
febDf$Global_active_power <- as.numeric(febDf$Global_active_power)
##Convert timestamp
febDf<-cbind(febDf, "DateTime" = as.POSIXct(paste(febDf$Date, febDf$Time)))

##create plot2
png("./ExploratoryDataAnalysis/plot2.png", width=480, height=480)
plot(febDf$DateTime, febDf$Global_active_power, type="l", xlab= "", ylab="Global Active power (kilowatts)")
dev.off()
