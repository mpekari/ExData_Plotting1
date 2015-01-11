# This R script creates plot 2 for Project 1

# Read data
data <- read.csv("household_power_consumption.txt", sep=";", dec = ".", stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-2",]
data[,3:9] <- sapply(data[,3:9], as.numeric)
data$Timestamp <- as.POSIXlt(paste(data$Date, data$Time, sep = " "))

# Open PNG file
png(filename = "plot2.png", width = 480, height = 480)

# Create plot
par(mfrow = c(1,1))
with(data, plot(Timestamp, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Close PNG file
dev.off()