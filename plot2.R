library(dplyr)
library(lubridate)
library(ggplot2)


dat<- read.csv(file = './household_power_consumption.txt', header = TRUE, 
               sep = ';', na.strings = '?')


#a<-((2080000*9*(2)^2+4*2080000)/1024^3) approximate size
#format(object.size(dat), units = 'GB')


dat$Date<-strptime(paste(dat$Date, dat$Time), format = "%d/%m/%Y %H:%M:%S")
dat<- filter(dat, (dat$Date>=as.Date('2007-02-01')  & 
                     dat$Date<=as.Date('2007-02-03') ))


dev.print(png, file = "plot2.png", width = 480, height = 480)

png(file = "plot2.png")

plot(dat$Date, dat$Global_active_power, type='l', 
     ylab = 'Global Active Power (Kilowats )', xlab = '')
dev.off()


