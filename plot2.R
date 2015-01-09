# If the file is not there, we will download and extract from the zip file.  the File it's huge so just download it if we need it
if (!file.exists('household_power_consumption.zip')) {
  # Download file
  download.file(url='https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile='household_power_consumption.zip', method='curl')
  # Unzip file
  unzip('household_power_consumption.zip')
}



data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# Subset data- Let's do this first so we don't need to convert dates in all rows we will discard anyway
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Let's convert the dates
data$DateTime <- strptime(paste(data$Date, data$Time), format= "%d/%m/%Y %H:%M:%S")

#Let's creata the first plot:

png(file = "plot2.png", width = 480, height = 480)
plot(data[,c('DateTime','Global_active_power')],type='l',xlab='',ylab='Global Active Power(kilowatts)')
dev.off() #close the dev
