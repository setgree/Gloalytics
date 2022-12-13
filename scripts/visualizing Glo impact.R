#' ### visualizing Glo impact

library(ggplot2) 
library(plotly)
library(dplyr, warn.conflicts = FALSE)
library(plotly)

# params
source('./scripts/Glo-impact-at-different-scales.R')

paleo_data <- tribble(~"study_name", ~"ATE", ~"SD", ~"n_t", ~"n_c",
                      "jonsson", 8, 14, 7, 6,
                      "lindeberg", -1.5, 8, 14, 16,
                      "mellberg", -5.3, 10.12, 34, 27)
  

glo_stages <- tribble(~"inflection_point", ~"amount",
                       "Glo crossover point", glo_crossover_point,
                      "GiveDirectly doubling point", GD_doubling_point,
                      "largest stablecoin", 68000000000) %>% 
  mutate(money_donated = amount * .03) 

# losing faith in this infographic idea. The technical problem I’m having
# trouble solving is having 3% of each bar highlighted in a different color, I’m
# sure someone who really knows what they’re doing with ggplot2 would solve this
# in a moment but I’m not that person. The conceptual problem is that the scales
# are so different from each other that it’s effectively impossible to compare
# them on the same scale as each other without putting a variable into log() and
# then it becomes much, much harder to understand at a glance. 

# the plot, at any rate
glo_stages %>%
           ggplot(aes(x = inflection_point, 
                      y = amount)) +
                    geom_col( fill = "cyan") +
  ylab("market cap") +
  xlab("Glo at different scales") +
  scale_y_continuous(sec.axis = 
                       sec_axis(~./17000, name = "people helped")) +
  theme_minimal()
