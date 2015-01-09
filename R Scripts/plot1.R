#Reading and subsetting data
allData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power <- subset(allData, Date=="1/2/2007" | Date == "2/2/2007")
power$DateFormat <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")

#Creating graph
png("plot1.png", width = 480, height = 480)
hist(power$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()