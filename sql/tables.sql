USE ecommerce;
DROP TABLE IF EXISTS User;
CREATE TABLE User (
  ID            INTEGER PRIMARY KEY NOT NULL,
  FirstName     VARCHAR(64),
  LastName      VARCHAR(64),
  Email         VARCHAR(256) UNICODE,
  Password      VARCHAR(256),
  Address       VARCHAR(1024),
  BankAccountNo VARCHAR(256)
);

CREATE INDEX X_User_Email
  ON User (Email);
