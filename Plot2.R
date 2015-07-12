FileURL <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(FileURL, destfile = "project1.zip")
unzip("project1.zip")
X <-read.table("household_power_consumption.txt", sep=";", header=TRUE)
library(dplyr)
data<-filter(X, Date == "2/2/2007" | Date == "1/2/2007")
data$gap <- as.numeric(levels(data$Global_active_power)) [data$Global_active_power]
data$Sub_metering_1 <- as.numeric(levels(data$ Sub_metering_1)) [data$Sub_metering_1];
data$Sub_metering_2 <- as.numeric(levels(data$ Sub_metering_2)) [data$Sub_metering_2];

#Format data
library(lubridate)
data$Date <- dmy(data$Date);
data$Time <- hms(data$Time);
data$DateTime <- data$Date + data$Time

#Create plot
png("plot2.png", width=480, height=480)
plot(data$DateTime, data$gap, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()