plot3 <- function()
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

        png(filename = "plot3.png", width = 480, height = 480)
        plot(data$DateAndTime,data$Sub_metering_1,
             type = "l",col = "black",
             xlab = "",
             ylab = "Energy sub metering")
        lines(data$DateAndTime,data$Sub_metering_2,
             col = "red")
        lines(data$DateAndTime,data$Sub_metering_3,
             col = "blue")
        legend("topright",lty = 1, 
               col = c("black","red","blue"), 
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        dev.off()
}