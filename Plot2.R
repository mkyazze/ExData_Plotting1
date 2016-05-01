# pc -- household power consumption
# subpc -- subset of pc

pc<- read.table('household_power_consumption.txt',header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".") 
pc$Date<- as.Date(pc$Date,format="%d/%m/%Y")
subpc <- subset(pc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(pc)
datetime <- paste(as.Date(subpc$Date), subpc$Time)
subpc$Datetime <- as.POSIXct(datetime)
globalActivePower <- as.numeric(subpc$Global_active_power)
png("plot2.png", width=480, height=480)
plot(subpc$Datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()