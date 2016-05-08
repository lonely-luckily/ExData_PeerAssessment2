library(ggplot2)

plot3 <- function(){
    # Loading data frames
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    
    # Subset data
    baltimoreData <- NEI[NEI$fips=="24510",]
    
    png("plot3.png",width=480,height=480,units="px",bg="transparent")
    
    g <- ggplot(baltimoreData,aes(factor(year),Emissions,fill=type)) +
        geom_bar(stat="identity") +
        theme_bw() + guides(fill=FALSE)+
        facet_grid(.~type,scales = "free",space="free") + 
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title=expression("PM"[2.5]*" Emissions by Source Type"))
    
    print(g)
    
    dev.off()
    
}