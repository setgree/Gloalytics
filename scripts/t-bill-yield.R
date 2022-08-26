library(ggplot2)
library(plotly)

# data from https://fred.stlouisfed.org/series/TB3MS
dat <- read.csv('./data/TB3MS.csv')
mean(dat$TB3MS) # 3.374%

# reconstruct the nice graph from the Fed website w/ Plotly

ggplotly(ggplot(dat, aes(x = as.Date(DATE), y = TB3MS)) + 
           geom_line(col = 'light blue') + 
           xlab('date') + ylab('discount rate') + 
           theme_minimal())
