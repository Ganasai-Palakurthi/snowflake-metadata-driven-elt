USE DATABASE SALES_DWH_DEV;

-- Set the active schema context for raw data ingestion
-- Bronze is used to store source-aligned data with minimal transformation
USE SCHEMA BRONZE;


-- Create raw customer table to store source data as received
CREATE TABLE IF NOT EXISTS CUSTOMER_RAW (
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

SELECT * FROM CUSTOMER_RAW LIMIT 5;

CREATE TABLE IF NOT EXISTS PRODUCT_RAW (
                                        ProductID NUMBER,
                                        Name STRING,
                                        ProductNumber STRING,
                                        MakeFlag NUMBER(1),
                                        FinishedGoodsFlag NUMBER(1),
                                        Color STRING,
                                        SafetyStockLevel NUMBER,
                                        ReorderPoint NUMBER,
                                        StandardCost NUMBER(10,2),
                                        ListPrice NUMBER(10,2),
                                        Size STRING,
                                        SizeUnitMeasureCode STRING,
                                        WeightUnitMeasureCode STRING,
                                        Weight NUMBER(10,2),
                                        DaysToManufacture NUMBER,
                                        ProductLine STRING,
                                        Class STRING,
                                        Style STRING,
                                        ProductSubcategoryID NUMBER,
                                        ProductModelID NUMBER,
                                        SellStartDate TIMESTAMP_NTZ,
                                        SellEndDate TIMESTAMP_NTZ,
                                        DiscontinuedDate TIMESTAMP_NTZ,
                                        rowguid STRING,
                                        ModifiedDate TIMESTAMP_NTZ
);

COPY INTO PRODUCT_RAW
    FROM @SALES_DWH_DEV.CONTROL.BRONZE_STAGE/product/
    FILE_FORMAT = (FORMAT_NAME = SALES_DWH_DEV.CONTROL.CSV_FILE_FORMAT);

SELECT * FROM PRODUCT_RAW LIMIT 5;

CREATE TABLE IF NOT EXISTS SALES_ORDER_DETAIL_RAW (
                                                   SalesOrderID NUMBER,
                                                   SalesOrderDetailID NUMBER,
                                                   CarrierTrackingNumber STRING,
                                                   OrderQty NUMBER,
                                                   ProductID NUMBER,
                                                   SpecialOfferID NUMBER,
                                                   UnitPrice NUMBER(10,5),
                                                   UnitPriceDiscount NUMBER(10,2),
                                                   LineTotal NUMBER(12,6),
                                                   rowguid STRING,
                                                   ModifiedDate TIMESTAMP_NTZ
);

COPY INTO SALES_ORDER_DETAIL_RAW
    FROM @SALES_EXT_STAGE/sales_order_detail/
    FILE_FORMAT = (FORMAT_NAME = CSV_FILE_FORMAT);

SELECT * FROM SALES_ORDER_DETAIL_RAW LIMIT 5;

-- Create raw sales order header table for order-level transactional data
CREATE TABLE IF NOT EXISTS SALES_ORDER_HEADER_RAW (
                                                   SalesOrderID NUMBER,
                                                   RevisionNumber NUMBER,
                                                   OrderDate TIMESTAMP_NTZ,
                                                   DueDate TIMESTAMP_NTZ,
                                                   ShipDate TIMESTAMP_NTZ,
                                                   Status NUMBER,
                                                   OnlineOrderFlag NUMBER(1),
                                                   SalesOrderNumber STRING,
                                                   PurchaseOrderNumber STRING,
                                                   AccountNumber STRING,
                                                   CustomerID NUMBER,
                                                   SalesPersonID NUMBER,
                                                   TerritoryID NUMBER,
                                                   BillToAddressID NUMBER,
                                                   ShipToAddressID NUMBER,
                                                   ShipMethodID NUMBER,
                                                   CreditCardID NUMBER,
                                                   CreditCardApprovalCode STRING,
                                                   CurrencyRateID NUMBER,
                                                   SubTotal NUMBER(12,4),
                                                   TaxAmt NUMBER(10,4),
                                                   Freight NUMBER(10,4),
                                                   TotalDue NUMBER(12,6),
                                                   Comment STRING,
                                                   rowguid STRING,
                                                   ModifiedDate TIMESTAMP_NTZ
);

COPY INTO SALES_ORDER_HEADER_RAW
    FROM @SALES_EXT_STAGE/sales_order_header/
    FILE_FORMAT = (FORMAT_NAME = CSV_FILE_FORMAT);

SELECT * FROM SALES_ORDER_HEADER_RAW LIMIT 5;