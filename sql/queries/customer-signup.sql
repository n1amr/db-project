BEGIN;

INSERT INTO User (FirstName, LastName, Email, Password,
                  Address, BankAccountNo)
VALUES (:FIRST_NAME, :LAST_NAME, :EMAIL, :PASSWORD,
        :ADDRESS, :BANK_ACCOUNT_NO);

INSERT INTO Customer (UserID, Balance)
VALUES (last_insert_id(), 0.0);

COMMIT;
