/*
This query creates silver layer tables for ERP data. 
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
IF OBJECT_ID('silver.erp_cust_az12', 'U') IS NOT NULL
	DROP TABLE silver.erp_cust_az12
GO

------ 
CREATE TABLE silver.erp_cust_az12 (
	cid NVARCHAR(50),
	bdate DATE,
	gen NVARCHAR(50),
	dwh_meta_create_date DATETIME2 DEFAULT GETDATE()
);
GO


------ If table exists
--!!!WARNING!!! WILL ERASE ANY DATA WITH NO POSSIBILITY TO RESTORE IT
IF OBJECT_ID('silver.erp_loc_a101', 'U') IS NOT NULL
	DROP TABLE silver.erp_loc_a101
GO

------ 
CREATE TABLE silver.erp_loc_a101 (
	cid NVARCHAR(50),
	cntry NVARCHAR(50),
	dwh_meta_create_date DATETIME2 DEFAULT GETDATE()
);
GO


------ If table exists
--!!!WARNING!!! WILL ERASE ANY DATA WITH NO POSSIBILITY TO RESTORE IT
IF OBJECT_ID('silver.erp_px_cat_g1v2', 'U') IS NOT NULL
	DROP TABLE silver.erp_px_cat_g1v2
GO

------ 
CREATE TABLE silver.erp_px_cat_g1v2 (
	id NVARCHAR(50),
	cat NVARCHAR(50),
	subcat NVARCHAR(50),
	maintenance NVARCHAR(50),
	dwh_meta_create_date DATETIME2 DEFAULT GETDATE()
);