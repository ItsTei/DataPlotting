# plot3.R
# Energy sub metering over time (three lines + legend)

file_path <- "household_power_consumption.txt"

power <- read.table(
  file_path,
  header = TRUE,
  sep = ";",
  stringsAsFactors = FALSE,
  na.strings = "?"
)

power_sub <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

dt <- strptime(
  paste(power_sub$Date, power_sub$Time),
  format = "%d/%m/%Y %H:%M:%S"
)
power_sub$Datetime <- as.POSIXct(dt)

power_sub$Sub_metering_1 <- as.numeric(power_sub$Sub_metering_1)
power_sub$Sub_metering_2 <- as.numeric(power_sub$Sub_metering_2)
power_sub$Sub_metering_3 <- as.numeric(power_sub$Sub_metering_3)

png("plot3.png", width = 480, height = 480)

plot(
  power_sub$Datetime,
  power_sub$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering"
)
lines(power_sub$Datetime, power_sub$Sub_metering_2, col = "red")
lines(power_sub$Datetime, power_sub$Sub_metering_3, col = "blue")

legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  bty = "n"
)

dev.off()
