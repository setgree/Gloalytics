#' # Glo impact at different scales

# settings
options(scipen = 99)
rm(list = ls()) # contra Jenny Bryan I like a clean slate

#' ### parameters
current_T_bill_rate <-	0.0427
historical_T_bill_rate <-	0.0337
expected_reserve_yield <-	0.03
cost_per_month_of_basic_income = 40
months_in_year <- 12
expected_basic_income_period <-	3
cost_per_year_of_basic_income <- 480
initial_seed_funding <- 2000000

#' ### calculations

# how much Glo does it take to provide one year's worth of basic income?
glo_to_provide_one_basic_income <- cost_per_month_of_basic_income *
  months_in_year / expected_reserve_yield #16,000

# basic income from seed funding if direct donation?
seed_as_donation = ceiling(initial_seed_funding / 
  (cost_per_month_of_basic_income * months_in_year *
     expected_basic_income_period)) #1389

# how much Glo in circulation to exceed that?
glo_crossover_point <- (seed_as_donation + 1) * 
  glo_to_provide_one_basic_income  # 22,240,000 -- for at least 3 years

# if we take a more conservative estimate of yield? 
glo_crossover_point * (expected_reserve_yield / .025) # 26,688,000

# how much Glo to provide basic income to 1 million people?
1000000 * glo_to_provide_one_basic_income #16,000,000,000

# how much Glo to double GiveDirectly's 2021 funding?
# per https://www.givedirectly.org/wp-content/uploads/2022/11/GiveDirectly-2021-12-Tax-Form-990-Public-Disclosure.pdf, 
# they got 249,227,004 in total in 2021
GD_funding <- 249227004
GD_doubling_point <- GD_funding / expected_reserve_yield # 8,307,566,800

# 8.3B would make Glo the 4th largest stablecoin -- 43% bigger than Dai
# but just 37% as big as the next leading contender (Binance)
# how many basic incomes is that
GD_doubling_point / glo_to_provide_one_basic_income #519,223

# If we start with 1M and grow by 10% every month;
# how many months to these goals?
glo_growth <- function(start, end, growth_rate) {
  appreciation_rate = 1 + growth_rate
  periods = (log(end) - log(start)) / log(appreciation_rate)
  print(round(periods, 3))
    }

glo_growth(1000000, GD_doubling_point, .1) #94.69
# so at 10% growth per month and a starting point of 1M, we'd double
# GiveDirectly's revenue in 7.83 years -- or in Q3 2030 
