USE user_db;

SELECT 
    __$update_mask,
    ( 
        SELECT 
            STRING_AGG(CC.column_name, ',')
        FROM 
            cdc.captured_columns CC
            INNER JOIN cdc.change_tables CT ON CC.[object_id] = CT.[object_id]
        WHERE 
            CT.capture_instance = 'dbo_user_details'
            AND sys.fn_cdc_is_bit_set(CC.column_ordinal, UDC.__$update_mask) = 1
    ) AS changedcolumns
FROM 
    cdc.dbo_user_details_CT UDC;