setwd("C:\\Users\\ALEX\\Desktop\\coursera")
file<-"./household_power_consumption.txt"
data<-read.table(file, header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
#select the data as required 
newdate<-as.Date(as.character(data$Date),"%d/%m/%y")
newdata<-subset(data,newdate= as.Date("1/2/2007")|as.Date("2/2/2007"))

datetime<-strptime(paste(newdata$Date,newdata$Time, sep=""), "%d/%m%y %H:%M:%S")
gap<-as.numeric(newdata$Global_active_power)
gap2<-na.omit(gap)
#gap3<-gap2+0*datetime

png("plot2.png",width=480,height=480)
plot(datetime,gap2,type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()