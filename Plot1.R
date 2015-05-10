 ## Getting full dataset 

 full_dataset <- read.csv("data/household_power_consumption.txt", header=T, sep=';', na.strings="?",  
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
 full_dataset$Date <- as.Date(full_dataset$Date, format="%d/%m/%Y") 
 

 ## Subsetting the data required for this assignment and remove the complete data from memory

 data <- subset(full_dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
 rm(full_dataset) 
 

 ## Converting dates 
 datetime <- paste(as.Date(data$Date), data$Time) 
 data$Datetime <- as.POSIXct(datetime) 
 
 
 ## Plot 1 
 hist(data$Global_active_power, main="Global Active Power",  
      xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 
 
 
 ## Saving to file 
 dev.copy(png, file="plot1.png", height=480, width=480) 
 dev.off() 
