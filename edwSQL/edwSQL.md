---
title: "Type A Data Science"
author: "Rollie Parrish"
date: "2017-02-22"
output:
  xaringan::moon_reader:
    lib_dir: libs
    nature:
      highlightStyle: github
      highlightLines: true
      countIncrementalSlides: false
      chakra: libs/remark-latest.min.js

---


---
# Approach 

![Source: R for Data Science](data-science.png)


## Importing Data

 - 80% of time is importing and preparing data for analysis
 - ie. monthly exports of data files
 

## Requirements
1. R / R-Studio
2. R Packages
   - tidyverse
   - dplyr & magrittr (pipes)
   - odbc


.footnote[
[1] [Source: R for Data Science](http://r4ds.had.co.nz/index.html)
]


---

# SQL databases directly into R

- RODBC
- odbc newer, faster (5x)

## odbc

typical method for loading a dataframe from SQL database

     # Setup
    library(odbc, DBI)
    dsn <- "EDWDBDev"
    sql <- "SELECT TOP 100 FROM StgEpicClarityPHS.dbo.HOSP_VISIT_CST"

    # open connection
    conn <- dbConnect(odbc(), dsn = dsn)

    # Get the results
    queryResult <- dbGetQuery(conn, sql)

    # Close the connection
    dbDisconnect(conn)

    # Final results
    mydata <- queryResult

## edwSQL()

 - wrapper function for odbc
 - simplified function calls
 - more complex sql queries from .sql files 
     
      # Setup  
     
    library(RPamisc) # contains the edwSQL() function
    
    
    results <-
        edwSQL("SQL/hvc.sql", 
            resource = "EDWDBDev")
            
    mydata <- results$data
 
    ?edwSQL # help documentation
   
    
            
 
# Installing RPamisc

   library(devtools)
   
   install_github("rparrish/RPamisc")



- 


---
# Future 

- [ ] Communication (R User community, Slack, etc.)
- [ ] Training Resources (Data Camp, Coursera)
- [x] Internal Git Repositories 
   GitLab - []()
- [x] R packages (cupid)


---

# Discussion 
