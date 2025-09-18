USE fraud_detection;

SELECT TOP 10 * 
FROM fraud_train
WHERE is_fraud = 1;

SELECT  COUNT(DISTINCT cc_num)
FROM fraud_train;

DROP VIEW IF EXISTS vw_FraudData;


CREATE VIEW vw_FraudData AS
SELECT 
    trans_num,
    trans_date_trans_time,
    amt,
    age,
    gender,
    hour_of_day,
    day_of_week,
    time_category,
    distance_customer_merchant,
    category,
    merchant,
    job,
    fraud_label
FROM fraud_train;
