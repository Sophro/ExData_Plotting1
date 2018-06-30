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

#   plot2
dev.new()
png(file = "Plot2.png",width = 480, height = 480, units = "px")

plot(dat$my_time , dat$Global_active_power, type= "l", 
     lty=1, col="blue", 
     ylab="Global Active Power (kilowatts)", xlab="" )
dev.off()
#     xaxt = "n")
#axis.POSIXct(1, at=seq(min(dat$my_time), max(dat$my_time), by ="days"), format="%a-%H")
# useful_to_write <- format(dat$my_time, format = "%a")
