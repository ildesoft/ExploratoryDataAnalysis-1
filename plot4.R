# Plot 4

# Get the Data
DataFile <- "./Data/household_power_consumption.txt"
Data <- read.table(DataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Just get Data from Feb 1st and Feb 2nd of 20107
SubSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

# Get dates and time via strptime function
DateTime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Get the Global Active Power Data, Global Reactive Data and Voltage
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)
GlobalReactivePower <- as.numeric(SubSetData$Global_reactive_power)
Voltage <- as.numeric(SubSetData$Voltage)

# Divide the Enrergy Meterings for plotting later
EnergySubMetering1 <- as.numeric(SubSetData$Sub_metering_1)
EnergySubMetering2 <- as.numeric(SubSetData$Sub_metering_2)
EnergySubMetering3 <- as.numeric(SubSetData$Sub_metering_3)

# Uses png function to create the png file with the Width and height needed
png("plot4.png", width=480, height=480)

# Uses par function to create print the graphs in 2 columns and 2 rows
par(mfrow = c(2, 2)) 

# Calls plot function to create the graphs on the file device openned (png)
plot(DateTime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(DateTime, Voltage, type="l", xlab="DateTime", ylab="Voltage")
plot(DateTime, EnergySubMetering1, type="l", ylab="Energy EnergySubMetering", xlab="")

# Edit the third plot adding color lines and legend
lines(DateTime, EnergySubMetering2, type="l", col="red")
lines(DateTime, EnergySubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Plot the fourth graph after editing the 3rd one
plot(DateTime, GlobalReactivePower, type="l", xlab="DateTime", ylab="Global_reactive_power")

# Disconnect device
dev.off()