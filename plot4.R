# Set working directory
setwd("~/Data Science/Module 4 - Expolatory Data Analysis/Wk1/household_power_consumption")

# Load data set
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# Convert Data variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data for dates
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert Date and Time
data$date_time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$date_time <- as.POSIXct(data$date_time)

# Open png file device
png("plot4.png", width=480, height=480)

# Set parameters
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

# Draw plot
with(data, { plot(Global_active_power~date_time, type="l", 
               ylab="Global Active Power (kilowatts)", xlab="")
             plot(Voltage~date_time, type="l", ylab="Voltage (volt)", xlab="datetime")
             plot(Sub_metering_1 ~ date_time, type = "l", 
                ylab = "Energy sub metering", xlab = "")
            lines(Sub_metering_2~date_time,col='Red')
            lines(Sub_metering_3~date_time,col='Blue')

            legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
                   legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
            plot(Global_reactive_power~date_time, type="l", 
                ylab="Global Rective Power (kilowatts)",xlab="datetime")})

# Close png file device
dev.off()
