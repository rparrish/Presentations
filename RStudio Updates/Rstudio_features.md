Rstudio features
========================================================
author: Rollie.Parrish@providence.org
date: 2015-12-16
autosize: true


Overview
===============

- Code completion
- View() function
- Projects
- RMarkdown Templates




RStudio: Code Completion
==================

![alt text](Rstudio_features-figure/code_completion.png)

***
Speeds up typing by displaying picklists and tool tips.
 - context-aware
 - all available objects (vectors, data frames, functions, installed packages, etc.)
 - files navigation
 - works in dplyr pipelines

## To enable, go to:
Tools --> Global Options --> Code --> Completion




RStudio: Code Completion walkthrough
==================



<!--
# remember to setwd() to source file location
# enter each line in console window
-->


```r
library(dplyr)
library(dplyr)

load("Data/seattle_911.rda")
load("Data/seattle_911.rda")

dplyr::glimpse(seattle_911)

seattle_911 <- mutate(seattle_911,
                     Type = as.factor(Type))
seattle_911 <- mutate(seattle_911,
                      Type = as.factor(Type))

seattle_911 %>%
         select(Type, Datetime) %>%
         count(Type, sort = TRUE)

seattle_911 %>%
        select(Type, Datetime) %>%
        count(Type, sort = TRUE)
```

- Seattle Fire Department calls on 2015-07-08
- Source: data.seattle.gov


RStudio: View()
===============

Used to inspect dataset interactively in a grid

- incremental text search
- pop-out to a separate window
- refreshes when data frame is modified


RStudio: View() walkthrough
===============


```r
mydata <- seattle_911
View(mydata)

#
mydata <- filter(mydata, Type == "Rescue Elevator")
```


Projects
========

Useful when working on different analysis projects

Keeps all the associated files project files together
 - scripts, data files, figures, reports
 - dedicated R workspace and history
 - Sets the working directory & other options
 - Loads source files when project is re-opened


***
![alt text](Rstudio_features-figure/project_folders.png)




RMarkdown templates
===================

- Custom layout and formating of Rmarkdown reports
- Distributed as part of an R package
- Quick demo





Discussion Points
=================

- Version control for data analysis projects
- R Package development/collaboration (templates, functions, etc.)
- Interest in a setting up server-based R/RStudio




Questions?
=========




Rollie.Parrish@providence.org

https://github.com/rparrish

