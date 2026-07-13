/*
Use this query to create tables with data from ERP.
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
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
	DROP TABLE bronze.erp_cust_az12
GO

------ Column names and types are taken from CUST_AZ12.csv
CREATE TABLE bronze.erp_cust_az12 (
	cid NVARCHAR(50),
	bdate DATE,
	gen NVARCHAR(50)
);
GO


------ If table exists
--!!!WARNING!!! WILL ERASE ANY DATA WITH NO POSSIBILITY TO RESTORE IT
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
	DROP TABLE bronze.erp_loc_a101
GO

------ Column names and types are taken from LOC_A101.csv
CREATE TABLE bronze.erp_loc_a101 (
	cid NVARCHAR(50),
	cntry NVARCHAR(50)
);
GO


------ If table exists
--!!!WARNING!!! WILL ERASE ANY DATA WITH NO POSSIBILITY TO RESTORE IT
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
	DROP TABLE bronze.erp_px_cat_g1v2
GO

------ Column names and types are taken from PX_CAT_G1V2.csv
CREATE TABLE bronze.erp_px_cat_g1v2 (
	id NVARCHAR(50),
	cat NVARCHAR(50),
	subcat NVARCHAR(50),
	maintenance NVARCHAR(50)
);