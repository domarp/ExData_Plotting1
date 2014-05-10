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

png("plot1.png", bg="transparent")
hist(ifile$Global_active_power, col="red",xlab="Global Active Power(kilowatts)", main="Global Active Power")
dev.off()
