# Plot 3
# Ensure the unzipped file is in your working directory

data <- read.table("household_power_consumption.txt", 
                   header=TRUE, sep=";", stringsAsFactors=FALSE)

#fix the date and times
library(dplyr)
data <- mutate(data,DateTime=paste(Date,Time, sep=" "))
data$DateTime <- strptime(data$DateTime,"%d/%m/%Y %T")
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#subset based on the date range
subdata <- data[(data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02")),]

#copy to a png file in working directory
dev.copy(png,file="Plot3.png",width=480, height=480)

#plot
with (subdata, plot(subdata$DateTime, subdata$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="",cex.lab=0.75, 
                    cex.axis=0.75))
with (subdata, lines(subdata$DateTime, subdata$Sub_metering_2, col="red"))
with (subdata, lines(subdata$DateTime, subdata$Sub_metering_3, col="blue"))

legend("topright", colnames(subdata[,(7:9)]),lty=1, col=c("black","red","blue"), cex=0.75)

dev.off()
# finish





