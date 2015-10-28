EDW_Connections
========================================================
author: me
date:
autosize: true

First Slide
========================================================

For more details on authoring R presentations please visit <https://support.rstudio.com/hc/en-us/articles/200486468>.

- Bullet 1
- Bullet 2
- Bullet 3

How to get data from EDW (any SQL Server) into R
========================================================

- .csv files
- RODBC package
- edwSQL function
- Examples


.csv Files
========================================================

- Export data files using Toad, SSMS, etc.
- import using read.csv, read_csv, etc.
- Pros:
   - Simple
   - Ensures reproducibility by using the same dataset

- Cons:
   - Data stored in various locations
   - Must be re-exported when data is updated
   - Automation is more difficult, slower


Plots
========================================================
![plot of chunk unnamed-chunk-1](EDW_Connections-figure/unnamed-chunk-1-1.png) 
