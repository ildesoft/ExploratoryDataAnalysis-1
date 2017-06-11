# Plot 2

# Get the Data
DataSource <- "./Data/household_power_consumption.txt"
Data <- read.table(DataSource, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Just get Data from Feb 1st and Feb 2nd of 20107
SubSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

# Get dates and time via strptime function
DateTime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Get the Global Active Power Data
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)

# Uses png function to create the png file with the Width and height needed
png("plot2.png", width=480, height=480)

# Calls plot function to create the graph on the file device openned (png)
plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Disconnect device
dev.off()