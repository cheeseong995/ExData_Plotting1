#Assignment 1 for Module 4: Exploratory Data Analysis
#Plot 2

#read the data ; change the data date and subset the required date.
powerdata <- read.table("household_power_consumption.txt",sep=';',header = TRUE, na.strings ="?")
powerdata$Date <- as.Date( powerdata$Date,format = "%d/%m/%Y")
data_Feb <- subset(powerdata,Date>="2007-02-01" & Date<= "2007-02-02")

#Format the data to plot
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_Feb$timetemp <- paste(data_Feb$Date, data_Feb$Time)
data_Feb$datetime <- strptime(data_Feb$timetemp, format = "%Y-%m-%d %H:%M:%S")

#plot
plot(x = data_Feb$datetime, y = data_Feb$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#Copy the image in png format with the required height and width
dev.copy(png,file="plot2.png",height = 480,width = 480)
dev.off()