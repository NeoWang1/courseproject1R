getwd()
setwd("C:\\Users\\ALEX\\Desktop\\coursera")
file<-"./household_power_consumption.txt"
data<-read.table(file, header=TRUE,sep=";")


#select the data as required 
newdate<-as.Date(as.character(data$Date),"%d/%m/%y")
newdata<-subset(data,newdate= as.Date("1/2/2007")|as.Date("2/2/2007"))

#plot the graph
gap<-as.numeric(newdata$Global_active_power)

#start graphic device
png("plot1.png",width=480,height=480)
hist(gap,col="red", ylab="Frequency",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()