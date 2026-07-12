/*
Use this query to create the database and schemas.
	Medallion architecture.
	Each schema is a medallion architecture stage.

!!!WARNING!!!
	FULLY RUNNING THIS SCRIPT WILL DROP EXISTING DB 'DataWarehouseDB'.
	PERMANENT DELETION, PROCEED IF BACKUPS EXISTS.
*/

USE master;
GO

---- To drop and recreate if exists !!!USE WITH CAUTION
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouseDB')
BEGIN
	-- Kick everyone out and burn it
	ALTER DATABASE DataWarehouseDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouseDB
END
GO

------------------
CREATE DATABASE DataWarehouseDB;
GO

-------------------
USE DataWarehouseDB;
GO

-------------------
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO