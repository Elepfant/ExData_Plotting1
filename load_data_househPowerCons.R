library(lubridate)

# If cleaned data file does not exist, process data and create it
if (!file.exists('power-data.rds')) {
  if (file.exists('household_power_consumption.txt')) {
    # Read data into a table with appropriate classes
    power.df <- read.table('household_power_consumption.txt', header=TRUE,
                           sep=';', na.strings='?',
                           colClasses=c(rep('character', 2), 
                                        rep('numeric', 7)))    
    # Convert date/timestamp
    power.df$Date <- dmy(power.df$Date)
    power.df$Time <- hms(power.df$Time)   
    # Reduce data frame
    start <- ymd('2007-02-01')
    end <- ymd('2007-02-02')
    power.df <- subset(power.df, year(Date) == 2007 & 
                         month(Date) == 2 &
                         (day(Date) == 1 | day(Date) == 2))    
    # Combine date and time
    power.df$date.time <- power.df$Date + power.df$Time   
    # Save file
    saveRDS(power.df, file='power-data.rds')
  }
} else {
  power.df <- readRDS('power-data.rds')
}