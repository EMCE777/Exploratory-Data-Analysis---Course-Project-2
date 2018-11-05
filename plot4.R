# plot3.R
# Code R for Exploratory Data Analysis - Coursera - week 4 - Project - Question 1

## The overall goal of this assignment is to explore 
#  the National Emissions Inventory database and see what it say 
# about fine particulate matter pollution in the United states over 
# the 10-year period 1999-2008. You may use any R package 
# you want to support your analysis.

# Question 4
# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999-2008?


if(file.exists("summarySCC_PM25.rds")
   && file.exists("Source_Classification_Code.rds")){
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
}

# obtein numbers of SCC where word "Coal" is
co <- grep("Coal", SCC$Short.Name, ignore.case = T)

# to obtein values SCC and description
idCo <- SCC[co,c("SCC","Short.Name")]

# to merge both files
mer <- merge(NEI,idCo, by="SCC")

# load library ggplot2 and dplyr
library(ggplot2)
library(dplyr)

# to obtein summarize by Short.Name,year
su <- mer %>% select(Emissions,year) %>% 
        group_by(year) %>% 
        summarise(Emissions = sum(Emissions))

# Plot the results
qplot(year,Emissions, data=su, xlab = "Year", ylab="PM2.5 emitted (Tons)", main = "Emissions related with Coal in USA")

# To send PNG
dev.copy(png, file="plot4.png")

#Close device
dev.off()




