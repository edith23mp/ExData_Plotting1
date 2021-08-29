#codigo para plot1, hist
#carga de data
# cargamos el paquete dplyr

library(dplyr)
tbl <- read.table(file = file, dec = ".", stringsAsFactors = FALSE, 
                  colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), header = TRUE, sep = ";", na.strings = "?")

# subset data to and remove original data table to free space
data <- filter(tbl, Date %in% c("1/2/2007", "2/2/2007"))
rm(tbl)

# new column date_time for x axis
data2$Date <- as.Date(data$Date, "%d/%m/%Y")
data3 <- mutate(data2, date_time = as.POSIXct(paste(data$Date, data$Time, sep=" "), template = "%d/%m/%Y %H:%M:%S", tz = Sys.timezone()))
#head(data3)  para revisar la data y su formato

#Plot1

png("plot1.png", width=480, height=480)
hist(data3$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylim = c(0,1200), 
     xlim = c(0,6), breaks = 12)
dev.off()