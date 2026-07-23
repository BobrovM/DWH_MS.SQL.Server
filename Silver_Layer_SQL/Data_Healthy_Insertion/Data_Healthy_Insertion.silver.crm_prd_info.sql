/*
	Insert with healthier data with rerun checks.
	TABLE: silver.crm_prd_info
*/

------ Just to check column order and name
SELECT TOP 100 * FROM silver.crm_prd_info


SELECT
	prd_id,
	REPLACE(SUBSTRING(TRIM(prd_key), 1, 5), '-', '_') AS cat_id,
	SUBSTRING((prd_key), 7, LEN(prd_key)) AS prd_key,
	prd_nm,
	COALESCE(prd_cost, 0) AS prd_cost,
	CASE UPPER(TRIM(prd_line)) 
		WHEN 'M' THEN 'Mountain'
		WHEN 'R' THEN 'Road'
		WHEN 'S' THEN 'Other Sales'
		WHEN 'T' THEN 'Touring'
		ELSE 'N/A'
	END prd_line,
	prd_start_dt,
	prd_end_dt
FROM bronze.crm_prd_info 