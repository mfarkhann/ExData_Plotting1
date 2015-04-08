#plot4.R
#input csv and select dates 2007-02-01 and 2007-02-02
dat=read.csv("./data/household_power_consumption.txt",as.is=T,
            sep=";",na.strings = "?")
dat=dat[dat$Date %in% c("1/2/2007","2/2/2007"),]

#convert coloumn Date and time to new coloumn time classess (waktu)
dat$waktu=strptime(paste(dat$Date,dat$Time),"%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME","English")
## Open PNG device; create 'plot1.png' in working directory
png(file = "plot4.png")  
op <- par(mfrow = c(2, 2))
plot(dat$waktu,dat$Global_active_power,type="l",
     xlab = NA,
     ylab = "Global Active Power")


plot(dat$waktu,dat$Voltage,type="l",
     xlab = "datetime",
     ylab = "Voltage")

plot(dat$waktu,dat$Sub_metering_1,type="l",
     xlab = NA,
     ylab = "Energy sub metering")
lines(dat$waktu,dat$Sub_metering_2,col="red")
lines(dat$waktu,dat$Sub_metering_3,col="blue")
text_legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright", legend = text_legend,lwd=1,bty="n", col = c("black","red","blue"))

plot(dat$waktu,dat$Global_reactive_power,type="l",
     xlab = "datetime",
     ylab = "Global_reactive_power")
par(op)
dev.off()  ## Close the device
