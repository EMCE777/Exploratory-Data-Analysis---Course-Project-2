# plot3.R
# Code R for Exploratory Data Analysis - Coursera - week 4 - Project - Question 1

## The overall goal of this assignment is to explore 
#  the National Emissions Inventory database and see what it say 
# about fine particulate matter pollution in the United states over 
# the 10-year period 1999-2008. You may use any R package 
# you want to support your analysis.

# Question 3
# Of the four types of sources indicated by the 
# type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999-2008 
# for Baltimore City? Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

if(file.exists("summarySCC_PM25.rds")){
        NEI <- readRDS("summarySCC_PM25.rds")
}


# load library ggplot2 and dplyr
library(ggplot2)
library(dplyr)

# to obtein subset from NEI for Baltimore City, Maryland
su <- NEI %>% filter(fips=="24510") %>% 
        select(Emissions,type,year) %>% 
        group_by(type,year) %>% 
        summarise(Emissions = sum(Emissions))

# Plot the results
qplot(year,Emissions, data=su, color=type, xlab = "Year", ylab="PM2.5 emitted (Tons)", main="Emissions Baltimore City, Maryland")

# To send PNG
dev.copy(png, file="plot3.png")

#Close device
dev.off()




