USE hr_db;

SELECT
    sys.fn_cdc_map_lsn_to_time(LC.__$start_lsn) AS ChangeStartTime,
    sys.fn_cdc_map_lsn_to_time(LC.__$end_lsn) AS ChangeEndTime,
    LC.*
FROM 
    cdc.dbo_locations_CT LC
ORDER BY 
    LC.__$start_lsn;
