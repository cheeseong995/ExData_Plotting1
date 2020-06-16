#Assignment 1 for Module 4: Exploratory Data Analysis
#Plot 1

#read the data ; change the data date and subset the required date.
powerdata <- read.table("household_power_consumption.txt",sep=';',header = TRUE, na.strings ="?")
powerdata$Date <- as.Date( powerdata$Date,format = "%d/%m/%Y")
data_Feb <- subset(powerdata,Date>="2007-02-01" & Date<= "2007-02-02")

#plot the histogram with the required axes and colour.
hist(as.numeric(data_Feb$Global_active_power),xlab="Global Active Power (kilowatts)" ,ylab = "Frequency" , main = "Global Active Power",col="red")

#Copy the image in png format with the required height and width
dev.copy(png,file="plot1.png",height = 480,width = 480)
dev.off()