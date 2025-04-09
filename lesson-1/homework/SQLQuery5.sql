DROP TABLE IF EXISTS account;

CREATE TABLE account (
    account_id INT PRIMARY KEY,
    balance DECIMAL(10,2),
    account_type VARCHAR(50),
    CONSTRAINT chk_balance CHECK (balance >= 0),
    CONSTRAINT chk_account_type CHECK (account_type IN ('Saving', 'Checking'))
);

ALTER TABLE account
DROP CONSTRAINT chk_balance;

ALTER TABLE account
DROP CONSTRAINT chk_account_type;

ALTER TABLE account
ADD CONSTRAINT chk_balance CHECK (balance >= 0);

ALTER TABLE account
ADD CONSTRAINT chk_account_type CHECK (account_type IN ('Saving', 'Checking'));
