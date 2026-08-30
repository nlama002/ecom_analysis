# E-Commerce Order Analysis

This project analyzes e-commerce order data using SQL (Google BigQuery) to investigate regional sales trends, delivery performance, product refund rates, product popularity by region, and purchasing behavior across loyalty and non-loyalty customers.

The SQL scripts can be found [here](./sql_analysis).

## Business Questions

1. What were the order counts, sales, and average order value (AOV) for MacBooks sold in North America, broken down by quarter across all years?
2. For products purchased in 2022 on the website, or on mobile in any year, which region has the highest average delivery time?
3. What was the refund rate and refund count for each product overall?
4. Within each region, what is the most popular product?
5. How does time-to-first-purchase differ between loyalty and non-loyalty customers?

## Data

The analysis draws on four related tables:
- **`core.orders`** — order-level records (product, price, purchase timestamp, customer ID)
- **`core.customers`** — customer records (signup date, loyalty program status, country code)
- **`core.order_status`** — fulfillment info (delivery timestamp, refund timestamp)
- **`core.geo_lookup`** — maps country codes to regions

## Methodology

Each business question was answered with a standalone SQL query (or set of queries), using:
- **CTEs** (`WITH` clauses) to break multi-step logic into readable stages
- **Window functions** (`ROW_NUMBER() OVER (PARTITION BY ... ORDER BY ...)`) to rank and filter top values within groups
- **Conditional aggregation** (`CASE WHEN` inside `SUM`/`AVG`) to calculate rates like refund rate
- **Date functions** (`DATE_TRUNC`, `DATE_DIFF`, `EXTRACT`) for time-based and cohort-style analysis
- **Multi-table joins** (`LEFT JOIN`) across orders, customers, order status, and region lookup tables
- Basic data cleaning to standardize inconsistent product name formatting

## Files

| # | Question | File |
|---|----------|------|
| 1 | MacBook quarterly sales & AOV in North America | [`macbook_quarterly_sales_na.sql`](./sql_analysis/macbook_quarterly_sales_na.sql) |
| 2 | Average delivery time by region (2022 website + all-year mobile) | [`avg_delivery_time_by_region.sql`](./sql_analysis/avg_delivery_time_by_region.sql) |
| 3 | Refund rate and refund count by product | [`refund_rate_by_product.sql`](./sql_analysis/refund_rate_by_product.sql) |
| 4 | Most popular product per region | [`top_product_by_region.sql`](./sql_analysis/top_product_by_region.sql) |
| 5 | Time to first purchase: loyalty vs. non-loyalty customers | [`purchase_time_loyalty_vs_nonloyalty.sql`](./sql_analysis/purchase_time_loyalty_vs_nonloyalty.sql) |

## Summary of Insights

*(To be added once query results are finalized.)*

## Recommendations

*(To be added once query results are finalized.)*

## Next Steps

- Visualize results (Excel/Tableau) — coming soon
- Expand analysis with additional business questions as needed

## Tools

- **SQL (Google BigQuery / GoogleSQL)** for querying and analysis
- **Git / GitHub** for version control

---
*Part of an ongoing data analytics portfolio.*
