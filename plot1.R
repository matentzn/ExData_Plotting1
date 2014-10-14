library("data.table")
DT <- fread("data/household_power_consumption.txt")
DT[, Date:=as.Date(Date,format = "%d/%m/%Y")]
DT[, Global_active_power:=as.numeric(Global_active_power)]
data_lb <- subset(DT, Date >= as.Date("2007-02-01"))
data <- subset(data_lb, Date <= as.Date("2007-02-02") )
#dtnew <- DT[, Time:=strptime(Time,format="%y-%m-%d, %I:%M%p")]
opt <- options("scipen" = 20)
getOption("scipen")
png(filename = "plot1.png")
hist(data$Global_active_power,col="red",main = "Global Active Power",xlab="Global Active power (kilowatts)")
dev.off()