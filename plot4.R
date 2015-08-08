# COURSERA
# EXPLORATORY DATA ANALYSIS PROJECT 1
# 08.08.2015

# Sys.setenv(LANG = "en")

# install.packages("chron")
library(chron)
rm(list = ls())

setwd('F:/Damian/coursera/Exploratory Data Analysis/project week 1')

par(mfrow = c(1, 1))

# 1. Read the dataset

data <- read.csv(".//household_power_consumption.txt", na.strings = "?",
                 skip = 66635 , nrows = 2880,
                 header = FALSE, sep = ";",
                 col.names = c("Date", "Time", "Global_active_power",
                               "Global_reactive_power", "Voltage",
                               "Global_intensity", "Sub_metering_1",
                               "Sub_metering_2", "Sub_metering_3"),
                 colClasses = c(rep("character", 2), rep("numeric", 7))) #69517+
# data$Time <- times(data$Time)
# data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$dt <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
# head(data, 3)
# tail(data)
# sum(is.na(data))



# 5. Plot 4

dev.copy(png, "plot4.png")

par(mfrow = c(2, 2))

with(data, plot(dt, Global_active_power, type = "l", xlab = "",
                ylab = "Global Active Power (kilowatts)"))

with(data, plot(dt, Voltage, type = "l", xlab = "datetime",
                ylab = "Voltage"))

with(data, plot(dt, Sub_metering_1, type = "l", col = "black", 
                ylab = "Energy sub metering", xlab = ""))
with(data, lines(dt, Sub_metering_2, type = "l", col = "red"))
with(data, lines(dt, Sub_metering_3, type = "l", col = "blue"))
legend("topright", names(data)[7:9],
       col = c("black", "red", "blue"), lwd = 2, bty = "n", cex = 0.8)

with(data, plot(dt, Global_reactive_power, type = "l", xlab = "datetime",
                lwd = 0.5))

dev.off()