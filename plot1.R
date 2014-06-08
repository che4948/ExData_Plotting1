fname <- "C:/Users/Hui/Documents/Coursera_Exploratory Data Analysis/HW 1/household_power_consumption.txt" #define the file name
df_date_raw <- read.table(fname, sep=";", header=TRUE, colClasses=c(NA, rep("NULL", nc-1))) #read the Date column only
head(df_date_raw) #sanity check
df_date <- as.Date(df_date_raw$Date, "%d/%m/%Y") #convert date format
n_startdate <- which.max(df_date >= "2007-02-01") #find the beginning of the dataset
n-startdate
n_enddate <- which.max(df_date >= "2007-02-03") #find the end of the dataset
n_enddate
df_data <- read.table(fname, header=FALSE, col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_inten", "Sm1", "Sm2","Sm3"), sep=";", skip=66637, nrows=2880) #load the dataset
head(df_data) #sanity check
tail(df_data) #sanity check
win.graph() #open an device
hist(df_data$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png") #save the plot as .png
dev.off() #shut off the device






