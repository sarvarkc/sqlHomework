DROP TABLE IF EXISTS invoice;

CREATE TABLE invoice (
    invoice_id INT IDENTITY(1,1) PRIMARY KEY,
    amount DECIMAL(10, 2)
);

INSERT INTO invoice (amount) VALUES
    (150.00),
    (300.50),
    (99.99),
    (120.75),
    (400.00);

-- Step 4: Enable manual insert for IDENTITY column
SET IDENTITY_INSERT invoice ON;

-- Step 5: Insert manually specified invoice_id
INSERT INTO invoice (invoice_id, amount) VALUES (100, 999.99);

-- Step 6: Disable IDENTITY_INSERT
SET IDENTITY_INSERT invoice OFF;

SELECT * FROM invoice;
