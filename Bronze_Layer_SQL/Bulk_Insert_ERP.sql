/*
Use this query to bulk insert data into tables from ERP files.
*/


-- Local machine bulk insert into erp_cust_az12.
TRUNCATE TABLE bronze.erp_cust_az12;
GO

BULK INSERT bronze.erp_cust_az12
FROM 'D:\Projets_Git_Aggregated\DWH_MS.SQL.Server\Data_Source\source_erp\CUST_AZ12.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

SELECT * FROM bronze.erp_cust_az12;
SELECT COUNT(*) FROM bronze.erp_cust_az12;


-- Local machine bulk insert into erp_loc_a101.
TRUNCATE TABLE bronze.erp_loc_a101;
GO

BULK INSERT bronze.erp_loc_a101
FROM 'D:\Projets_Git_Aggregated\DWH_MS.SQL.Server\Data_Source\source_erp\LOC_A101.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

SELECT * FROM bronze.erp_loc_a101;
SELECT COUNT(*) FROM bronze.erp_loc_a101;


-- Local machine bulk insert into erp_px_cat_g1v2.
TRUNCATE TABLE bronze.erp_px_cat_g1v2;
GO

BULK INSERT bronze.erp_px_cat_g1v2
FROM 'D:\Projets_Git_Aggregated\DWH_MS.SQL.Server\Data_Source\source_erp\PX_CAT_G1V2.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

SELECT * FROM bronze.erp_px_cat_g1v2;
SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2;