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

#   plot1
dev.new()
png(file = "Plot1.png",width = 480, height = 480, units = "px")

hist(dat$Global_active_power, main="Global Active Power", col="red",
     xlab="Global Active Power (kilowatts)")
dev.off() # close the file
