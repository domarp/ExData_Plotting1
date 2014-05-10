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

png("plot2.png", bg="transparent")
plot(date.time.comb,ifile$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
dev.off()
