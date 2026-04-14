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

SELECT * FROM CUSTOMER_CLEAN LIMIT 10;

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
                                                        SALESORDERID NUMBER,
                                                        SALESORDERDETAILID NUMBER,
                                                        CARRIERTRACKINGNUMBER STRING,
                                                        ORDERQTY NUMBER,
                                                        PRODUCTID NUMBER,
                                                        SPECIALOFFERID NUMBER,
                                                        UNITPRICE NUMBER(10,5),
                                                        UNITPRICEDISCOUNT NUMBER(10,2),
                                                        LINETOTAL NUMBER(12,6),
                                                        ROWGUID STRING,
                                                        MODIFIEDDATE TIMESTAMP_NTZ
);

SELECT * FROM SALES_ORDER_DETAIL_CLEAN LIMIT 10;

CREATE TABLE IF NOT EXISTS SALES_ORDER_HEADER_CLEAN (
                                                        SALESORDERID NUMBER,
                                                        REVISIONNUMBER NUMBER,
                                                        ORDERDATE TIMESTAMP_NTZ,
                                                        DUEDATE TIMESTAMP_NTZ,
                                                        SHIPDATE TIMESTAMP_NTZ,
                                                        STATUS NUMBER,
                                                        ONLINEORDERFLAG NUMBER(1),
                                                        SALESORDERNUMBER STRING,
                                                        PURCHASEORDERNUMBER STRING,
                                                        ACCOUNTNUMBER STRING,
                                                        CUSTOMERID NUMBER,
                                                        SALESPERSONID NUMBER,
                                                        TERRITORYID NUMBER,
                                                        BILLTOADDRESSID NUMBER,
                                                        SHIPTOADDRESSID NUMBER,
                                                        SHIPMETHODID NUMBER,
                                                        CREDITCARDID NUMBER,
                                                        CREDITCARDAPPROVALCODE STRING,
                                                        CURRENCYRATEID NUMBER,
                                                        SUBTOTAL NUMBER(12,4),
                                                        TAXAMT NUMBER(10,4),
                                                        FREIGHT NUMBER(10,4),
                                                        TOTALDUE NUMBER(12,6),
                                                        ROWGUID STRING,
                                                        MODIFIEDDATE TIMESTAMP_NTZ

);

SELECT * FROM SALES_ORDER_HEADER_CLEAN LIMIT 10;
