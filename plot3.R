library("sqldf");
temp <- tempfile();
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";
targetFile <- "household_power_consumption.txt";
download.file(fileURL, temp);
unz(temp, "household_power_consumption.txt");
dataset <- read.csv.sql(targetFile, sql="SELECT * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";");
unlink(temp);
dataset$DateTime <- paste(dataset$Date, dataset$Time);
dataset$DateTime <- strptime(dataset$DateTime, "%d/%m/%Y %H:%M:%S");                      
png(filename="plot3.png",width=480,height=480,units="px");
plot(dataset$DateTime, dataset[,7], col="black", type="l", xlab="",ylab="Energy sub metering");
lines(dataset$DateTime, dataset[,8], col="red");
lines(dataset$DateTime, dataset[,9], col="blue");
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1),lwd=c(2.5,2.5,2.5), col=c("black","red","blue"))
dev.off();
