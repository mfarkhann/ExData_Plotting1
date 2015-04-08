#plot2.R
#input csv and select dates 2007-02-01 and 2007-02-02
dat=read.csv("./data/household_power_consumption.txt",as.is=T,
             sep=";",na.strings = "?")
dat=dat[dat$Date %in% c("1/2/2007","2/2/2007"),]

#convert coloumn Date and time to new coloumn time classess (waktu)
dat$waktu=strptime(paste(dat$Date,dat$Time),"%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME","English")

## Open PNG device; create 'plot1.png' in working directory
png(file = "plot2.png")  
## Create plot and send to a file
plot(dat$waktu,dat$Global_active_power,type="l",
     xlab = NA,
     ylab = "Global Active Power (kilowatt)")

dev.off()  ## Close the device
