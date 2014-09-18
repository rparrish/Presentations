#'
#' Demo of RStudio


tax_rate <- .08

item <- c("soda", "sandwich", "book")

prices <- c(1.50, 6.35, 34.95)

tax <- prices * tax_rate
tax


add_tax <- function(price, tax_rate) {
    round(price + (price * tax_rate), 2)
}


subtotal <- add_tax(prices, tax_rate)
subtotal

invoice <- data.frame(item, prices, subtotal)
invoice



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
    select(UniqueCarrier:ActualElapsedTime, Origin:Distance) %>%
    filter(UniqueCarrier == "AS")
AS

str(AS)


## dplyr package: total flights by Unique Carrier

flight_counts <- group_by(mydata, UniqueCarrier) %>%
    summarise(count = n())

mydata$Cancelled <- as.factor(mydata$Cancelled)
mydata$Diverted <- as.factor(mydata$Diverted)

## compareGroups package: comparing high vs low volume carriers
library(compareGroups)

cancellations <- compareGroups(
    Origin ~ Cancelled + Diverted + DepDelay,
    data = mydata)

createTable(cancellations)

