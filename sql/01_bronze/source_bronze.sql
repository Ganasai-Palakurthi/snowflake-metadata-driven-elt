USE DATABASE SALES_DWH_DEV;

-- Set the active schema context for raw data ingestion
-- Bronze is used to store source-aligned data with minimal transformation
USE SCHEMA BRONZE;


-- Create raw customer table to store source data as received
CREATE OR REPLACE TABLE CUSTOMER_RAW (
                                         CustomerID NUMBER,
                                         PersonID NUMBER,
                                         StoreID NUMBER,
                                         TerritoryID NUMBER,
                                         AccountNumber STRING,
                                         rowguid STRING,
                                         ModifiedDate TIMESTAMP_NTZ
);


COPY INTO CUSTOMER_RAW
    FROM @SALES_DWH_DEV.CONTROL.BRONZE_STAGE/customer/
    FILE_FORMAT = (FORMAT_NAME = SALES_DWH_DEV.CONTROL.CSV_FILE_FORMAT);