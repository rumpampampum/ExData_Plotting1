## Plot 4 code

## Step 1: Read and load data to memory
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE)

## Step 2: Make a column with the converted date format
data$DateConverted <- strptime(as.character(data$Date), "%d/%m/%Y")

## Step 3: Subset data needed
data <- data[(data$DateConverted >= "2007-02-01") & (data$DateConverted <= "2007-02-02"),]

## Step 4: Make a column with combined date and time
data$DateAndTime <- strptime(paste(data$Date, data$Time,sep=" "), "%d/%m/%Y %H:%M:%S")

## Step 5: Remove scientific format of Global_active_power
data$Global_active_power <- as.numeric(format(data$Global_active_power, scientific=F))

## Step 6: Generate the plot
par(mfrow=c(2,2))
with(data, {
  plot(data$DateAndTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  plot(data$DateAndTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(data$DateAndTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(data$DateAndTime, data$Sub_metering_2, col="red")
  lines(data$DateAndTime, data$Sub_metering_3, col="blue")
  legend("topright", lty=1, lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "))
  plot(DateAndTime, Global_reactive_power, type="l", xlab="datetime")
})


## Step 7: Create a png file of the plot
dev.copy(png,file="plot4.png")

## Step 8: Close graphic device
dev.off()