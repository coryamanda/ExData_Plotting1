#Reading and subsetting data
allData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power <- subset(allData, Date=="1/2/2007" | Date == "2/2/2007")
power$DateFormat <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

#Adding day to the plot
power$day <- weekdays(as.Date(power$DateFormat))

#Creating graph
png("plot2.png", width = 480, height = 480)
plot(x = power$DateFormat, y = power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()