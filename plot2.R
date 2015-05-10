# Load data
source('load_data_househPowerCons.R')

# Open png device
png(filename='plot2.png')

# Make plot
plot(power.df$date.time, power.df$Global_active_power,
     xlab='', ylab='Global Active Power (kilowatts)', type='l')

# Turn off device
dev.off()