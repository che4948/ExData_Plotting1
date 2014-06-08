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

date_and_time<-paste(df_data$Date, df_data$Time)
df_data_weekday<-strptime(date_and_time, "%d/%m/%Y %H:%M:%S") #get the weekday name

win.graph()
plot(df_data_weekday,df_data$Sm1,"n", ylab="Energy sub metering", xlab="") #set up the plot frame
points(df_data_weekday,df_data$Sm1, type="l")
points(df_data_weekday,df_data$Sm2, type="l", col="red")
points(df_data_weekday,df_data$Sm3, type="l", col="blue") #add datasets
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1 , cex=1,col=c("black","red","blue"))

dev.copy(png,file="plot3.png")

dev.off()

