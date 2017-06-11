# Plot 1

# Get the Data
DataSource <- "./data/household_power_consumption.txt"
Data <- read.table(DataSource, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Just get Data from Feb 1st and Feb 2nd of 20107
SubSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

# Get the Global Active Power Data
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)

# Uses png function to create the png file with the Width and height needed
png("plot1.png", width=480, height=480)

# Calls hist function to create the graph on the file device openned (png)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Disconnect device
dev.off()