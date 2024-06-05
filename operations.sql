USE hr_db;

-- Insert in employee table
INSERT INTO locations(
	street_address, postal_code, city, state_province, country_id
) VALUES (
	'142 phase 1', '951254', 'aya nagar', 'delhi', 'IN'
);

-- Delete in employee table
DELETE FROM locations WHERE location_id = 2702;

-- Update in employee table
UPDATE locations
SET postal_code = '369258', state_province = 'xyz'
WHERE location_id = 2400;