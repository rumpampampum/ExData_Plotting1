## Plot 1 code

## Step 1: Read and load data to memory
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE)

## Step 2: Make a column with the converted date format
data$DateConverted <- strptime(as.character(data$Date), "%d/%m/%Y")

## Step 3: Subset data needed
data <- data[(data$DateConverted >= "2007-02-01") & (data$DateConverted <= "2007-02-02"),]

## Step 4: Remove scientific format of Global_active_power
data$Global_active_power <- as.numeric(format(data$Global_active_power, scientific=F))

## Step 5: Generate the plot
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

## Step 6: Create a png file of the plot
dev.copy(png,file="plot1.png")

## Step 7: Close graphic device
dev.off()