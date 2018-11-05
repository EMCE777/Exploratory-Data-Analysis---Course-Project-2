# plot1.R
# Code R for Exploratory Data Analysis - Coursera - week 4 - Project - Question 1

## The overall goal of this assignment is to explore 
#  the National Emissions Inventory database and see what it say 
# about fine particulate matter pollution in the United states over 
# the 10-year period 1999-2008. You may use any R package 
# you want to support your analysis.

# Question 1
#Have total emissions from PM2.5 decreased in the United States 
#from 1999 to 2008? Using the base plotting system, make a plot 
#showing the total PM2.5 emission from all sources for each of
#the years 1999, 2002, 2005, and 2008.

if(file.exists("summarySCC_PM25.rds")){
        NEI <- readRDS("summarySCC_PM25.rds")

}


# to obtein sum from each year in data
s1 <- with(NEI, tapply(Emissions,year,na.rm=TRUE,sum)) 

# to print with base plot 
plot(names(s1),s1,pch=9, xlab = "Year", ylab="PM2.5 emitted (Tons)", main="Emissions from all USA")

# Send the image to PNG
dev.copy(png,file="plot1.png")

#Close device
dev.off()




