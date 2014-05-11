### Plotting time series of Global Active Power - plot 2
### Raw data from:
### https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

### Import data
if (file.exists(data_file = "household_power_consumption.txt")) {
  data <- read.csv("../household_power_consumption.txt",
                   colClasses = c("character","character",rep("numeric",7)),
                   na.strings =  "?", sep = ";")
  
  ### Trim data to use only from the dates 2007-02-01 and 2007-02-02
  data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
  
  ### Save data for usage later
  save(file = "household_power_consumption.RData", list = c("data"))
} else load("household_power_consumption.RData")


### Format data to use Days of Week
data <- cbind(DayOfWeek= format(strptime(apply(data[,c("Date","Time")],1,paste,collapse=" "), format="%d/%m/%Y %T"), format = "%a") ,
              data)

### Open graphical device
png(filename = "plot2.png", width = 480, height = 480, units = "px")

### TimeSeries of Global Active Power (kilowatts)
plot( data$Global_active_power, type = "l", xaxt = 'n', 
      xlab = '', ylab = "Global Active Power (kilowatts)")
axis(1, at=c(which(data$DayOfWeek == "Thu")[1], which(data$DayOfWeek == "Fri")[1], nrow(data)),
     labels=c("Thu", "Fri", "Sat"))  

dev.off()