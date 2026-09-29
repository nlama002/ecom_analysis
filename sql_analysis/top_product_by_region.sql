-- Q4: Within each region, what is the most popular product?
-- Tables: core.orders, core.customers, core.geo_lookup
-- Approach: count orders per region/product, rank with ROW_NUMBER(), keep rank 1.

with sales_by_product as (
  select
    region,
    case when product_name = '27in"" 4k gaming monitor' then '27in 4K gaming monitor'
         else product_name end as product_clean,
    count(distinct orders.id) as total_orders
  from core.orders
  left join core.customers
    on orders.customer_id = customers.id
  left join core.geo_lookup
    on geo_lookup.country_code = customers.country_code
  group by 1, 2
),

ranked_orders as (
  select
    *,
    row_number() over (partition by region order by total_orders desc) as order_ranking
  from sales_by_product
)

select *
from ranked_orders
where order_ranking = 1
order by total_orders desc;
