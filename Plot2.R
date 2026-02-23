# plot2.R
# Line plot of Global Active Power over time (2007-02-01 and 2007-02-02)

file_path <- "household_power_consumption.txt"

power <- read.table(file_path,  header = TRUE, sep = ";", stringsAsFactors = FALSE,na.strings = "?")

power_sub <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

# Create datetime
dt <- strptime(paste(power_sub$Date, power_sub$Time), format = "%d/%m/%Y %H:%M:%S")
power_sub$Datetime <- as.POSIXct(dt)

power_sub$Global_active_power <- as.numeric(power_sub$Global_active_power)

png("plot2.png", width = 480, height = 480)

plot( power_sub$Datetime, power_sub$Global_active_power,type = "l",  xlab = "",ylab = "Global Active Power (kilowatts)")

dev.off()
