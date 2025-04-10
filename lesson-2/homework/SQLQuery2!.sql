DROP TABLE IF EXISTS data_types_demo;

CREATE TABLE data_types_demo (
    id INT PRIMARY KEY IDENTITY,
    
    -- Integer Types
    tinyint_col TINYINT,
    smallint_col SMALLINT,
    int_col INT,
    bigint_col BIGINT,
    
    -- Decimal and Float
    decimal_col DECIMAL(10, 2),
    float_col FLOAT,
    
    -- Date and Time
    date_col DATE,
    time_col TIME,
    datetime_col DATETIME,
    
    -- Unique Identifier
    guid_col UNIQUEIDENTIFIER
);

-- INSERT DATA
INSERT INTO data_types_demo (
    tinyint_col, smallint_col, int_col, bigint_col,
    decimal_col, float_col,
    date_col, time_col, datetime_col,
    guid_col
)
SELECT 
    255,              -- TINYINT (max)
    32000,            -- SMALLINT
    2000000000,       -- INT
    9000000000000000, -- BIGINT
    12345.67,         -- DECIMAL
    12345.6789,       -- FLOAT
    '2023-12-31',     -- DATE
    '14:30:00',       -- TIME
    GETDATE(),        -- DATETIME
    NEWID()          -- GUID
;

SELECT * FROM data_types_demo;
