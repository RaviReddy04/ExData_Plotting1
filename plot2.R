
my_data <- file.path(getwd(),"household_power_consumption.txt")
my_data <- read.table(my_file, header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)
subSetData <- my_data[my_data$Date %in% c("1/2/2007","2/2/2007") ,]

png("plot2.png", width = 480, height = 480)
datetime <- strptime(paste(subSetData$Date, subSetData$Time), "%d/%m/%Y %H:%M:%S") 
plot(datetime,as.numeric(subSetData$Global_active_power), type = "l")
dev.off()