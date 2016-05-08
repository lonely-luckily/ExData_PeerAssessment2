plot1 <- function(){
## Loading data frames.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Aggregate by sum the total emissions by year
agg <- aggregate(Emissions ~ year,NEI, sum)

png("plot1.png",width=480,height=480,units="px",bg="transparent")

barplot((agg$Emissions)/10^6, names.arg=agg$year, xlab="Year",ylab="PM2.5 Emissions", main="Total PM2.5 Emissions From All US Sources")

dev.off()
}