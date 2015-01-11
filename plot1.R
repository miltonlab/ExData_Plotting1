# Requeriment: 
# install.packages('sqldf')
library(sqldf)
setwd('~/ExData_Plotting1')
df<-read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
graphics.off()
hist(df$Global_active_power, xlab = 'Global Active Power (kilowatts)', yaxp=c(0,1200,6), col='red', main='Global Active Power', cex.axis=0.75, cex.lab=0.75)
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
