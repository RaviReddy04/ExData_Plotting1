my_data <- file.path(getwd(),"household_power_consumption.txt")
my_data <- read.table(my_file, header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)
subSetData <- my_data[my_data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subSetData$Date, subSetData$Time), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width = 480, height = 480)




plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime,subMetering2, type = "l", col= "red")
lines(datetime,subMetering3, type="l", col= "blue")
legend("topright",legend = c("subMetering1","subMetering2","subMetering3"), lty = 1,lwd = 2, col = c("black","red", "blue") )
dev.off()

