/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'RSQWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

-- Switch to the Master Database
USE MASTER;
GO
## 
SELECT *
FROM sys.databases;
GO


--Check if database exists, and drop if it does.
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'RSQWarehouse')
BEGIN
	ALTER DATABASE RSQWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE RSQWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE RSQWarehouse;
GO

USE RSQWarehouse;
GO

-- Create Schemas

CREATE SCHEMA bronze;   -- Bronze Schema
GO

CREATE SCHEMA silver;   -- Silver Schema
GO

CREATE SCHEMA gold;    -- Gold Schema
GO

