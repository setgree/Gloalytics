options(scipen = 99)
library(ggplot2)
library(ggrepel)
library(dplyr)

df <- tribble(~"milestone", ~"market_cap", ~"people_helped",
              "starting point", 0, 0,
              "sid's investment pays off", 22224000, 1307)

p <- ggplot(data = df,
            aes(x = market_cap,
                y = people_helped,
                label = milestone)) +
  geom_point(color = "cyan") +
  geom_abline(intercept = 0, slope = 1/17000, 
              color = "light blue", lty = "dashed") +
  xlab("market cap") +
  ylab("people helped") +
  geom_label_repel(max.iter = 10000, 
                   colour = "black", family = 'Helvetica', # fontface = "bold", 
                   box.padding = unit(0.25, "lines"), 
                   point.padding = unit(.25, "lines"), 
                   alpha = .75,
                   segment.colour = 'gray',
                   size = 4,
                   force = 4,
                   show.legend = FALSE) +
  theme_minimal()
