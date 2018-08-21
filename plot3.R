## Plot 3 code

## Step 1: Read and load data to memory
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE)

## Step 2: Make a column with the converted date format
data$DateConverted <- strptime(as.character(data$Date), "%d/%m/%Y")

## Step 3: Subset data needed
data <- data[(data$DateConverted >= "2007-02-01") & (data$DateConverted <= "2007-02-02"),]

## Step 4: Make a column with combined date and time
data$DateAndTime <- strptime(paste(data$Date, data$Time,sep=" "), "%d/%m/%Y %H:%M:%S")

## Step 5: Generate the plot
with(data, plot(data$DateAndTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(data$DateAndTime, data$Sub_metering_2, col="red")
lines(data$DateAndTime, data$Sub_metering_3, col="blue")
legend("topright", lty=1, lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "))

## Step 6: Create a png file of the plot
dev.copy(png,file="plot3.png")

## Step 7: Close graphic device
dev.off()