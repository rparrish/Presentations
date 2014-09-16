RStudio Introduction
========================================================
author: Rollie Parrish
date: Sept 22, 2014


===
<img src="RStudio-figure/geeks-vs-nongeeks-repetitive-tasks.png" width="800px" height="700px" />

_source: Bruno Oliveira (Google)_


Intended Audience
=====

- understand pros/cons of programming vs. point-and-click software
- never heard of R
- familiar with R
- currently using R console but not RStudio



What is R?
===
- Software environment for data manipulation, analysis and graphics display
- Interactive and functional programming language (not compiled)
- "Domain specific" - statistics, data science & analysis
- Extended funtionality via functions and packages



How is R used here?
===

- Data Cleanup (HBIPS)
- Extract, Transform, Load (Stix/Employee Health, REDCap)
- Ad-Hoc Analysis (WarmShots vs HotShots)
- Reporting (MDRC Cardiac Surgery reports, GAMUT)
- Statistical Modeling / Predictive Analytics (more to come)
- This presentation (!)



RStudio
===

Integrated Development Environment (IDE) for R

- Working with R scripts, packages, and final output.
- Intended for programming, NOT a Graphical User Interface for R.



RStudio demo
====

- Editor (source files)
- R Console
- Panels



R basics
=======
### variables can be

- single values
- vectors (same class of data - strings, numeric, dates, etc.)
- lists (mixed classes)
- data frames - tables of data
- functions



R basics
=======

### assignment

`variable_name <- value`


```r
tax_rate <- .08
item <- c("soda", "sandwich", "book")
prices <- c(1.50, 6.35, 34.95)

tax <- prices * tax_rate
tax
```

```
[1] 0.120 0.508 2.796
```

R basics
=======
### function

```r
add_tax <- function(price, tax_rate) {
    round(price + (price * tax_rate), 2)
}

subtotal <- add_tax(prices, tax_rate)
subtotal
```

```
[1]  1.62  6.86 37.75
```



R basics
=======

### data frames


```r
invoice <- data.frame(item, prices, subtotal)
invoice
```

```
      item prices subtotal
1     soda   1.50     1.62
2 sandwich   6.35     6.86
3     book  34.95    37.75
```





RStudio demo
=======

 - loading data (cars.csv)
 - installing packages (hflights)
 - plots (boxplots)
 - projects (switch to GAMUT)





Key Themes
===
- Reproducible Analysis/Research
- Project Management
- Automation



Recommended R Packages
======================

 - RODBC
 - dplyr
 - compareGroups
 - ggplot2



Other R Resources
===

- https://www.datacamp.com/
- https://www.codeschool.com/courses/try-r
- http://www.statmethods.net/
- http://www.twotorials.com/
- http://www.youtube.com (search "R tutorial")
- http://www.coursera.org



Book Recommendations
===

- R in Action (Kabacoff, 2014)
- R for Everyone (Lander, 2013)
- R Graphics Cookbook (Chang, 2013)




Help: "How do I..."
====

## `?command`
  R's internal documentation

## http://stackoverflow.com

search using the [r] tag



Advanced Topics
===
- Version Control (Git)
- Writing Packages
- Reports (RMarkdown, knitr & LaTex)



