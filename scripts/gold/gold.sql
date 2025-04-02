--VIEW 
/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
Script Purpose:
    This script creates views for the Gold layer in the data warehouse. 
    The Gold layer represents the final dimension and fact tables (Star Schema)

    Each view performs transformations and combines data from the Silver layer 
    to produce a clean, enriched, and business-ready dataset.

Usage:
    - These views can be queried directly for analytics and reporting.
===============================================================================
*/

-- =============================================================================
-- Create Dimension: gold.dim_customers
-- =============================================================================
-- JOIN THE TABLES
IF OBJECT_ID('gold.dim_customers', 'V') IS NOT NULL
    DROP VIEW gold.dim_customers;
GO

CREATE VIEW gold.dim_customers AS
Select 
	ROW_NUMBER() OVER (ORDER BY cst_id) as customer_key,
	cs.cst_id as customer_id,
	cs.cst_key as customer_number,
	cs.cst_firstname as first_name,
	cs.cst_lastname as last_name,
	cs.cst_marital_status,
		CASE WHEN cs.cst_gndr != 'n/a' THEN cs.cst_gndr
		ELSE COALESCE(ca.gen, 'n/a')
	END as gender,
	cs.cst_create_date as create_date,
	ca.bdate as birthdate,
	lo.cntry as country
	from silver.crm_cust_info as cs
	left join silver. erp_cust_az12 as ca
	on cs.cst_key = ca.cid
	left join silver.erp_loc_a101 as lo
	on cs.cst_key = lo.cid ;

GO

-- =============================================================================
-- Create Dimension: gold.dim_products
-- =============================================================================
IF OBJECT_ID('gold.dim_products', 'V') IS NOT NULL
    DROP VIEW gold.dim_products;
GO

CREATE VIEW gold.dim_product AS
Select 
ROW_NUMBER () Over (Order by pn.prd_start_dt,pn.prd_key ) as product_key,
pn.prd_id as product_id,
pn.prd_key as product_number,
pn.prd_nm as product_name,
pn.cat_id as category_id,
pc.cat as category,
pc.subcat as subcategory,
pc.maintenance,
pn.prd_cost as cost,
pn.prd_line as product_line,
pn.prd_start_dt as start_date
from silver.crm_prd_info pn
left join silver.erp_px_cat_g1v2 pc
On pn.cat_id = pc.id
where prd_end_dt is NULL

GO
select *  from gold.dim_product ;


-- =============================================================================
-- Create Fact Table: gold.fact_sales
-- =============================================================================
IF OBJECT_ID('gold.fact_sales', 'V') IS NOT NULL
    DROP VIEW gold.fact_sales;
GO

Create VIEW gold.facts_sales as 
Select 
sd.sls_ord_num as order_number,
pr.product_key,
cu.customer_key,
sd.sls_order_dt as order_date,
sd.sls_ship_dt as shipping_date,
sd.sls_due_dt as due_date,
sd.sls_sales as sales_amount,
sd.sls_quantity as Quantity,
sd.sls_price price
from silver.crm_sales_details sd
LEFT JOIN gold.dim_product pr
ON sls_prd_key = pr.product_number
LEFT JOIN gold.dim_customers cu
ON sd.sls_cust_id = cu.customer_id;
Go

select * from gold.facts_sales f
left join gold.dim_customers c 
ON c.Customer_key = f.Customer_key
left join gold.dim_product p
ON p.product_key = f.product_key
where c.Customer_key is NULL;

