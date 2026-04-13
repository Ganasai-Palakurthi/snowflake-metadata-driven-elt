USE DATABASE SALES_DWH_DEV;
USE SCHEMA CONTROL;

CREATE TABLE IF NOT EXISTS PIPELINE_RUN_LOG (
                                             RUN_ID NUMBER IDENTITY(1,1),
                                             PIPELINE_NAME STRING,
                                             SOURCE_TABLE STRING,
                                             TARGET_TABLE STRING,
                                             LOAD_TYPE STRING,
                                             LOAD_MODE STRING,
                                             STATUS STRING,
                                             START_TIME TIMESTAMP_NTZ,
                                             END_TIME TIMESTAMP_NTZ,
                                             ROWS_LOADED NUMBER,
                                             ERROR_MESSAGE STRING,
                                             EXECUTED_SQL STRING,
                                             CREATED_AT TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP()
);