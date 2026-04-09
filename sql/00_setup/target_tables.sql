USE DATABASE SALES_DWH_DEV;
USE SCHEMA SILVER;

-- =========================================================
-- SILVER.CUSTOMER_CLEAN
-- Pre-created target table for metadata-driven Bronze -> Silver load
-- =========================================================
CREATE OR REPLACE TABLE CUSTOMER_CLEAN (
                                           CUSTOMERID       NUMBER,
                                           PERSONID         NUMBER,
                                           STOREID          NUMBER,
                                           TERRITORYID      NUMBER,
                                           ACCOUNTNUMBER    STRING,
                                           ROWGUID          STRING,
                                           MODIFIEDDATE     TIMESTAMP_NTZ,
                                           CUSTOMER_TYPE    STRING
);

-- Optional validation
DESC TABLE CUSTOMER_CLEAN;