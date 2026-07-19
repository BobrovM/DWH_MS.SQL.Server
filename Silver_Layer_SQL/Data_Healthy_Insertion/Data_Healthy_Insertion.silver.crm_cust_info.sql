/*
	Insert with healthier data with rerun checks.
	TABLE: bronze.crm_cust_info
*/
------ Just to check column order and name
SELECT TOP 100 * FROM silver.crm_cust_info


------ Insert healthy data
INSERT INTO silver.crm_cust_info (
	cst_i,
	cst_key,
	cst_firstname,
	cst_lastname,
	cst_marital_status,
	cst_gndr,
	cst_create_date
)
SELECT
	cst_i,
	TRIM(cst_key),
	TRIM(cst_firstname) AS cst_firstname,
	TRIM(cst_lastname) AS cst_lastname,
	CASE 
		WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
		WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
		ELSE 'N/A'
	END AS cst_marital_status,
	CASE 
		WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
		WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
		ELSE 'N/A'
	END AS cst_gndr,
	cst_create_date
FROM(
	SELECT
	*,
	ROW_NUMBER() OVER(PARTITION BY cst_i ORDER BY cst_create_date DESC) AS flag_last
	FROM bronze.crm_cust_info)t
WHERE flag_last = 1 AND cst_i IS NOT NULL


------ Rerun checks from Data Quality Check
------ See all possible columns
SELECT TOP 100 * FROM silver.crm_cust_info


------ Check for PK duplicates
SELECT 
	cst_i,
	COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_i
HAVING COUNT(*) > 1 OR cst_i IS NULL


------ Check for spaces before\after data
SELECT
	cst_i,
	cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT
	cst_i,
	cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

SELECT
	cst_i,
	cst_marital_status
FROM silver.crm_cust_info
WHERE cst_marital_status != TRIM(cst_marital_status)

SELECT
	cst_i,
	cst_gndr
FROM silver.crm_cust_info
WHERE cst_gndr != TRIM(cst_gndr)


------ Check possible values for standartization and consistency
SELECT
	DISTINCT cst_gndr
FROM silver.crm_cust_info

SELECT
	DISTINCT cst_marital_status
FROM silver.crm_cust_info