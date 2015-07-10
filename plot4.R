data <-read.table("household_power_consumption.txt",sep=";",skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=2880)
names(data)<-names(read.table("household_power_consumption.txt",sep=";",nrows=1,header=TRUE))
png(filename="plot4.png")
par(mfrow=c(2,2),mar=c(4,4,4,2),oma=c(2,0,2,0),height=480,width=480)
with(data,{
	plot(data$Global_active_power, type='l',ylab="Global Active Power",xlab="",xaxt='n')
axis(1,at=c(1,1441,2881),labels=c('Thu','Fri','Sat'))
	
	plot(data$Voltage, type='l',ylab="Voltage",xaxt='n',xlab="datetime")
axis(1,at=c(1,1441,2881),labels=c('Thu','Fri','Sat'))
	
	plot(Sub_metering_1,ylab="Energy sub metering",xaxt='n',type='l')
	lines(Sub_metering_2,col="red",type='l')
	lines(Sub_metering_3,col="blue",type='l')
	axis(1,at=c(1,1441,2881),labels=c('Thu','Fri','Sat'))
	legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_1","Sub_metering_1"))
	
	plot(data$Global_reactive_power, type='l',xaxt='n',ylab="Global_reactive_power",xlab="datetime")
axis(1,at=c(1,1441,2881),labels=c('Thu','Fri','Sat'))
	
})
dev.off()