# This code is for exploratory data analysis assignment 1

datRaw = read.table("F:/ExData_Plotting1/household_power_consumption.txt",header=TRUE,sep=";",dec=".");
colnames(datRaw) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                      "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3");
datRaw<-na.omit(datRaw)
datRaw$Date <- as.Date(datRaw$Date,"%d/%m/%Y");
datRaw$Time <- as.POSIXlt(datRaw$Time,"%H:%M:%S")
datRaw$Global_active_power<-as.numeric(as.character(datRaw$Global_active_power))
datRaw$Global_reactive_power<-as.numeric(as.character(datRaw$Global_reactive_power))
datRaw$Voltage<-as.numeric(as.character(datRaw$Voltage))
datRaw$Global_intensity<-as.numeric(as.character(datRaw$Global_intensity))
datRaw$Sub_metering_1<-as.numeric(as.character(datRaw$Sub_metering_1))
datRaw$Sub_metering_2<-as.numeric(as.character(datRaw$Sub_metering_2))
datRaw$Sub_metering_3<-as.numeric(as.character(datRaw$Sub_metering_3))
datMin <- as.Date("01-02-2007","%d-%m-%Y");
datMax <- as.Date("02-02-2007","%d-%m-%Y");
datLim <- datRaw[(datRaw$Date>=datMin) & (datRaw$Date<=datMax),];
datLim$datetime <- as.POSIXct(paste(datLim$Date,datLim$Time),tz="UCT")

png(filename = "F:/ExData_Plotting1/plot2.png",width = 480, height = 480)
plot(x=datLim$datetime,y=datLim$Global_active_power,ylab="Global Active Power (kilowatts)",type="l")
dev.off()