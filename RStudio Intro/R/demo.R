#'
#' Demo of RStudio


tax_rate <- .08

items <- c("soda", "sandwich", "book")

prices <- c(1.50, 6.35, 34.95)


add_tax <- function(price, tax_rate) {
    round(price + (price * tax_rate), 2)
}


totals <- add_tax(prices, tax_rate)

invoice <- data.frame(item, prices, totals)
invoice




## Boxplots Demo
library(dplyr)
library(hflights)
library(compareGroups)

mydata <- tbl_df(hflights)  # dplyr version of a data frame
mydata
summary(mydata)

boxplot(ArrTime ~ UniqueCarrier,
        data = mydata,
        main = "Arrival Times by Carrier")

boxplot(ActualElapsedTime ~ UniqueCarrier,
        data = mydata,
        main = "Turn-around time by Carrier")

boxplot(ActualElapsedTime ~ Origin,
        data = mydata,
        main = "Turn-around time by Airport")


## dplyr package: AS airlines and destinations
AS <- mydata %>%
    select(UniqueCarrier,ActualElapsedTime, Origin:Distance) %>%
    filter(UniqueCarrier == "AS")
AS

# basic line plot
plot(AS$ActualElapsedTime, type="l")

## compareGroups package: comparing high vs low volume carriers
library(compareGroups)

origins <- compareGroups(
    Origin ~ Cancelled + Diverted + DepDelay,
    data = mydata)

createTable(origins)
