

data <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', 
                 na.strings="?", nrows=2075259, check.names=F, 
                 stringsAsFactors=F, comment.char="", quote='\"')

newdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

newdata$Date <- as.Date(newdata$Date, format = "%d/%m/%Y")
newdata$Timedate <- paste(newdata$Date, newdata$Time)
newdata$Timedate <- as.POSIXct(newdata$Timedate)

plot(newdata$Timedate,newdata$Global_active_power, type = "n",
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(newdata$Timedate, newdata$Global_active_power)

dev.copy(png, "plot2.png")

dev.off()

