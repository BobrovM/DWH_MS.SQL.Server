/*
Use this query to bulk insert data into tables from ERP files.
*/
-- Just in case
USE DataWarehouseDB
GO

CREATE OR ALTER PROCEDURE bronze.load_bronze_erp AS
BEGIN
	DECLARE @exec_start_time DATETIME, @exec_end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		PRINT 'ERP LOAD'
		SET @batch_start_time = GETDATE()
		--------
		-- Local machine bulk insert into erp_cust_az12.
		TRUNCATE TABLE bronze.erp_cust_az12

		SET @exec_start_time = GETDATE()
		BULK INSERT bronze.erp_cust_az12
		FROM 'D:\Projets_Git_Aggregated\DWH_MS.SQL.Server\Data_Source\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @exec_end_time = GETDATE()
		PRINT 'CUST_AZ12 LOAD DURATION: ' + CAST(DATEDIFF(millisecond, @exec_start_time, @exec_end_time) AS NVARCHAR) + ' MILLISEC'

		--SELECT TOP 100 * FROM bronze.erp_cust_az12;
		--SELECT COUNT(*) FROM bronze.erp_cust_az12;


		--------
		-- Local machine bulk insert into erp_loc_a101.
		TRUNCATE TABLE bronze.erp_loc_a101;

		SET @exec_start_time = GETDATE()
		BULK INSERT bronze.erp_loc_a101
		FROM 'D:\Projets_Git_Aggregated\DWH_MS.SQL.Server\Data_Source\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @exec_end_time = GETDATE()
		PRINT 'erp_loc_a101 LOAD DURATION: ' + CAST(DATEDIFF(millisecond, @exec_start_time, @exec_end_time) AS NVARCHAR) + ' MILLISEC'

		--SELECT TOP 100 * FROM bronze.erp_loc_a101;
		--SELECT COUNT(*) FROM bronze.erp_loc_a101;


		--------
		-- Local machine bulk insert into erp_px_cat_g1v2.
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		SET @exec_start_time = GETDATE()
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'D:\Projets_Git_Aggregated\DWH_MS.SQL.Server\Data_Source\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @exec_end_time = GETDATE()
		PRINT 'erp_px_cat_g1v2 LOAD DURATION: ' + CAST(DATEDIFF(millisecond, @exec_start_time, @exec_end_time) AS NVARCHAR) + ' MILLISEC'

		--SELECT TOP 100 * FROM bronze.erp_px_cat_g1v2;
		--COUNT(*) FROM bronze.erp_px_cat_g1v2;

		SET @batch_end_time = GETDATE()
		PRINT 'WHOLE ERP BATCH LOAD DURATION: ' + CAST(DATEDIFF(millisecond, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' MILLISEC'

	END TRY
	BEGIN CATCH
		PRINT 'ERP LOAD FAIL'
		PRINT 'Error:' + ERROR_MESSAGE();
		PRINT CAST(ERROR_NUMBER() AS NVARCHAR)
		PRINT CAST(ERROR_STATE() AS NVARCHAR)
	END CATCH
END