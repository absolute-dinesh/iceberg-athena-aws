select * from iceberg_tutorial_db.nyc_taxi_csv limit 10;

select * from iceberg_tutorial_db.nyc_taxi_iceberg limit 10;

SELECT day(tpep_pickup_datetime) , * FROM nyc_taxi_iceberg WHERE day(tpep_pickup_datetime) =  5 limit 20;

INSERT INTO nyc_taxi_iceberg_data_manipulation
SELECT * FROM nyc_taxi_iceberg;

UPDATE nyc_taxi_iceberg_data_manipulation SET passenger_count = 4.0 WHERE vendorid = 2 AND year(tpep_pickup_datetime) =2022;

SELECT * FROM nyc_taxi_iceberg_data_manipulation WHERE vendorid = 2 and year(tpep_pickup_datetime) =2022 limit 10;

SELECT array_agg(a) OVER(
   ORDER BY a ASC NULLS FIRST GROUPS BETWEEN 1 PRECEDING AND 2 FOLLOWING) 
FROM (VALUES 3, 3, 3, 2, 2, 1, null, null) T(a);


SELECT * FROM nyc_taxi_iceberg_data_manipulation FOR SYSTEM_TIME AS OF TIMESTAMP '2022-11-01 22:00:00' WHERE vendorid = 2 and year(tpep_pickup_datetime)= 2022 limit 10; 

----- Failed line with :  1:54: mismatched input 'SYSTEM_TIME'. Expecting: 'TIMESTAMP', 'VERSION'


SELECT * FROM nyc_taxi_iceberg_data_manipulation FOR TIMESTAMP AS OF (current_timestamp - interval '10' MINUTE)