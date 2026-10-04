-- Generated: 2026-09-27 12:51:51
-- Database: RESTURANTOP
-- User: admin_dbxproject

-- NOTE: Azure SQL Database detected - USE statements omitted
-- Ensure you are connected to the correct database: RESTURANTOP
-- Current database: SELECT DB_NAME() AS CurrentDatabase;

-- CONFIGURATION FIX - Upgrade Utility Objects
-- Current version: 1.1, Required version: 1.5


PRINT 'Preparing database for Lakeflow utility objects upgrade: RESTURANTOP';
PRINT 'Current version: 1.1';
PRINT 'Target version: 1.5';

-- NEXT STEPS:
-- 1. Download the latest lakeflow-utility-objects.sql script from:
--    https://docs.databricks.com/aws/en/ingestion/lakeflow-connect/sql-server-source-setup
-- 2. Execute the entire contents of that script in this database
-- 3. Re-run validation to verify upgrade

-- The latest script will automatically upgrade existing objects

PRINT 'Database context set to: RESTURANTOP';
PRINT 'Ready for lakeflow-utility-objects.sql script execution';


-- Azure SQL Database Platform Notes:
-- • Connect directly to the target database instead of using USE statements
-- • Server-scoped permissions may require Azure administrator access
-- • Consider using database roles for broader access patterns
 -- Generated: 2026-09-27 12:51:51
-- Database: RESTURANTOP
-- User: admin_dbxproject

-- NOTE: Azure SQL Database detected - USE statements omitted
-- Ensure you are connected to the correct database: RESTURANTOP
-- Current database: SELECT DB_NAME() AS CurrentDatabase;

-- CONFIGURATION FIX - Upgrade DDL Support Objects
-- This upgrades DDL support objects to the latest version
-- Current Version: DdlSupportObjectVersion{majorVersion=1, minorVersion=3}
-- Required Version: DdlSupportObjectVersion{majorVersion=1, minorVersion=5}


-- Execute utility procedures to upgrade DDL support objects
-- Note: Choose the appropriate method based on your change data capture strategy

-- Option 1: For change tracking environments
EXEC [dbo].[lakeflowSetupChangeTracking]
    @Tables = NULL; -- NULL = database-level setup

-- Option 2: For Change Data Capture environments
EXEC [dbo].[lakeflowSetupChangeDataCapture]
    @Tables = NULL; -- NULL = database-level setup

-- Verify upgrade
PRINT 'DDL support objects upgrade completed for database: RESTURANTOP';
PRINT 'Please re-run validation to confirm successful upgrade';


-- Azure SQL Database Platform Notes:
-- • Connect directly to the target database instead of using USE statements
-- • Server-scoped permissions may require Azure administrator access
-- • Consider using database roles for broader access patterns
