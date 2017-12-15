# Set working directory
setwd("~/Data Science/Module 4 - Expolatory Data Analysis/Wk1/household_power_consumption")

# Load data set
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# Convert Date variable to Date Class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data for dates
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert Date and Time
data$date_time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$date_time <- as.POSIXct(data$date_time)

# Open png file device
png("plot2.png", width=480, height=480)

# Draw plot
with(data, plot(Global_active_power~date_time, type="l", 
                ylab="Global Active Power (kilowatts)", xlab=""))

# Close png file device
dev.off()
