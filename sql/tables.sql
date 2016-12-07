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


CREATE TABLE UserPhone (
  PhoneNumber VARCHAR(20) PRIMARY KEY NOT NULL,
  UserID      INTEGER REFERENCES User (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE INDEX X_UserPhone_PhoneNumber
  ON UserPhone (PhoneNumber);

CREATE TABLE Customer (
  UserID  INTEGER PRIMARY KEY NOT NULL REFERENCES User (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  Balance DECIMAL(10, 2)
);

CREATE TABLE Supplier (
  UserID      INTEGER PRIMARY KEY NOT NULL REFERENCES User (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CompanyName VARCHAR(256)
);

CREATE TABLE Product (
  ID                 INTEGER PRIMARY KEY NOT NULL,
  Name               VARCHAR(256),
  Description        VARCHAR(4096),
  Price              DECIMAL(8, 2),
  AvailableQuantitiy INTEGER,
  SupplierID         INTEGER REFERENCES Supplier (UserID)
    ON DELETE RESTRICT
    ON
    UPDATE CASCADE
);

CREATE TABLE Orders (
  ID              INTEGER PRIMARY KEY NOT NULL,
  UserID          INTEGER REFERENCES User (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  OrderDate       DATETIME,
  Status          VARCHAR(10),
  ShippingName    VARCHAR(256),
  ShippingAddress VARCHAR(2048),
  ShippingPhone   VARCHAR(20)
);

CREATE TABLE OrderItem (
  OrderID  INTEGER NOT NULL REFERENCES Orders (ID)
    ON DELETE
    CASCADE
    ON UPDATE CASCADE,
  UserID   INTEGER NOT NULL REFERENCES User (ID)
    ON DELETE
    CASCADE
    ON UPDATE CASCADE,
  Quantity INTEGER,
  PRIMARY KEY (OrderID, UserID)
);

CREATE TABLE CartItem (
  OrderID  INTEGER NOT NULL REFERENCES Orders (ID)
    ON DELETE
    CASCADE
    ON UPDATE CASCADE,
  UserID   INTEGER NOT NULL REFERENCES User (ID)
    ON DELETE
    CASCADE
    ON UPDATE CASCADE,
  Quantity INTEGER,
  PRIMARY KEY (OrderID, UserID)
);