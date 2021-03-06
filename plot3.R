# Requeriments: 
# 1) download and uncompress the dataset
# 2) install.packages('sqldf')

setwd('~/ExData_Plotting1')
library(sqldf)
df<-read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
df[df=='?'] <- NA
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format='%d/%m/%Y%H:%M:%S')
graphics.off()
plot(x=df$DateTime, y=df$Sub_metering_1, ylab='Energy sub metering', xlab='', type='n', cex.axis=0.75, cex.lab=0.75)
lines(y=df$Sub_metering_1, x=df$DateTime, type='l', col='black')
lines(y=df$Sub_metering_2, x=df$DateTime, type='l', col='red')
lines(y=df$Sub_metering_3, x=df$DateTime, type='l', col='blue')
legend('topright', legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2,col=c("black", "red", "blue"), cex=0.75, xjust=1)
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()
