USE DATABASE SALES_DWH_DEV;
USE SCHEMA SILVER;

-- =========================================================
-- SILVER.CUSTOMER_CLEAN
-- Pre-created target table for metadata-driven Bronze -> Silver load
-- =========================================================
CREATE TABLE IF NOT EXISTS CUSTOMER_CLEAN (
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

SELECT * FROM SALES_DWH_DEV.SILVER.CUSTOMER_CLEAN LIMIT 10;

CREATE TABLE IF NOT EXISTS PRODUCT_CLEAN (
                                             PRODUCTID                NUMBER,
                                             NAME                     STRING,
                                             PRODUCTNUMBER            STRING,
                                             MAKEFLAG                 NUMBER(1),
                                             FINISHEDGOODSFLAG        NUMBER(1),
                                             COLOR                    STRING,
                                             SAFETYSTOCKLEVEL         NUMBER,
                                             REORDERPOINT             NUMBER,
                                             STANDARDCOST             NUMBER(10,2),
                                             LISTPRICE                NUMBER(10,2),
                                             SIZE                     STRING,
                                             SIZEUNITMEASURECODE      STRING,
                                             WEIGHTUNITMEASURECODE    STRING,
                                             WEIGHT                   NUMBER(10,2),
                                             DAYSTOMANUFACTURE        NUMBER,
                                             PRODUCTLINE              STRING,
                                             CLASS                    STRING,
                                             STYLE                    STRING,
                                             PRODUCTSUBCATEGORYID     NUMBER,
                                             PRODUCTMODELID           NUMBER,
                                             SELLSTARTDATE            TIMESTAMP_NTZ,
                                             SELLENDDATE              TIMESTAMP_NTZ,
                                             DISCONTINUEDDATE         TIMESTAMP_NTZ,
                                             ROWGUID                  STRING,
                                             MODIFIEDDATE             TIMESTAMP_NTZ
);

SELECT * FROM PRODUCT_CLEAN LIMIT 10;