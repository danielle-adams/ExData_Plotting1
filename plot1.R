plot1 <- function()
{
        library(sqldf)
        data <- read.csv.sql(file = "household_power_consumption.txt", 
                            sep = ";", 
                            sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                            header = TRUE, row.names = NULL,
                            colClasses = c("character","character",
                                           "numeric","numeric","numeric","numeric",
                                           "numeric","numeric","numeric"))
        
        png(filename = "plot1.png", width = 480, height = 480)
        hist(data$Global_active_power,
             col = 'red',
             main = "Global Active Power",
             xlab = "Global Active Power(kilowatts)",
             ylab = "Frequency")
        dev.off()
}