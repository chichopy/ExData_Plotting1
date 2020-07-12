library(dplyr)
library(lubridate)

dat<- read.csv(file = './household_power_consumption.txt', header = TRUE, 
               sep = ';', na.strings = '?')

#a<-((2080000*9*(2)^2+4*2080000)/1024^3) approximate size
format(object.size(dat), units = 'GB')



dat$Date<-as.Date(dat$Date, format = '%d/%m/%Y')
dat<- filter(dat, (dat$Date>=as.Date('2007-02-01') & dat$Date<=as.Date('2007-02-02') ))


dev.print(png, file = "myplot.png", width = 480, height = 480)

png(file = "plot1.png")

hist(dat$Global_active_power, col='red', main = 'Global Active Power',
     xlab = 'Global Active Power (Kilowatts)')

dev.off()
