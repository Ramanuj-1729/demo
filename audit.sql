CREATE SERVER AUDIT AuditUserActions
TO FILE (FILEPATH = 'D:\ssms')
WITH (ON_FAILURE = CONTINUE);
GO

USE hr_db;
GO

CREATE DATABASE AUDIT SPECIFICATION AuditSpec
FOR SERVER AUDIT AuditUserActions
ADD (UPDATE ON dbo.locations BY [public]),
ADD (INSERT ON dbo.locations BY [public]),
ADD (DELETE ON dbo.locations BY [public]);
GO

--ALTER SERVER AUDIT AuditUserActions WITH (STATE = ON);
--GO

ALTER DATABASE AUDIT SPECIFICATION AuditSpec WITH (STATE = ON);
GO

SELECT 
    event_time,
    session_server_principal_name AS [UserName],
    action_id,
    statement,
    additional_information
FROM 
    sys.fn_get_audit_file('D:\ssms*', NULL, NULL);

	SELECT 
  a.UserName, 
  a.AuditTime, 
  c.SchemaName, 
  c.TableName, 
  c.ColumnName, 
  c.OldValue, 
  c.NewValue 
FROM AuditData a
INNER JOIN cdc.dbo_locations_CT c 
  ON a.AuditTime >= c.ChangeTime AND a.AuditTime < DATEADD(second, 1, c.ChangeTime);



