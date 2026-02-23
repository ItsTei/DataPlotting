# plot1.R
# Histogram of Global Active Power (2007-02-01 and 2007-02-02)

file_path <- "household_power_consumption.txt"

power <- read.table( file_path, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

# Subset for the required two dates
power_sub <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")

# Convert to numeric just in case it was read as character
power_sub$Global_active_power <- as.numeric(power_sub$Global_active_power)

png("plot1.png", width = 480, height = 480)

hist( power_sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()
