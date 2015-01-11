rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c(rep("character", 2), rep("numeric",7)))
rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")
rawdata = rawdata[rawdata$Date >= as.Date("01/02/2007", format = "%d/%m/%Y") & rawdata$Date <= as.Date("02/02/2007", format = "%d/%m/%Y"), ]
png(file = "plot1.png", width = 480, height = 480)
hist(rawdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red", bg = "transparent")
dev.off()