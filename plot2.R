# plot2.R
# Code R for Exploratory Data Analysis - Coursera - week 4 - Project - Question 1

## The overall goal of this assignment is to explore 
#  the National Emissions Inventory database and see what it say 
# about fine particulate matter pollution in the United states over 
# the 10-year period 1999-2008. You may use any R package 
# you want to support your analysis.

# Question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (\color{red}{\verb|fips == "24510"|}fips=="24510") from 1999 to 2008?
# Use the base plotting system to make a plot answering this question.

if(file.exists("summarySCC_PM25.rds") && 
   file.exists("Source_Classification_Code.rds")){
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
        
}


# to obtein subset from NEI for Baltimore City, Maryland
su <- subset(NEI, fips=="24510") 

# to divide for each year and obtein sum
s2 <- with(su, tapply(Emissions,year,sum,na.rm=TRUE))

# Plot the results
plot(names(s2), s2, xlab = "Year", ylab="PM2.5 emitted (Tons)", main = "Emissions Baltimore City, Maryland" )

# To send PNG
dev.copy(png, file="plot2.png")

#Close device
dev.off()




