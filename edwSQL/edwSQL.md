edwSQL()
========================================================
author: Rollie Parrish
date: 2017-04-29
autosize: true

## Bringing SQL Server data into R


Data Science approach
========================================================

## Streamlining data imports

 - ~80% of effort is spent on acquiring data for analysis
 - We can automate using SQL instead of raw data files

***

<img src="data-science.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="1200px" />

[Source: R for Data Science](http://r4ds.had.co.nz/index.html)



R packages for working with SQL databases
========================================================

- `RODBC`
- `odbc` DBI-compliant, 5x faster


## Requirements
1. R / R-Studio
2. R Packages
   - `tidyverse`
   - `dplyr`
   - `odbc`
3. DSN configured in Windows (ie. "EDWDBDev")


odbc
========================================================

Standard method for loading a dataframe from SQL database


```r
# Setup
library(odbc, DBI)
dsn <- "EDWDBDev"
sql <- "SELECT TOP 100 * FROM StgEpicClarityPHS.dbo.HOSP_VISIT_CST"

# open connection
conn <- dbConnect(odbc(), dsn = dsn)

# Get the results
queryResult <- dbGetQuery(conn, sql)

# Close the connection
dbDisconnect(conn)

# Final results
mydata <- queryResult
```

edwSQL()
========================================================

 - Wrapper function for `odbc`
 - Allows more complex SQL queries from .sql files
 - Returns additional metadata (status message , field names, time)


```r
# Setup
# contains the edwSQL() function
library(RPamisc)

results <- edwSQL("SQL/hvc.sql",  resource = "EDWDBDev")
mydata <- results$data
```

edwSQL()
===========================================

```r
results
```


```
$data
  PAT_ENC_CSN_ID           Admit_dts Ministry
1   xy0109926320 2017-03-31 00:54:00      WSH
2   xy0110638557 2017-03-30 22:31:00      WSH
3   xy0111372124 2017-03-30 22:34:00      WSH

$fields
[1] "PAT_ENC_CSN_ID" "Admit_dts"      "Ministry"      

$elapsed_seconds
[1] 1.233124

$status_message
[1] "3 records and 3 columns were read from EDWDBDev in 1.23 seconds."
```



edwSQL()
=======================================

Use of separate .sql files written in Toad, etc.

 - Removes single-line comments (- -)
 - Concatenates the entire .sql file into a single line
 - Not supported:
    - Multi-line comment blocks (/\* .... \*/)
    - Common Table Expressions (WITH ... AS...)



### hvc.sql


```sql
-- Example query
SELECT
TOP 3

  PAT_ENC_CSN_ID
, ADMITDATE as Admit_dts
, LEFT(HSP_LOC_NAME, 3) as Ministry

FROM StgEpicClarityPHS.dbo.HOSP_VISITS_CST

WHERE 1=1
  AND LEFT(HSP_LOC_NAME, 3) = 'WSH'
  AND DISCHARGEDATE
    BETWEEN '2017-04-01' AND '2017-04-03'
```



Example uses
=======================================

Demographics, Transfer Orders and ventilator times for specific providers.

Can bring in data from any SQL source and join using `dplyr`.


```r
resource <- "EDWDBProd"
discharge_BASE <- edwSQL("SQL/discharges.sql", resource = resource)
trf_orders     <- edwSQL("SQL/transfer_orders.sql", resource = resource)
vent_times     <- edwSQL("SQL/vent_times.sql", resource = resource)
tig_cases      <- edwSQL("SQL/tig_cases.sql", resource = resource)

icu_data <-
    discharge_BASE %>%
    inner_join(trf_orders, by = "PAT_ENC_CSN_ID") %>%
    left_join(vent_times, by = "PAT_ENC_CSN_ID") %>%
    semi_join(tig_cases, by = "PAT_ENC_CSN_ID")
```





Installing RPamisc
========================================================


```r
library(devtools)

install.packages("odbc")
install_github("rparrish/RPamisc")

# If using an older version of R or odbc package is not
# available, you'll need to install the last version
# of RPamisc that still used RODBC

install_github("rparrish/RPamisc",
               ref = "e65cfefd1645e8313d018492c26b80f3f19c8109")
```


### Additional Info

http://rparrish.github.io/RPamisc/


Future
========================================================

### Parameterized queries

```r
ministries <- c("WSH", "WFH")

vent_times <-
    template_query("vent_times",
                   params = list(start_date   = "2017-04-01",
                                 end_date     = "2017-04-30",
                                 ministries   = ministries))
```

### Import & Tidy in a single function


```r
icu_data <- get_icu_data(start_date, end_date, ministries)
```


New R options at Providence
========================================================

### R Toolkit (Desktop/Laptop)
 - RStudio
 - Git for Windows
 - Pandoc & MikTek (PDF reports)
 - Notepad++

### R Studio VHD (for VDI)

***
### R Studio Server (testing)
 - accessed via web browser
 - Shiny Apps
 - HTML Reports/Notebooks
 - Scheduled scripts




Discussion
========================================================

- [_] Communication
    - R User community, WellSpot, Slack, etc.
- [_] Training Resources
    - Data Camp, Coursera
- [X] Internal Git Repositories
    - GitLab Server - []() development https://u90166.providence.org
- [X] R packages
    - cupid - SQL queries for Clinical Data Analysts
    - templates - Rmarkdown templates for reports, poster presentations, plot themes, etc.

