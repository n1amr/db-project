BEGIN;

INSERT INTO User (FirstName, LastName, Email, Password,
                  Address, BankAccountNo)
VALUES (:FIRST_NAME, :LAST_NAME, :EMAIL, :PASSWORD,
        :ADDRESS, :BANK_ACCOUNT_NO);

INSERT INTO Supplier (UserID, CompanyName)
VALUES (last_insert_id(), :COMPANY_NAME);

COMMIT;
