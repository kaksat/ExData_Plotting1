# COURSERA
# EXPLORATORY DATA ANALYSIS PROJECT 1
# 08.08.2015
Sys.setlocale("LC_TIME", "English")
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


# 3. Plot 2

dev.copy(png, "plot2.png")
with(data, plot(dt, Global_active_power, type = "l", xlab = "",
                ylab = "Global Active Power (kilowatts)"))
dev.off()