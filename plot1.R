#plot1.R
#input csv and select dates 2007-02-01 and 2007-02-02
dat=read.csv("./data/household_power_consumption.txt",as.is=T,
             sep=";",na.strings = "?")
dat=dat[dat$Date %in% c("1/2/2007","2/2/2007"),]

## Open PNG device; create 'plot1.png' in working directory
png(file = "plot1.png")  
## Create plot and send to a file
hist(dat$Global_active_power,
     main="Global Active Power",
     xlab = "Global Active Power (kilowatt)",col="red")
dev.off()  ## Close the device
