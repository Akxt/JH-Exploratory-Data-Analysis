## Reading Dataset
hpcData <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpcData$Date <- as.Date(hpcData$Date, format="%d/%m/%Y")

## Subsetting the Dataset
hpcDataMin <- subset(hpcData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpcData)

## Converting dates
hpcDataMinDate <- paste(as.Date(hpcDataMin$Date), hpcDataMin$Time)
hpcDataMin$Datetime <- as.POSIXct(hpcDataMinDate)

## Plot 1
hist(hpcDataMin$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving the file
dev.copy(png, file="./plot1.png", height=480, width=480)
dev.off()
