/*
Use this query to bulk insert data into tables from CRM files.
*/
-- Just in case
USE DataWarehouseDB
GO

CREATE OR ALTER PROCEDURE bronze.load_bronze_crm AS
BEGIN	
	DECLARE @exec_start_time DATETIME, @exec_end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		PRINT 'CRM LOAD'
		SET @batch_start_time = GETDATE()
		--------
		-- Local machine bulk insert into crm_cust_info.
		TRUNCATE TABLE bronze.crm_cust_info;

		SET @exec_start_time = GETDATE()
		BULK INSERT bronze.crm_cust_info
		FROM 'D:\Projets_Git_Aggregated\DWH_MS.SQL.Server\Data_Source\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @exec_end_time = GETDATE()
		PRINT 'crm_cust_info LOAD DURATION: ' + CAST(DATEDIFF(millisecond, @exec_start_time, @exec_end_time) AS NVARCHAR) + ' MILLISEC'

		--SELECT TOP 100 * FROM bronze.crm_cust_info;
		--SELECT COUNT(*) FROM bronze.crm_cust_info;


		--------
		-- Local machine bulk insert into crm_prd_info.
		TRUNCATE TABLE bronze.crm_prd_info;

		SET @exec_start_time = GETDATE()
		BULK INSERT bronze.crm_prd_info
		FROM 'D:\Projets_Git_Aggregated\DWH_MS.SQL.Server\Data_Source\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @exec_end_time = GETDATE()
		PRINT 'crm_prd_info LOAD DURATION: ' + CAST(DATEDIFF(millisecond, @exec_start_time, @exec_end_time) AS NVARCHAR) + ' MILLISEC'

		--SELECT TOP 100 * FROM bronze.crm_prd_info;
		--SELECT COUNT(*) FROM bronze.crm_prd_info;


		--------
		-- Local machine bulk insert into crm_sales_details.
		TRUNCATE TABLE bronze.crm_sales_details;

		SET @exec_start_time = GETDATE()
		BULK INSERT bronze.crm_sales_details
		FROM 'D:\Projets_Git_Aggregated\DWH_MS.SQL.Server\Data_Source\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @exec_end_time = GETDATE()
		PRINT 'crm_sales_details LOAD DURATION: ' + CAST(DATEDIFF(millisecond, @exec_start_time, @exec_end_time) AS NVARCHAR) + ' MILLISEC'

		--SELECT TOP 100 * FROM bronze.crm_sales_details;
		--SELECT COUNT(*) FROM bronze.crm_sales_details;
		SET @batch_end_time = GETDATE()
		PRINT 'WHOLE CRM BATCH LOAD DURATION: ' + CAST(DATEDIFF(millisecond, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' MILLISEC'

	END TRY
	BEGIN CATCH
		PRINT 'CRM LOAD FAILED'
		PRINT 'Error:' + ERROR_MESSAGE();
		PRINT CAST(ERROR_NUMBER() AS NVARCHAR)
		PRINT CAST(ERROR_STATE() AS NVARCHAR)
	END CATCH
END