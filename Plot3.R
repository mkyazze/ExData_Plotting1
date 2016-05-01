# pc -- household power consumption
# subpc -- subset of pc

pc <- read.table('household_power_consumption.txt',header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")
pc$Date=as.Date(pc$Date,"%d/%m/%Y")
pc$Global_active_power=as.numeric(pc$Global_active_power)

pc$Date<- as.Date(pc$Date,format="%d/%m/%Y")
subpc <- subset(pc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

subpc$timestamp=as.POSIXct(paste(subpc$Date,subpc$Time))

attach(subpc)
png("plot3.png", width=480, height=480, units="px")
# Plot Energy sub metering
plot(timestamp, as.numeric(as.character(Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering", ylim=c(0,40))
lines(timestamp, as.numeric(as.character(Sub_metering_2)), col="red")
lines(timestamp, as.numeric(as.character(Sub_metering_3)), col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
dev.off()