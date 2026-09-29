-- Q5: How does the time to make a purchase differ between loyalty and non-loyalty customers?
-- Tables: core.customers, core.orders

select
  customers.loyalty_program,
  round(avg(date_diff(orders.purchase_ts, customers.created_on, day)), 1) as days_to_purchase,
  round(avg(date_diff(orders.purchase_ts, customers.created_on, month)), 1) as months_to_purchase
from core.customers
left join core.orders
  on customers.id = orders.customer_id
group by 1;
