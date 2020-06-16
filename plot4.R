#Assignment 1 for Module 4: Exploratory Data Analysis
#Plot 4

#read the data ; change the data date and subset the required date.
powerdata <- read.table("household_power_consumption.txt",sep=';',header = TRUE, na.strings ="?")
powerdata$Date <- as.Date( powerdata$Date,format = "%d/%m/%Y")
data_Feb <- subset(powerdata,Date>="2007-02-01" & Date<= "2007-02-02")

#Format the data to plot
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_Feb$timetemp <- paste(data_Feb$Date, data_Feb$Time)
data_Feb$datetime <- strptime(data_Feb$timetemp, format = "%Y-%m-%d %H:%M:%S")

#plot 
par(mfrow = c(2,2))
plot(x=data_Feb$datetime,y=data_Feb$Global_active_power, type="l", xlab = "" ,ylab = "Global Active Power" ,col="black")
plot(x = data_Feb$datetime, y = data_Feb$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(x = data_Feb$datetime , y=data_Feb$Sub_metering_1,xlab="",ylab="Energy sub meeting",col="black",type="l")
lines(x = data_Feb$datetime , y=data_Feb$Sub_metering_2,col="red",type="l")
lines(x = data_Feb$datetime , y=data_Feb$Sub_metering_3,col="blue",type="l")
legendfont <- par(cex = 0.5) #Adjust the font to fit the png perfectly
legend("topright" , lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(x = data_Feb$datetime , y = data_Feb$Global_reactive_power,type ="l", xlab = "datetime" ,ylab="Global_reactive_power")

#Copy the image in png format with the required height and width
dev.copy(png,file="plot4.png",height = 480,width = 480)
dev.off()