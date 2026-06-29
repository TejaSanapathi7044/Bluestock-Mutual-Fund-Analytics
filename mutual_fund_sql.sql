
-- 1.Top 10 Mutual Funds by 5-Year Return

select scheme_name ,
fund_house,
return_5yr_pct 
from "07_scheme_performance"
order by return_5yr_pct desc
limit 10 ;


-- 2.Average Expense Ratio by Fund House

select 
fund_house ,
round(avg(expense_ratio_pct),2) as  avg_ratio 
from "07_scheme_performance"
group by fund_house 
order  by avg_ratio desc ;


-- 3. Top 5 Fund Houses by Total AUM

select 
fund_house ,
sum(aum_crore) as total_aum
from "03_aum_by_fund_house"
group by fund_house 
order by total_aum desc ;


-- 4. Average Daily NAV of Each Scheme

select 
f.scheme_name , 
round(avg(n.nav),2) as avg_nav 
from "02_nav_history_cleaned" n
join "01_fund_master" f
on n.amfi_code = f.amfi_code
group by f.scheme_name 
order by avg_nav desc ;


-- 5. Number of Schemes Available in Each Category

select category ,
count(*) as total_schema 
from "01_fund_master"
group by category 
order by total_schema desc;


-- 6.States with Highest Investment Amount

select 
state , 
round(sum(amount_inr),2) as total_investements 
from "08_investor_transactions_cleaned" 
group by state 
order by total_investements desc ;


-- 7.Transaction Type Distribution

select  transaction_type ,
count(*) as total_trans,
round(sum(amount_inr),2) as total_amount 
from "08_investor_transactions_cleaned"
group by transaction_type 
order by total_amount desc;


-- 8.Monthly SIP Growth Analysis

select month ,
sip_inflow_crore ,
yoy_growth_pct 
from "04_monthly_sip_inflows"
group by month 
order by sip_inflow_crore desc;


--9.Sector Allocation by Market Value

select 
sector ,
round(sum(market_value_cr),2) as total_value
from "09_portfolio_holdings"
group  by sector 
order by total_value desc;


-- 10.Benchmark Performance Summary

select 
index_name ,
round(min(close_value)) as min_value , 
round(avg(close_value),2) as avg_value ,
round(max(close_value)) as max_value 
from "10_benchmark_indices"
group by index_name 
order by avg_value desc;



























































