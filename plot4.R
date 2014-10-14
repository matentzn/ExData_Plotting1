DT <- fread("data/household_power_consumption.txt")
dtnew <- DT[, Date:=as.Date(Date)]
dtnew <- DT[, Time:=strptime(Time,format="%y-%m-%d, %I:%M%p")]