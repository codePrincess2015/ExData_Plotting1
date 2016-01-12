data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
data$Date <- paste(data$Date,data$Time)
data$Time <- NULL
names(data)[1] <- "datetime"
data$datetime <- strptime(data$datetime,"%d/%m/%Y %T")
data <- data[as.Date(data$datetime) >= as.Date("2007-02-01") & as.Date(data$datetime) <= as.Date("2007-02-02"),]
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
png(file="plot2.png",width=480,height=480,res=72)
plot(as.POSIXct(data$datetime),data$Global_active_power, type="l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

