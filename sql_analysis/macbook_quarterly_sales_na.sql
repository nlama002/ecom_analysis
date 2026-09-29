-- Q1: What were the order counts, sales, and AOV for MacBooks sold in North America
--     for each quarter across all years?
-- Tables: core.orders, core.customers, core.geo_lookup

-- Quarterly MacBook metrics in North America
select
  date_trunc(orders.purchase_ts, quarter) as purchase_quarter,
  count(orders.id) as order_count,
  round(sum(orders.usd_price), 2) as sales,
  round(avg(orders.usd_price), 2) as aov
from core.orders
left join core.customers
  on orders.customer_id = customers.id
left join core.geo_lookup
  on geo_lookup.country_code = customers.country_code
where lower(orders.product_name) like '%macbook%'
  and region = 'NA'
group by 1
order by 1 desc;

-- Average quarterly orders and sales across all quarters
with quarterly_metrics as (
  select
    date_trunc(orders.purchase_ts, quarter) as purchase_quarter,
    count(distinct orders.id) as order_count,
    round(sum(orders.usd_price), 2) as total_sales
  from core.orders
  left join core.customers
    on orders.customer_id = customers.id
  left join core.geo_lookup
    on customers.country_code = geo_lookup.country_code
  where lower(orders.product_name) like '%macbook%'
    and region = 'NA'
  group by 1
)

select
  round(avg(order_count), 1) as avg_quarter_orders,
  round(avg(total_sales), 2) as avg_quarter_sales
from quarterly_metrics;
