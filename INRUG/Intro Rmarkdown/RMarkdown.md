
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
    - Pandoc (converts .md files to final output)
    - RStudio


R Markdown
================

## Basic Markdown
- narrative content written in plain text
- basic formatting using a simple syntax
- commonly used in web (blogging, Wikipedia content, etc.)

## R code chunks
- incorporates the results of R code

## Rendered into final output
- html / pdf / Word / Presentations (like this one)


A More Elaborate Example
================
class: small-code

### Question
Is the percentage of smokers significant different between groups?

### Data

For each group, the total number of patients and the number of smokers.

### Code

```r
smokers  <- c( 80, 84 )
patients <- c( 86, 93 )

results <- prop.test(smokers, patients)
```


A More Elaborate Example
================
class: small-code

### Results of prop.test()

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

Specific Elements
=====================
class: small-code


```r
if(results$p.value < .001) {
    p_value <- 0.001
    p_eq_lt <- "<"
    p_sig <- ""

    } else {
    p_value <- round(results$p.value,3)
    p_eq_lt <- "="
    p_sig <- "not"
    }

estimates <- paste(round(results$estimate * 100,1),"%", collapse=" vs. ", sep="")
```

### Results

| p_value|p_eq_lt |p_sig |estimates     |
|-------:|:-------|:-----|:-------------|
|   0.703|=       |not   |93% vs. 90.3% |


Final Text
================

### Code

```r
This example evaluates the smoking status from `r length(patients)` groups of patients. ${\chi}^2$ analysis indicates the proportions of smokers are `r p_sig` significantly different between groups (`r estimates`, $p$-value `r paste(p_eq_lt, p_value)`).
```

### Results

This example includes the smoking status from 2 groups of patients. ${\chi}^2$ analysis of the proportion of smokers vs non-smokers indicate they are not significantly different between groups (93% vs. 90.3%, $p$-value = 0.703).













