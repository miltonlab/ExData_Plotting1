# Requeriments: 
# 1) download and uncompress the dataset
# 2) install.packages('sqldf')

setwd('~/ExData_Plotting1')
library(sqldf)
Sys.setlocale(category = "LC_TIME", locale = "C")
df<-read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
df[df=='?'] <- NA
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format='%d/%m/%Y%H:%M:%S')
graphics.off()
plot(y=df$Global_active_power, x=df$DateTime, xlab = '', ylab = 'Global Active Power (kilowatts)', type='n', cex.axis=0.75, cex.lab=0.75)
lines(y=df$Global_active_power, x=df$DateTime, type='l')
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()