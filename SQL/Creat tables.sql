CREATE DATABASE fraud_detection;

USE fraud_detection;

CREATE TABLE fraud_train (
    trans_date_trans_time DATETIME,           -- Transaction timestamp
    cc_num               BIGINT,              -- Credit card number (pseudonymized)
    merchant             VARCHAR(100),        -- Merchant name/ID
    category             VARCHAR(50),         -- Transaction category
    amount               DECIMAL(10,2),       -- Transaction amount
    gender               CHAR(1),             -- M/F
    city                 VARCHAR(100),        -- Customer city
    state                VARCHAR(50),         -- Customer state
    zip                  VARCHAR(10),         -- Postal code
    lat                  DECIMAL(9,6),        -- Customer latitude
    long                 DECIMAL(9,6),        -- Customer longitude
    city_pop             INT,                 -- City population
    job                  VARCHAR(100),        -- Customer job
    dob                  DATE,                -- Date of birth
    trans_num            VARCHAR(100),         -- Transaction number
    unix_time            BIGINT,              -- Transaction time (Unix epoch)
    merchant_lat         DECIMAL(9,6),        -- Merchant latitude
    merchant_long        DECIMAL(9,6),        -- Merchant longitude
    is_fraud             TINYINT,              -- 0 = legit, 1 = fraud
    distance_customer_merchant DECIMAL(10,3) -- Precomputed distance (km)
);