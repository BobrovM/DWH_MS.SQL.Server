/*
Use this query to bulk insert data into tables from CRM files.
*/


-- Local machine bulk insert into crm_cust_info.
TRUNCATE TABLE bronze.crm_cust_info;
GO

BULK INSERT bronze.crm_cust_info
FROM 'D:\Projets_Git_Aggregated\DWH_MS.SQL.Server\Data_Source\source_crm\cust_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

SELECT * FROM bronze.crm_cust_info;
SELECT COUNT(*) FROM bronze.crm_cust_info;


-- Local machine bulk insert into crm_prd_info.
TRUNCATE TABLE bronze.crm_prd_info;
GO

BULK INSERT bronze.crm_prd_info
FROM 'D:\Projets_Git_Aggregated\DWH_MS.SQL.Server\Data_Source\source_crm\prd_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

SELECT * FROM bronze.crm_prd_info;
SELECT COUNT(*) FROM bronze.crm_prd_info;


-- Local machine bulk insert into crm_sales_details.
TRUNCATE TABLE bronze.crm_sales_details;
GO

BULK INSERT bronze.crm_sales_details
FROM 'D:\Projets_Git_Aggregated\DWH_MS.SQL.Server\Data_Source\source_crm\sales_details.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

SELECT * FROM bronze.crm_sales_details;
SELECT COUNT(*) FROM bronze.crm_sales_details;