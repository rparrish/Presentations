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
date: Nov. 25, 2015


Overview
===============
- R Studio v. 99.451
- Code Completion
- View()
- Projects
- Vim keybindings




RStudio: Code Completion
==================

Tools --> Global Options --> Code --> Completion




```r
#library(dplyr)
# Source: data.seattle.gov
# remember to setwd() to source file location
# enter each line in console window

# load("Data/seattle_911.rda")

# seattle_911 <- mutate(seattle_911,
#                      Type = as.factor(Type))
```


Studio: View()
===============

Used to inspect dataset interatively, similar to Excel's AutoFilter



```r
View(seattle_911)
```
- factors --> picklist
- continuous --> slider
- text search
    - global vs individual columns
    - incremental search
    - pop-out browser



Projects
========

- Helps keep organized
- Sets the working directory
- Three types
  - Empty project (new or existing directory)
  - Version Control (clone an existing repository)
  - Package (additional settings and files)



RStudio: Vim/Emacs keybindings
========================

Familiar with Vim or Emacs? Try it out

Tools --> Global Options --> Code --> Editing --> Enable Vim or Emacs editing mode





Questions
=========


