-- Q2: For products purchased in 2022 on the website, or purchased on mobile in any year,
--     which region has the highest average time to deliver?
-- Tables: core.order_status, core.orders, core.customers, core.geo_lookup

select
  region,
  avg(date_diff(order_status.delivery_ts, order_status.purchase_ts, day)) as avg_days_to_deliver
from core.order_status
left join core.orders
  on order_status.order_id = orders.id
left join core.customers
  on customers.id = orders.customer_id
left join core.geo_lookup
  on geo_lookup.country_code = customers.country_code
where (extract(year from order_status.purchase_ts) = 2022 and purchase_platform = 'website')
   or purchase_platform = 'mobile app'
group by 1
order by 2 desc;
