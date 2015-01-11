# Read data 
rawdata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c(rep("character", 2), rep("numeric",7)))

# Format Date and Time into DateAndTime
rawdata$DateAndTime <- strptime(paste(rawdata$Date, rawdata$Time), format="%d/%m/%Y %H:%M:%S")

# Select the target Date and Time
rawdata = rawdata[rawdata$DateAndTime >= strptime("01/02/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S") & rawdata$DateAndTime <= strptime("02/02/2007 23:59:59", format = "%d/%m/%Y %H:%M:%S"), ]

# Create a plot into plot2.png
png(file = "plot2.png", width=480, height=480)
plot(rawdata$DateAndTime, rawdata$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")
dev.off()