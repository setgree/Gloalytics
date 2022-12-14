rm(list = ls())
options(scipen = 99)
library(ggplot2)
library(ggrepel)
library(dplyr)
library(scales)

comma <- scales::label_comma()

df <- tribble(~"milestone", ~"market_cap",
              # "Starting point", 0,
              "Sid's investment pays off", 23613000,
              "2X GiveDirectly's revenue", 8307566800,
              "Fourth largest stablecoin", 15000000000,
              "Largest stablecoin",        68000000000,
              "Entire stablecoin market",  150000000000) %>%
#  "Apple's cash on hand",      203000000000,
# "5% of all US savings",      531500000000
  # "1% of all money", 1380000000000)
  # "Planetary scale", 11000000000000 # badly distorts perspective
  mutate(money_donated = round(market_cap * 0.03),
         people_helped = round(market_cap / 17000))

ggplot(data = df,
       aes(x = market_cap,
           y = people_helped,
           label = paste0(milestone, "\n",
                          "Market cap = $", comma(market_cap), "\n",
                          " $", comma(money_donated), " donated", "\n",
                          " ",  comma(people_helped), " people helped"
                          ))) +
  geom_point(color = "cyan", size = 10) +
  geom_abline(intercept = 0, slope = 1/17000, 
              color = "light blue", lty = "dashed") +
  xlab("Market cap") +
  ylab("People helped") +
  geom_label_repel(seed = 11111988,
                   max.iter = 10000,
                   colour = "black", family = 'Helvetica', # fontface = "bold",
                   box.padding = unit(0.25, "lines"),
                   point.padding = unit(.25, "lines"),
                   alpha = .75,
                   size = 7,
                   segment.colour = 'gray',
                   force = 10,
                   show.legend = FALSE) +
  theme_minimal() +
  ggtitle("Glo's impact at different milestones") +
  theme(axis.title =  element_text(size = 20),
        axis.text =  element_text(size = 10),
        plot.title = element_text(hjust = 0.5, size = 30))
