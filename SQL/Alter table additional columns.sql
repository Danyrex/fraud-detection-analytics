ALTER TABLE fraud_train
ADD age INT;

UPDATE fraud_train
SET age = DATEDIFF(YEAR, dob, trans_date_trans_time)
          - CASE 
                WHEN DATEADD(YEAR, DATEDIFF(YEAR, dob, trans_date_trans_time), dob) > trans_date_trans_time 
                THEN 1 ELSE 0 
            END;

ALTER TABLE fraud_train
ADD hour_of_day INT;

UPDATE fraud_train
SET hour_of_day = DATEPART(HOUR, trans_date_trans_time);

ALTER TABLE fraud_train
ADD day_of_week VARCHAR(10);

UPDATE fraud_train
SET day_of_week = DATENAME(WEEKDAY, trans_date_trans_time);


ALTER TABLE fraud_train
ADD fraud_label VARCHAR(10);

UPDATE fraud_train
SET fraud_label = CASE WHEN is_fraud = 1 THEN 'Fraud' ELSE 'Legit' END;

ALTER TABLE fraud_train
ADD time_category VARCHAR(20);

UPDATE fraud_train
SET time_category = CASE 
    WHEN hour_of_day BETWEEN 6 AND 11 THEN 'Morning'
    WHEN hour_of_day BETWEEN 12 AND 17 THEN 'Afternoon'
    WHEN hour_of_day BETWEEN 18 AND 22 THEN 'Evening'
    ELSE 'Night'
END;

SELECT TOP 10 * FROM fraud_train;
