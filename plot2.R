NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## 2.Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## total emissions from PM2.5 for Baltimore City, Maryland (fips="24510") from 1999 to 2008
baltimoreNEI <- NEI[NEI$fips=="24510",]
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

## bar plot from data
png("plot2.png",width=480,height=480,units="px")

barplot(
  aggTotalsBaltimore$Emissions,
  names.arg=aggTotalsBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From All Baltimore City Sources"
)

dev.off()

## Yes - Total emissions have decreades in the Baltimore City, 1999 -> 2008