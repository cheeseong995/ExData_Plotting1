#Assignment 1 for Module 4: Exploratory Data Analysis
#Plot 3

#read the data ; change the data date and subset the required date.
powerdata <- read.table("household_power_consumption.txt",sep=';',header = TRUE, na.strings ="?")
powerdata$Date <- as.Date( powerdata$Date,format = "%d/%m/%Y")
data_Feb <- subset(powerdata,Date>="2007-02-01" & Date<= "2007-02-02")

#Format the data to plot
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_Feb$timetemp <- paste(data_Feb$Date, data_Feb$Time)
data_Feb$datetime <- strptime(data_Feb$timetemp, format = "%Y-%m-%d %H:%M:%S")

#Plot 
plot(x = data_Feb$datetime , y=data_Feb$Sub_metering_1,xlab="",ylab="Energy sub meeting",col="black",type="l")
lines(x = data_Feb$datetime , y=data_Feb$Sub_metering_2,col="red",type="l")
lines(x = data_Feb$datetime , y=data_Feb$Sub_metering_3,col="blue",type="l")
legendfont <- par(cex = 1) #Adjust font to fit the top right-hand corner perfectly
legend("topright" , lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Copy the image in png format with the required height and width
dev.copy(png,file="plot3.png",height = 480,width = 480)
dev.off()