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

dev.print(png, file = "plot3.png", width = 480, height = 480)
png(file = "plot3.png")
plot(dat$Date, dat$Sub_metering_1, type='l', 
     ylab = 'Energy sub metering', xlab = '', col='gray26', ylim = c(0,38))

#par(new=TRUE)

lines(dat$Date, dat$Sub_metering_2, type='l', 
     ylab = 'Energy sub metering', xlab = '', col='red', ylim = c(0,38))
#par(new=TRUE)
lines(dat$Date, dat$Sub_metering_3, type='l', 
     ylab = 'Energy sub metering', xlab = '', col='blue', ylim = c(0,38))

legend("topright",lty=1,lwd=2,col=c("black","red","blue"),
             legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
                cex = 0.75, box.lty  = 0, y.intersp = 0.75)
box()
dev.off()
