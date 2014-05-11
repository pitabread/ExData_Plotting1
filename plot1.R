### Plotting histogram of Global Active Power - plot 1
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


### Open graphical device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

### Histogram of Global Active Power
hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()