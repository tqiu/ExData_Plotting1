## load the data.table package for fread function
library(data.table)

## load the lubridate package for Date manipulation
library(lubridate)

## open the png file device
png("plot3.png", width=480, height=480)

## read the data in the current working directory
data <- fread("household_power_consumption.txt", na.strings = "?")

## extract a subset of data
subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## create a variable storing both the date and time in the POSIXct format
dateTime <- with(subset, paste(Date, Time))
dateTime <- dmy_hms(dateTime)

## plot the graph
plot(dateTime, subset$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(dateTime, subset$Sub_metering_2, col="red")
lines(dateTime, subset$Sub_metering_3, col="blue")

## add legend to the topright corner
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)

## close the device
dev.off()

