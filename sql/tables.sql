USE ecommerce;

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


CREATE CREATE TABLE UserPhone (
  PhoneNumber VARCHAR(20) PRIMARY KEY NOT NULL,
  UserID      INTEGER,
  FOREIGN KEY (UserID) REFERENCES User (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE INDEX X_UserPhone_PnoneNumber
  ON UserPhone (PhoneNumber);
