# Set working directory
setwd("~/Data Science/Module 4 - Expolatory Data Analysis/Wk1/household_power_consumption")

# Load dataset
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# Convert Date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data for dates 
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Open png file device
png("plot1.png", width=480, height=480)

# Draw plot
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Close png file device
dev.off()
