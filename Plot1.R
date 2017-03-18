## Read data
powCon <-read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")


## Limit to 2 days data in Feb 2007

powCon$Date <- as.Date(powCon$Date, format="%d/%m/%Y")
febDf <- powCon[(powCon$Date=="2007-02-01") | (powCon$Date=="2007-02-02"),]


##Plot1

febDf$Global_active_power <- as.numeric(febDf$Global_active_power)

png("./ExploratoryDataAnalysis/plot1.png",width=480, height=480)
hist(febDf$Global_active_power,xlab = "Global Active Power (kilowatts)", main="Global Active Power", col = "red")
dev.off()
