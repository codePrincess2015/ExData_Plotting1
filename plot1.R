data$Global_active_power <- as.numeric(data$Global_active_power)
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
data$Date <- paste(data$Date,data$Time)
data$Time <- NULL
names(data)[1] <- "datetime"
data$datetime <- strptime(data$datetime,"%d/%m/%Y %T")
data <- data[as.Date(data$datetime) >= as.Date("2007-02-01") & as.Date(data$datetime) <= as.Date("2007-02-02"),]
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
png(file="plot1.png",width=480,height=480,res=72)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()

