USE DATABASE SALES_DWH_DEV;
USE SCHEMA CONTROL;

-- =========================================================
-- CONTROL.LOAD_CONFIG
-- One row per pipeline
-- Stores source-to-target pipeline metadata
-- =========================================================
CREATE OR REPLACE TABLE LOAD_CONFIG (
    PIPELINE_NAME         STRING         NOT NULL,
    SOURCE_TABLE          STRING         NOT NULL,
    TARGET_TABLE          STRING         NOT NULL,
    LOAD_TYPE             STRING         NOT NULL,   -- FULL / INCREMENTAL
    LOAD_MODE             STRING         NOT NULL,   -- TRUNCATE_INSERT / MERGE
    ACTIVE_FLAG           BOOLEAN        NOT NULL DEFAULT TRUE,
    PIPELINE_DESCRIPTION  STRING,
    CREATED_AT            TIMESTAMP_NTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    UPDATED_AT            TIMESTAMP_NTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP()
);

-- =========================================================
-- CONTROL.COLUMN_MAPPING
-- One row per target column for a pipeline
-- Stores transformation/mapping metadata
-- =========================================================
CREATE OR REPLACE TABLE COLUMN_MAPPING (
    PIPELINE_NAME         STRING         NOT NULL,
    COLUMN_SEQUENCE       NUMBER(10,0)   NOT NULL,
    SOURCE_COLUMN         STRING,
    TARGET_COLUMN         STRING         NOT NULL,
    TRANSFORM_EXPRESSION  STRING         NOT NULL,
    ACTIVE_FLAG           BOOLEAN        NOT NULL DEFAULT TRUE,
    CREATED_AT            TIMESTAMP_NTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    UPDATED_AT            TIMESTAMP_NTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP()
);

-- Optional validation
DESC TABLE LOAD_CONFIG;
DESC TABLE COLUMN_MAPPING;