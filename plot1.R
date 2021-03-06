library("sqldf");
temp <- tempfile();
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip";
targetFile <- "household_power_consumption.txt";
download.file(fileURL, temp);
unz(temp, "household_power_consumption.txt");
dataset <- read.csv.sql(targetFile, sql="SELECT * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE, sep = ";");
unlink(temp);
png(filename="plot1.png",width=480,height=480,units="px");
hist(dataset[,3], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)");
dev.off();
