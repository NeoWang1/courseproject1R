setwd("C:\\Users\\ALEX\\Desktop\\coursera")


file <- "./household_power_consumption.txt"
data <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#define components
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(subSetData$Global_active_power)
sm1<-as.numeric(subSetData$Sub_metering_1)
sm2<-as.numeric(subSetData$Sub_metering_2)
sm3<-as.numeric(subSetData$Sub_metering_3)

#plot the data
png("plot3.png",width=480,height=480)
plot(datetime,sm1,type="l",ylab="Energy Submetering", xlab="",col="black")
lines(datetime,sm2,type="l",col="red")
lines(datetime,sm3,type="l",col="blue")

#legend
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=1,lwd=2,col=c("black","red", "blue"))
dev.off()