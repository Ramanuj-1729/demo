USE hr_db;

SELECT __$update_mask ,
        ( SELECT    CC.column_name + ','
          FROM      cdc.captured_columns CC
                    INNER JOIN cdc.change_tables CT ON CC.[object_id] = CT.[object_id]
          WHERE     capture_instance = 'dbo_locations'
                    AND sys.fn_cdc_is_bit_set(CC.column_ordinal, LCT.__$update_mask) = 1
          FOR
            XML PATH('')
        ) AS changedcolumns
FROM    cdc.dbo_locations_CT LCT;
