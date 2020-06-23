
data <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', 
                 na.strings="?", nrows=2075259, check.names=F, 
                 stringsAsFactors=F, comment.char="", quote='\"')

newdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

newdata$Date <- as.Date(newdata$Date, format = "%d/%m/%Y")
newdata$Timedate <- paste(newdata$Date, newdata$Time)
newdata$Timedate <- as.POSIXct(newdata$Timedate)

par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#Top left
plot(newdata$Timedate,newdata$Global_active_power, type = "n",
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(newdata$Timedate, newdata$Global_active_power)

#bottom left
plot(newdata$Timedate,newdata$Sub_metering_1, type = "n",
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(newdata$Timedate, newdata$Sub_metering_1)
lines(newdata$Timedate, newdata$Sub_metering_2, col = "red")
lines(newdata$Timedate, newdata$Sub_metering_3, col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#Top right
plot(newdata$Timedate, newdata$Voltage, xlab = "datetime", 
     ylab = "Voltage", type = "n")
lines(newdata$Timedate, newdata$Voltage)

#Bottom right
plot(newdata$Timedate, newdata$Global_reactive_power, xlab = "datetime", 
     type = "n")
lines(newdata$Timedate, newdata$Global_reactive_power)

dev.copy(png, "plot4.png")

dev.off()
