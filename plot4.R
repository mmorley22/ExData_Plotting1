## reads in data all at once then subset and creates numeric and datetime variables
  data <- read.table("household_power_consumption.txt", sep =";", header = TRUE)
  d2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
  d2$Global_active_power <- as.numeric(as.character(d2$Global_active_power))
  d2$Global_reactive_power <- as.numeric(as.character(d2$Global_reactive_power))
  d2$Sub_metering_1 <- as.numeric(as.character(d2$Sub_metering_1))
  d2$Sub_metering_2 <- as.numeric(as.character(d2$Sub_metering_2))
  d2$Sub_metering_3 <- as.numeric(as.character(d2$Sub_metering_3))
  d2$datetime <-strptime(paste(d2$Date, d2$Time), "%d/%m/%Y %H:%M:%S")
# create 4th plot with 4 separate plots
# opens png device
  png("plot4.png", width = 480, height = 480, units ="px", bg = "white")
#format 2 by 2 plots
    par(mfrow = c(2,2))
# upper left plot
    plot(d2$datetime, d2$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
    with(d2, lines(datetime, Global_active_power, type ="l"))
# upper right plot
    plot(d2$datetime, d2$Voltage, type ="n", ylab="Voltage", xlab = "datetime")
    lines(d2$datetime, d2$Voltage)
# lower left plot has 3 plots on the same axis
    plot(d2$datetime, d2$Sub_metering_1, type ="n", ylab ="Energy sub metering", xlab ="")
    lines(d2$datetime, d2$Sub_metering_1, type ="l")
    lines(d2$datetime, d2$Sub_metering_2, type ="l", col ="red")
    lines(d2$datetime, d2$Sub_metering_3, type ="l", col ="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =c(1,1,1), col=c("black", "red","blue"))
# lower right plot  
  plot(d2$datetime, d2$Global_reactive_power, type ="n", ylab="Global_reactive_power", xlab = "datetime")
    lines(d2$datetime, d2$Global_reactive_power)
#turn device off
dev.off()