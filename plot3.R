# Plot 3

# Get the Data
DataFile <- "./Data/household_power_consumption.txt"
Data <- read.table(DataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Just get Data from Feb 1st and Feb 2nd of 20107
SubSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

# Get dates and time via strptime function
DateTime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Get the Global Active Power Data
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)

# Divide the Enrergy Meterings for plotting later
EnergySubMetering1 <- as.numeric(SubSetData$Sub_metering_1)
EnergySubMetering2 <- as.numeric(SubSetData$Sub_metering_2)
EnergySubMetering3 <- as.numeric(SubSetData$Sub_metering_3)

# Uses png function to create the png file with the Width and height needed
png("plot3.png", width=480, height=480)

# Calls plot function to create the graph on the file device openned (png)
plot(DateTime, EnergySubMetering1, type="l", ylab="Energy EnergySubMetering", xlab="")

# Edit the plot adding color lines and legend
lines(DateTime, EnergySubMetering2, type="l", col="red")
lines(DateTime, EnergySubMetering3, type="l", col="blue")
legend("topright", c("SubMetering_1", "SubMetering_2", "SubMetering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Disconnect device
dev.off()