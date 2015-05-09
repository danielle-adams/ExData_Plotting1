plot4 <- function()
{
        library(sqldf)
        data <- read.csv.sql(file = "household_power_consumption.txt", 
                             sep = ";", 
                             sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                             header = TRUE, row.names = NULL,
                             colClasses = c("character","character",
                                            "numeric","numeric","numeric","numeric",
                                            "numeric","numeric","numeric"))
        Sys.setlocale("LC_TIME", "English")
        data$DateAndTime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y%H:%M:%S")  
        
        png(filename = "plot4.png", width = 480, height = 480)
        par(mfrow = c(2,2))
        plot(data$DateAndTime,data$Global_active_power,
             type = "l",col = "black",
             xlab = "",
             ylab = "Global Active Power")
        plot(data$DateAndTime,data$Voltage,
             type = "l",col = "black",
             xlab = "date time",
             ylab = "Voltage")
        
        plot(data$DateAndTime,data$Sub_metering_1,
             type = "l",col = "black",
             xlab = "",
             ylab = "Energy sub metering")
        lines(data$DateAndTime,data$Sub_metering_2,
              col = "red")
        lines(data$DateAndTime,data$Sub_metering_3,
              col = "blue")
        legend("topright",lty = 1, bty = "n",
               col = c("black","red","blue"), 
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
        plot(data$DateAndTime,data$Global_reactive_power,
             type = "l",col = "black",
             xlab = "date time",
             ylab = "Global_reactive_power")
        
        dev.off()
        
}