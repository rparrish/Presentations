
<!-- https://github.com/ajlyons/rpres_css -->
<style>

.reveal h1, .reveal h2, .reveal h3 {
  word-wrap: normal;
  -moz-hyphens: none;
}

.footer {
    color: black; background: #E8E8E8;
    position: fixed; top: 90%;
    text-align:center; width:100%;
}

.small-code pre code {
  font-size: 1em;
}


</style>



RMarkdown
===============
author: Rollie Parrish
date: Dec 5, 2014



Overview
===============
- R Markdown is a "system"
- Depends on:
    - Rmarkdown & knitr packages
    - Pandoc & RStudio

![](RMarkdown-figure/2014-11-30_175325.png)

R Markdown
================

### Basic Markdown
- narrative content written in plain text
- basic formatting using a simple syntax
- Markdown is commonly used in web content
    (blogging, Wikipedia content, etc.)

### R code chunks
- incorporates the results of R code

### Rendered into final output
- html / pdf / Word / Presentations (like this one)


Basic Example
================

### Code

```r
### Heading
Hello world

2 + 2 = `r 2 + 2`
```


### Heading
Hello world

2 + 2 = 4


Another Example
===============
class: small-code

```r
summary(ChickWeight)
```

```
     weight         Time          Chick     Diet   
 Min.   : 35   Min.   : 0.0   13     : 12   1:220  
 1st Qu.: 63   1st Qu.: 4.0   9      : 12   2:120  
 Median :103   Median :10.0   20     : 12   3:120  
 Mean   :122   Mean   :10.7   10     : 12   4:118  
 3rd Qu.:164   3rd Qu.:16.0   17     : 12          
 Max.   :373   Max.   :21.0   19     : 12          
                              (Other):506          
```




A More Elaborate Example
================
class: small-cod

__Question__
Is the percentage of smokers significantly different between groups of patients?

__Data__ The count of patients and the count of smokers.


```r
conf.level <- 0.99
smokers  <- c( 80, 84)#, 129, 90)
patients <- c( 86, 93)#, 136, 120)
```



A More Elaborate Example
================
class: small-code



```r
results <- prop.test(smokers, patients)
results
```

```

	2-sample test for equality of proportions with continuity
	correction

data:  smokers out of patients
X-squared = 0.1456, df = 1, p-value = 0.7028
alternative hypothesis: two.sided
95 percent confidence interval:
 -0.06486  0.11888
sample estimates:
prop 1 prop 2 
0.9302 0.9032 
```
_results assigned to a variable so we can extract the elements_



A More Elaborate Example
=====================
class: small-code




```r
estimates <- paste(round(results$estimate * 100,1),"%",
                   collapse=" vs. ", sep="")
p_value <- ifelse(results$p.value < .001,
                  0.001, round(results$p.value,3))
p_eq_lt <- ifelse(p_value > .001,
                  "=", "<")
p_sig <- ifelse(p_value > 1-conf.level,
                "not", "")
```

### Results

| p_value|p_eq_lt |p_sig |estimates     |
|-------:|:-------|:-----|:-------------|
|   0.703|=       |not   |93% vs. 90.3% |


A More Elaborate Example
================


```r
This example evaluates the smoking status from `r length(patients)` groups of patients.

Chi-square analysis indicates the proportions of smokers are `r p_sig` significantly different between groups
(`r estimates`, $p$-value `r paste(p_eq_lt, p_value)`).
```


This example includes the smoking status from 2 groups of patients. Chi-square analysis indicates the proportions of smokers are not significantly different between groups (93% vs. 90.3%, $p$-value = 0.703).













