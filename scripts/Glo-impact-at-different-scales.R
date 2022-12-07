#! # Glo impact at different scales

options(scipen = 99)
#! ### parameters
current_T_bill_rate <-	0.0427
historical_T_bill_rate <-	0.0337
expected_reserve_yield <-	0.03
cost_per_month_of_basic_income = 40
months_in_year <- 12
expected_basic_income_period <-	3
cost_per_year_of_basic_income <- 480
initial_seed_funding <- 2000000


#! ### calculations

# how much Glo does it take to provide one year's worth of basic income?
glo_to_provide_one_basic_income <- cost_per_month_of_basic_income *
  months_in_year / expected_reserve_yield

# basic income from seed funding if direct donation?
(seed_as_donation = ceiling(initial_seed_funding / 
  (cost_per_month_of_basic_income * months_in_year *
     expected_basic_income_period)))

# how much Glo in circulation to exceed that?
(glo_crossover_point <- (seed_as_donation + 1) * glo_to_provide_one_basic_income)  

# if we take a more conservative estimate of yield? 
glo_crossover_point * (expected_reserve_yield / .025)

# how much Glo to provide basic income to 1 million people?
1000000 * glo_to_provide_one_basic_income
