ifile <- read.csv('household_power_consumption.txt',sep=";",nrows = 10)
colclass <- sapply(ifile, class)
colclass[1:2] <- "character"
ifile <- read.csv('household_power_consumption.txt',sep=";",nrows = 2075300,colClasses = colclass, header=TRUE, na.strings="?")

dDate.1 <- strptime("01/02/2007", "%d/%m/%Y")
dDate.2 <- strptime("02/02/2007", "%d/%m/%Y")
ifile.in.date.format <- strptime(ifile$Date, "%d/%m/%Y")
filter.ind <- which(ifile.in.date.format == dDate.1)
filter.ind <- c(filter.ind, which(ifile.in.date.format == dDate.2))

ifile <- ifile[filter.ind,]
date.time.comb <- strptime(paste(ifile$Date,ifile$Time),"%d/%m/%Y %H:%M:%s")

png("plot4.png", bg="transparent")

par(mfrow=c(2,2))

plot(date.time.comb,ifile$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")

plot(date.time.comb,ifile$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(date.time.comb,ifile$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(date.time.comb,ifile$Sub_metering_2,type="l",col = "red")
lines(date.time.comb,ifile$Sub_metering_3,type="l",col = "blue")
legend("topright",bty = "n",c("Sub_metering_1","Sub_metering_2","Sub_metering_2"),lty = c(1,1,1),col=c("black","red","blue"))

plot(date.time.comb,ifile$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()
