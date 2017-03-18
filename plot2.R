## load the data.table package for fread function
library(data.table)

## load the lubridate package for Date manipulation
library(lubridate)

## open the png file device
png("plot2.png", width=480, height=480)

## read the data in the current working directory
data <- fread("household_power_consumption.txt", na.strings = "?")

## extract a subset of data
subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## create a variable storing both the date and time in the POSIXct format
dateTime <- with(subset, paste(Date, Time))
dateTime <- dmy_hms(dateTime)

## plot the graph
plot(dateTime, subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## close the device
dev.off()

