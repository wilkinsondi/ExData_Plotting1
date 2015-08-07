# Plot 2
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

#convert target variable to numeric
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

#copy to a png file in working directory
dev.copy(png,file="Plot2.png",width=480, height=480)

#plot
plot(subdata$DateTime,subdata$Global_active_power, 
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)",
     cex.lab=0.75, 
     cex.axis=0.75)

dev.off()
# finish





