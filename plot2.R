plot2 <- function(){
    
    ## Load data frames.
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    
    ## Subset data by Baltimore's fip.
    baltimoreData <- NEI[NEI$fips=="24510",]
    
    ## Aggregate Baltimore emissions data by year
    Baltimore <- aggregate(Emissions ~ year, baltimoreData,sum)
    
    png("plot2.png",width=480,height=480,units="px",bg="transparent")
    
    barplot(Baltimore$Emissions, names.arg=Baltimore$year, xlab="Year", ylab="PM2.5 Emissions (Tons)", main="Total PM2.5 Emissions From all Baltimore City Sources")
    
    dev.off()
    
}