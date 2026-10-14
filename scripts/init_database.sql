
/*
===============================================================================
Create Database and Schemas
===============================================================================
Script Purpose:
    This script creates a new database named 'warehouse' after checking
    whether it already exists.

    If the database exists, it is dropped and recreated. The script also
    creates three schemas: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'warehouse' database if it exists.
    All existing data and database objects will be permanently deleted.
    Ensure you have proper backups before executing this script.
===============================================================================
*/

USE master;
GO

-- ===========================================================================
-- Drop and recreate the 'warehouse' database
-- ===========================================================================

IF EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'warehouse'
)
BEGIN
    ALTER DATABASE warehouse
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    DROP DATABASE warehouse;
END;
GO

-- ===========================================================================
-- Create the 'warehouse' database
-- ===========================================================================

CREATE DATABASE warehouse;
GO

-- ===========================================================================
-- Switch to the 'warehouse' database
-- ===========================================================================

USE warehouse;
GO

-- ===========================================================================
-- Create the Bronze schema for raw data
-- ===========================================================================

CREATE SCHEMA bronze;
GO

-- ===========================================================================
-- Create the Silver schema for cleaned and transformed data
-- ===========================================================================

CREATE SCHEMA silver;
GO

-- ===========================================================================
-- Create the Gold schema for business-ready data
-- ===========================================================================

CREATE SCHEMA gold;
GO

-- ===========================================================================
-- Verify the created schemas
-- ===========================================================================

SELECT name AS schema_name
FROM sys.schemas
WHERE name IN ('bronze', 'silver', 'gold')
ORDER BY name;
GO

