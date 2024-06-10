USE user_db;

EXEC sp_changedbowner 'sa';

-- Enable CDC on Database
EXEC sys.sp_cdc_enable_db;

-- Check CDC is enabled on the Database
SELECT name, is_cdc_enabled
FROM sys.databases WHERE database_id = DB_ID();

-- Enable CDC on a specific table
EXEC sys.sp_cdc_enable_table
	@source_schema = N'dbo',
	@source_name = N'user_details',
	@role_name = N'dev',
	@capture_instance = Null,
	@supports_net_changes = 1;

-- Disable a Capture Instance for a table
EXEC sys.sp_cdc_disable_table
    @source_schema = N'dbo',
    @source_name   = N'user_details',
    @capture_instance = N'dbo_user_details';