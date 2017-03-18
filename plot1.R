## load the data.table package for fread function
library(data.table)

## open the png file device
png("plot1.png", width=480, height=480)

## read the data in the current working directory
data <- fread("household_power_consumption.txt", na.strings = "?")

## extract a subset of data
subset <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

## plot the histogram
hist(subset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", 
     col="red", xlim=c(0,6))

## close the device
dev.off()

