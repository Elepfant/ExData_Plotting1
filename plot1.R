# Load data
source('load_data_househPowerCons.R')

# Open png device
png(filename='plot1.png')

# Make plot
hist(power.df$Global_active_power, main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', col='red')

# Turn off device
dev.off()