/*
	Check Data Quality
	TABLE: bronze.crm_prd_info
*/

------ Just in case
USE DataWarehouseDB
GO


------ Get all possible columns
SELECT TOP 10
	*
FROM bronze.crm_prd_info


------ Check PK for existing duplicates or NULLs
SELECT
	prd_id,
	COUNT(*) AS Entries
FROM bronze.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 or prd_id IS NULL


------ Check for spaces before and after data
SELECT
	prd_id,
	prd_key
FROM bronze.crm_prd_info
WHERE prd_key != TRIM(prd_key)

SELECT
	prd_id,
	prd_nm
FROM bronze.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

SELECT
	prd_id,
	prd_line
FROM bronze.crm_prd_info
WHERE prd_line != TRIM(prd_line)


------ Check values for standartization
SELECT
	DISTINCT prd_line
FROM bronze.crm_prd_info


------ Check absurd values
SELECT
	prd_id,
	prd_cost
FROM bronze.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL
-- 2 NULL entries


------ Check absurd start end date relations
SELECT
	*
FROM bronze.crm_prd_info
WHERE prd_start_dt > prd_end_dt