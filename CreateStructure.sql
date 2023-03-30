CREATE TABLE SKU
(
 ID int PRIMARY KEY IDENTITY(1,1),
 Code AS CONCAT('s', ID) UNIQUE,
 Name varchar(20)
);

CREATE TABLE Family
(
 ID int PRIMARY KEY IDENTITY(1,1),
 SurName varchar(20),
 BudgetValue decimal(10, 2)
);

CREATE TABLE Basket
(
 ID int PRIMARY KEY IDENTITY(1,1),
 ID_SKU int,
 ID_Family int,
 Quantity int,
 Value int,
 PurchaseDate datetime DEFAULT GETDATE(),
 DiscountValue decimal(10, 2),
 FOREIGN KEY (ID_SKU) REFERENCES SKU (ID),
 FOREIGN KEY (ID_Family) REFERENCES Family (ID),
 CHECK ((Quantity > 0) AND (Value > 0))
);
