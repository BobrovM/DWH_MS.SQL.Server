/*
Use this query to create tables with data from CRM.
	Columns are 1 to 1 as they are in the source CSV files.
	Table names are 1 to 1 as the names of the CSV files.

!!!WARNING!!!
	FULLY RUNNING THIS SCRIPT WILL DROP EXISTING TABLES.
	PERMANENT DELETION, PROCEED IF BACKUPS EXISTS.
*/


---- Just in case.
USE DataWarehouseDB
GO


------ If table exists
--!!!WARNING!!! WILL ERASE ANY DATA WITH NO POSSIBILITY TO RESTORE IT
IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_cust_info
GO

------ Column names and types are taken from cust_info.csv
CREATE TABLE bronze.crm_cust_info (
	cst_i INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);
GO


------ If table exists
--!!!WARNING!!! WILL ERASE ANY DATA WITH NO POSSIBILITY TO RESTORE IT
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info
GO

------ Column names and types are taken from prd_info.csv
CREATE TABLE bronze.crm_prd_info (
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost DECIMAL(10,2),
	prd_line NVARCHAR(50),
	prd_start_dt DATE,
	prd_end_dt DATE
);
GO


------ If table exists
--!!!WARNING!!! WILL ERASE ANY DATA WITH NO POSSIBILITY TO RESTORE IT
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details
GO

------ Column names and types are taken from sales_details.csv
CREATE TABLE bronze.crm_sales_details(
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT, -- has '0'
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price DECIMAL(10,2)
);