# Cousera Course 4, week1, Project1 29.06.2018
rm(list=ls()) # rm all variable = clear
#   read input file
dat_inp <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, na.strings=c("NA","?")) 
#   select all features between two dates (as character)
tmp <- dat_inp[dat_inp$Date >= "1/2/2007" & dat_inp$Date <= "2/2/2007", ]
#   generate a date-time as POSIXct called my_time
tmp$Date <- as.Date(tmp$Date, format = "%d/%m/%Y")
tmp$Time <- format(tmp$Time, format = "%H:%M:%S")
tmp2 <- paste(tmp$Date, tmp$Time)
# add my_time to dat

tmp$my_time <- strptime(tmp2, "%Y-%m-%d %H:%M:%S")
pip <- unique(tmp$Date)
dat <- tmp[tmp$Date >= "2007-2-1" & tmp$Date <= "2007-2-2", ]

summary(dat)

#   plot4
dev.new()
png(file = "Plot4.png",width = 480, height = 480, units = "px")

par(mfrow=c(2,2))

# plot 4_a
plot(dat$my_time , dat$Global_active_power, type= "l", lty=1, col="blue", ylab="Global Active Power (kilowatts)", xlab="")
#axis.POSIXct(1, at=seq(min(dat$my_time), max(dat$my_time), by ="days"), format="%a")

# plot 4_b
plot(dat$my_time , dat$Voltage, type= "l", lty=1, col="black", ylab="Voltage", xlab="datetime")
#axis.POSIXct(1, at=seq(min(dat$my_time), max(dat$my_time), by ="days"), format="%a")

# plot 4_c
plot(dat$my_time , dat$Sub_metering_1, type= "l", lty=1, col="black", ylab="Energy sub metering", xlab="")
points(dat$my_time , dat$Sub_metering_2, type= "l", lty=1, col="red", ylab="", xlab="")
points(dat$my_time , dat$Sub_metering_3, type= "l", lty=1, col="blue", ylab="", xlab="")
#   add a legend  
legend("topright",legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col =c("black","red","blue"))

# plot 4_d
plot(dat$my_time , dat$Global_reactive_power, type= "l", lty=1, col="black", ylab="Global_reactive_power", xlab="datetime")
#axis.POSIXct(1, at=seq(min(my_time), max(my_time), by ="days"), format="%a")
dev.off()