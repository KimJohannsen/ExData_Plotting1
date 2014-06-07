#Import data
household_power_consumption <- read.csv("~/2.Analytics/Coursera/Expoloratory Data Analysis/exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE,sep=";",dec = ".",stringsAsFactors = FALSE)

#Subsetting data for exercise
data <- household_power_consumption[which(household_power_consumption$Date =="1/2/2007" |household_power_consumption$Date =="2/2/2007"),]

#Fixing variable formats
data[, 3]  <- as.numeric(data[, 3])  
data[, 4]  <- as.numeric(data[, 4])  
data[, 5]  <- as.numeric(data[, 5])  
data[, 6]  <- as.numeric(data[, 6])  
data[, 7]  <- as.numeric(data[, 7])  
data[, 8]  <- as.numeric(data[, 8])  
data[, 1]  <- as.Date(data[, 1],format="%d/%m/%Y")

#Creating DateTime variable for plots
as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

#plot to PNG format
png(plot2.png="~/2.Analytics/Coursera/Expoloratory Data Analysis/Week1",width=480,height=480)
plot(as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S"),data$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()
