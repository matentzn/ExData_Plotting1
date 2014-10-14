library("data.table")
DT <- fread("data/household_power_consumption.txt")
DT[, Date:=as.Date(Date,format = "%d/%m/%Y")]
DT[, Global_active_power:=as.numeric(Global_active_power)]
data_lb <- subset(DT, Date >= as.Date("2007-02-01"))
data <- subset(data_lb, Date <= as.Date("2007-02-02") )
#dtnew <- DT[, Time:=strptime(Time,format="%y-%m-%d, %I:%M%p")]
opt <- options("scipen" = 20)
getOption("scipen")
data[, Weekday:=format(Date , "%a")]
data[order(Global_active_power)]
#dtnew <- DT[, Time:=strptime(Time,format="%y-%m-%d, %I:%M%p")]
png(filename = "plot2.png")
plot(data$Global_active_power,type="l",lwd=1,
     xaxt="n",
     xlab="",ylab="Global Actice Power (kilowatts)")
axis(1,at=1:length(data$Date),labels=format(data$Date , "%a"),tck=-0.001)
dev.off()