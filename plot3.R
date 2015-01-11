# This R script creates plot 3 for Project 1

# Read data
data <- read.csv("household_power_consumption.txt", sep=";", dec = ".", stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-2",]
data[,3:9] <- sapply(data[,3:9], as.numeric)
data$Timestamp <- as.POSIXlt(paste(data$Date, data$Time, sep = " "))

# Open PNG file
png(filename = "plot3.png", width = 480, height = 480)

# Create plot
par(mfrow = c(1,1))
with(data, { 
    plot(Timestamp, Sub_metering_1, type = "l", xlab = "", ylab ="Energy sub metering")
    points(Timestamp, Sub_metering_2, col = "red", type = "l")
    points(Timestamp, Sub_metering_3, col = "blue", type = "l")
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1),
       col = c("black", "red", "blue"))

# Close PNG file
dev.off()