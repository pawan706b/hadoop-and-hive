# A1: Working with JSON files
# ● Download a json file from ftp://nas.cs.smu.ca/share/5570/persons.json
# ● Create a table in Hive based on this file with the following fields: first_name, last_name,
# email, country
# ● Make sure that data is there by selecting all rows
# ● Write a query to count number of email addresses of persons from countries where
# country name starts from C. You can create additional “tables” if you wish

#
CREATE EXTERNAL TABLE IF NOT EXISTS persons (
    first_name STRING,
    last_name STRING,
    email ARRAY<STRING>,
    country STRING
)
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
LOCATION '/ls2';

#
SELECT * FROM persons_table;

# Create a temporary table to store persons from countries starting with 'C'
CREATE TEMPORARY TABLE persons_c_countries AS
SELECT *
FROM persons
WHERE country LIKE 'C%';

# Query to count the number of email addresses for each person
SELECT first_name, last_name, size(email) AS email_count
FROM persons_c_countries;

# Optionally, drop the temporary table after use
DROP TABLE IF EXISTS persons_c_countries;
