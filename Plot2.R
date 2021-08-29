png("plot2.png", width=480, height=480)
plot(x=data3$date_time, y = data3$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()