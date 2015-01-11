# Requeriment: 
# install.packages('sqldf')
setwd('~/ExData_Plotting1')
library(sqldf)
df<-read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
df[df=='?'] <- NA
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format='%d/%m/%Y%H:%M:%S')

graphics.off()
par(mfrow = c(2,2))
#1,1
plot(y=df$Global_active_power, x=df$DateTime, xlab = '', ylab = 'Global Active Power (kilowatts)', type='n', cex.axis=0.75, cex.lab=0.75)
lines(y=df$Global_active_power, x=df$DateTime, type='l')
#1,2
plot(y=df$Voltage, x=df$DateTime, xlab = 'datetime', ylab = 'Voltaje', type='n', cex.axis=0.75, cex.lab=0.75)
lines(y=df$Voltage, x=df$DateTime, type='l')
#2,1
plot(y=df$Sub_metering_1, x=df$DateTime, ylab='Energy sub metering', xlab='', type='n', cex.axis=0.75, cex.lab=0.75)
lines(y=df$Sub_metering_1, x=df$DateTime, type='l', col='black')
lines(y=df$Sub_metering_2, x=df$DateTime, type='l', col='red')
lines(y=df$Sub_metering_3, x=df$DateTime, type='l', col='blue')
legend('topright', legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2,col=c("black", "red", "blue"), cex=0.75, bty='n', xjust=1)
#2,2
plot(y=df$Global_reactive_power, x=df$DateTime, xlab='datetime',ylab='Global_reactive_power',  type='n', cex.axis=0.75, cex.lab=0.75)
lines(y=df$Global_reactive_power, x=df$DateTime, type='l')

dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()
