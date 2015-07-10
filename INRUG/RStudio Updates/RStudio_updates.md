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

RStudio updates
===============
author: Rollie Parrish
date: July 10, 2015


Overview
===============
-  R Studio v. 99.451
- View()
- Code Completion
- Vim keybindings
- Projects




RStudio: Code Completion
==================



```r
## read and write data files

seattle_911 <- read.csv("Seattle_911.csv")

write(seattle_911, file = "sea_911.rda", )

write.csv(mtcars, file = "sea_copy.csv",)
```

Tools --> Global Options --> Code --> Completion
