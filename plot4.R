# Read data 
rawdata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c(rep("character", 2), rep("numeric",7)))

# Format Date and Time into DateAndTime
rawdata$DateAndTime <- strptime(paste(rawdata$Date, rawdata$Time), format="%d/%m/%Y %H:%M:%S")

# Select the target Date and Time
rawdata = rawdata[rawdata$DateAndTime >= strptime("01/02/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S") & rawdata$DateAndTime <= strptime("02/02/2007 23:59:59", format = "%d/%m/%Y %H:%M:%S"), ]
png(file = "plot4.png", width=480, height=480)

# Create 4 plots into plot4.png
par(mfrow = c(2,2))
# Top-left
plot(rawdata$DateAndTime, rawdata$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")

# Top-right
plot(rawdata$DateAndTime, rawdata$Voltage, xlab = "datetime", ylab = "Voltage", type="l")

# Bottom-left
plot(rawdata$DateAndTime, rawdata$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(rawdata$DateAndTime, rawdata$Sub_metering_2, col = "red")
lines(rawdata$DateAndTime, rawdata$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

# Bottom-right
plot(rawdata$DateAndTime, rawdata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type="l")
dev.off()