#Reading and subsetting data
allData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power <- subset(allData, Date=="1/2/2007" | Date == "2/2/2007")
power$DateFormat <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

#Creating graphs
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(power, {
        plot(x = power$DateFormat, y = power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
        plot(x = power$DateFormat, y = power$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        {plot(x = power$DateFormat, y = power$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
        lines(x = power$DateFormat, y = power$Sub_metering_2, type = "l", col = "red")
        lines(x = power$DateFormat, y = power$Sub_metering_3, type = "l", col = "blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty=1)}
        plot(x = power$DateFormat, y = power$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()