## reads in data all at once then subset and creates numeric and datetime variables
  data <- read.table("household_power_consumption.txt", sep =";", header = TRUE)
  d2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
  d2$Global_active_power <- as.numeric(as.character(d2$Global_active_power))
  d2$Global_reactive_power <- as.numeric(as.character(d2$Global_reactive_power))
  d2$Sub_metering_1 <- as.numeric(as.character(d2$Sub_metering_1))
  d2$Sub_metering_2 <- as.numeric(as.character(d2$Sub_metering_2))
  d2$Sub_metering_3 <- as.numeric(as.character(d2$Sub_metering_3))
  d2$datetime <-strptime(paste(d2$Date, d2$Time), "%d/%m/%Y %H:%M:%S")
# makes the second plot
  png("plot2.png", width =480, height = 480, units ="px", bg = "white")
  plot(d2$datetime, d2$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
  with(d2, lines(datetime, Global_active_power, type ="l"))
  dev.off()