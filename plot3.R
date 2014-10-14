library("data.table")
DT <- fread("data/household_power_consumption.txt")
#dtnew <- DT[, Date:=as.Date(Date)]
#dtnew <- DT[, Time:=strptime(Time,format="%y-%m-%d, %I:%M%p")]
dtnew <- DT[, Global_active_power:=as.numeric(Global_active_power)]
opt <- options("scipen" = 20)
getOption("scipen")
hist(DT$Global_active_power,col="red",main = "Global Active Power",xlab="Global Active power (kilowatts)")