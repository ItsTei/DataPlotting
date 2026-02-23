# plot4.R

file_path <- "household_power_consumption.txt"

power <- read.table(file_path, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

power_sub <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

dt <- strptime( paste(power_sub$Date, power_sub$Time), format = "%d/%m/%Y %H:%M:%S")
power_sub$Datetime <- as.POSIXct(dt)

# Ensure numeric
power_sub$Global_active_power <- as.numeric(power_sub$Global_active_power)
power_sub$Global_reactive_power <- as.numeric(power_sub$Global_reactive_power)
power_sub$Voltage <- as.numeric(power_sub$Voltage)
power_sub$Sub_metering_1 <- as.numeric(power_sub$Sub_metering_1)
power_sub$Sub_metering_2 <- as.numeric(power_sub$Sub_metering_2)
power_sub$Sub_metering_3 <- as.numeric(power_sub$Sub_metering_3)

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

# Top-left: Global Active Power
plot( power_sub$Datetime, power_sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Top-right: Voltage
plot( power_sub$Datetime, power_sub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Bottom-left: Sub metering
plot( power_sub$Datetime, power_sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(power_sub$Datetime, power_sub$Sub_metering_2, col = "red")
lines(power_sub$Datetime, power_sub$Sub_metering_3, col = "blue")
legend( "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n", cex = 0.8)

# Bottom-right: Global Reactive Power
plot( power_sub$Datetime, power_sub$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")

dev.off()
