plot2 <- function()
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
        
        png(filename = "plot2.png", width = 480, height = 480)
        plot(data$DateAndTime,data$Global_active_power,
             type = "l",
             xlab = "",
             ylab="Global Active Power(Kilowatts)")
        dev.off()
}