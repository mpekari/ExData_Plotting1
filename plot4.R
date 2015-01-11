# This R script creates plot 4 for Project 1

# Read data
data <- read.csv("household_power_consumption.txt", sep=";", dec = ".", stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-2",]
data[,3:9] <- sapply(data[,3:9], as.numeric)
data$Timestamp <- as.POSIXlt(paste(data$Date, data$Time, sep = " "))

# Open PNG file
png(filename = "plot4.png", width = 480, height = 480)

# Create plot
par(mfrow = c(2,2))
with(data, {
    plot(Timestamp, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    plot(Timestamp, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    plot(Timestamp, Sub_metering_1, type = "l", xlab = "", ylab ="Energy sub metering")
    points(Timestamp, Sub_metering_2, col = "red", type = "l")
    points(Timestamp, Sub_metering_3, col = "blue", type = "l")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")
    plot(Timestamp, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

# Close PNG file
dev.off()