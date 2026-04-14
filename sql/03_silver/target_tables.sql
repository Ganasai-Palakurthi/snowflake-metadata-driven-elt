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

CREATE TABLE IF NOT EXISTS SALES_ORDER_DETAIL_CLEAN (
                                                        SALES_ORDER_ID NUMBER,
                                                        SALES_ORDER_DETAIL_ID NUMBER,
                                                        CARRIER_TRACKING_NUMBER STRING,
                                                        ORDER_QTY NUMBER,
                                                        PRODUCT_ID NUMBER,
                                                        SPECIAL_OFFER_ID NUMBER,
                                                        UNIT_PRICE NUMBER(10,5),
                                                        UNIT_PRICE_DISCOUNT NUMBER(10,2),
                                                        LINE_TOTAL NUMBER(12,6),
                                                        ROWGUID STRING,
                                                        MODIFIED_DATE TIMESTAMP_NTZ
);

SELECT * FROM SALES_ORDER_DETAIL_CLEAN LIMIT 10;

CREATE TABLE IF NOT EXISTS SALES_ORDER_HEADER_CLEAN (
                                                        SALES_ORDER_ID NUMBER,
                                                        REVISION_NUMBER NUMBER,
                                                        ORDER_DATE TIMESTAMP_NTZ,
                                                        DUE_DATE TIMESTAMP_NTZ,
                                                        SHIP_DATE TIMESTAMP_NTZ,
                                                        STATUS NUMBER,
                                                        ONLINE_ORDER_FLAG NUMBER(1),
                                                        SALES_ORDER_NUMBER STRING,
                                                        PURCHASE_ORDER_NUMBER STRING,
                                                        ACCOUNT_NUMBER STRING,
                                                        CUSTOMER_ID NUMBER,
                                                        SALESPERSON_ID NUMBER,
                                                        TERRITORY_ID NUMBER,
                                                        BILL_TO_ADDRESS_ID NUMBER,
                                                        SHIP_TO_ADDRESS_ID NUMBER,
                                                        SHIP_METHOD_ID NUMBER,
                                                        CREDIT_CARD_ID NUMBER,
                                                        CREDIT_CARD_APPROVAL_CODE STRING,
                                                        CURRENCY_RATE_ID NUMBER,
                                                        SUBTOTAL NUMBER(12,4),
                                                        TAX_AMT NUMBER(10,4),
                                                        FREIGHT NUMBER(10,4),
                                                        TOTAL_DUE NUMBER(12,6),
                                                        ROWGUID STRING,
                                                        MODIFIED_DATE TIMESTAMP_NTZ

);

SELECT * FROM SALES_ORDER_HEADER_CLEAN LIMIT 10;
