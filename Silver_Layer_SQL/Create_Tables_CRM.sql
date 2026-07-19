/*
This query creates silver layer tables for CRM data. 
	Same as bronze but with some metadata.

!!!WARNING!!!
	FULLY RUNNING THIS SCRIPT WILL DROP EXISTING TABLES.
	PERMANENT DELETION, PROCEED IF BACKUPS EXISTS.
*/


---- Just in case.
USE DataWarehouseDB
GO


------ If table exists
--!!!WARNING!!! WILL ERASE ANY DATA WITH NO POSSIBILITY TO RESTORE IT
IF OBJECT_ID('silver.crm_cust_info', 'U') IS NOT NULL
	DROP TABLE silver.crm_cust_info
GO

------ 
CREATE TABLE silver.crm_cust_info (
	cst_i INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE,
	dwh_meta_create_date DATETIME2 DEFAULT GETDATE()
);
GO


------ If table exists
--!!!WARNING!!! WILL ERASE ANY DATA WITH NO POSSIBILITY TO RESTORE IT
IF OBJECT_ID('silver.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE silver.crm_prd_info
GO

------ 
CREATE TABLE silver.crm_prd_info (
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost DECIMAL(10,2),
	prd_line NVARCHAR(50),
	prd_start_dt DATE,
	prd_end_dt DATE,
	dwh_meta_create_date DATETIME2 DEFAULT GETDATE()
);
GO


------ If table exists
--!!!WARNING!!! WILL ERASE ANY DATA WITH NO POSSIBILITY TO RESTORE IT
IF OBJECT_ID('silver.crm_sales_details', 'U') IS NOT NULL
	DROP TABLE silver.crm_sales_details
GO

------ 
CREATE TABLE silver.crm_sales_details(
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT, -- has '0'
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price DECIMAL(10,2),
	dwh_meta_create_date DATETIME2 DEFAULT GETDATE()
);