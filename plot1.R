
data <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', 
                      na.strings="?", nrows=2075259, check.names=F, 
                      stringsAsFactors=F, comment.char="", quote='\"')

newdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

newdata$Date <- as.Date(newdata$Date)

hist(newdata$Global_active_power, xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")

dev.copy(png, "plot1.png")

dev.off()
