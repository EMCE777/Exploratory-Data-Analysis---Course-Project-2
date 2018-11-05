# plot5.R
# Code R for Exploratory Data Analysis - Coursera - week 4 - Project - Question 1

## The overall goal of this assignment is to explore 
#  the National Emissions Inventory database and see what it say 
# about fine particulate matter pollution in the United states over 
# the 10-year period 1999-2008. You may use any R package 
# you want to support your analysis.

# Question 5
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?


if(file.exists("summarySCC_PM25.rds")
   && file.exists("Source_Classification_Code.rds")){
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
}

# obtein numbers of SCC where word "Vehicles" is
co <- grep("Vehicles", SCC$Short.Name, ignore.case = T)

# to obtein values SCC and description
idCo <- SCC[co,c("SCC","Short.Name")]


# to merge both files
mer <- merge(NEI,idCo, by="SCC")

# load library ggplot2 and dplyr
library(ggplot2)
library(dplyr)

# to obtein subset from NEI for Baltimore City, Maryland
su <- mer %>% filter(fips=="24510") %>% 
        select(Emissions,year) %>% 
        group_by(year) %>% 
        summarise(Emissions = sum(Emissions))

# Plot the results
qplot(year,Emissions, data=su, ylab="PM2.5 emitted (Tons)", main = "Emissions Vehicles in Baltimore City, Maryland")

# To send PNG
dev.copy(png, file="plot5.png")

#Close device
dev.off()




