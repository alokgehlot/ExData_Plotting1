# Load Dataset
entireData<-read.csv("./R/Data/household_power_consumption.txt",sep=";",na.strings="?",check.names=F,nrows=2075259)

#Subset for required dates
data<-subset(entireData,Date %in% c("1/2/2007","2/2/2007"))

#plot the first graph plot1.png for Global Active Power
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency",col="Red")

#save the plot as png file.
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

#date column as Date 
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

datetime<-paste(as.Date(data$Date),data$Time)

data$DateTime<-as.POSIXct(datetime)

# plot 2
with(data,{plot(Global_active_power~DateTime,type="l",ylab="Global Active Power (kilowatts)",xlab="")})

#save the plot as png file.
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

#Plot 3
with(data, {plot(Sub_metering_1~DateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save the plot as png file.
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

#Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {plot(Global_active_power~DateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~DateTime, type="l",ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~DateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type="l",ylab="Global Rective Power (kilowatts)",xlab="")
})

#save the plot as png file.
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()




