/*
	Check Data Quality
	TABLE: bronze.crm_cust_info
*/
------ Just in case
USE DataWarehouseDB
GO


------ See all possible columns
SELECT TOP 10
	*
FROM bronze.crm_cust_info


------ Check for PK duplicates
SELECT 
	cst_i,
	COUNT(*)
FROM bronze.crm_cust_info
GROUP BY cst_i
HAVING COUNT(*) > 1 OR cst_i IS NULL


------ Check for spaces before\after data
SELECT
	cst_i,
	cst_firstname
FROM bronze.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

SELECT
	cst_i,
	cst_lastname
FROM bronze.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

SELECT
	cst_i,
	cst_marital_status
FROM bronze.crm_cust_info
WHERE cst_marital_status != TRIM(cst_marital_status)

SELECT
	cst_i,
	cst_gndr
FROM bronze.crm_cust_info
WHERE cst_gndr != TRIM(cst_gndr)


------ Check possible values for standartization and consistency
SELECT
	DISTINCT cst_gndr
FROM bronze.crm_cust_info

SELECT
	DISTINCT cst_marital_status
FROM bronze.crm_cust_info