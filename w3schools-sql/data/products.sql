/*
DROP TABLE IF EXISTS W3Schools..Products; -- Drop the table if it exists to avoid conflicts
CREATE TABLE W3Schools..Products (
    ProductID int IDENTITY(1,1) PRIMARY KEY, -- The MS SQL Server uses the IDENTITY keyword to perform an auto-increment feature.
    ProductName NVARCHAR(255), -- Product names with varying lengths
    SupplierID INT,           -- Supplier ID as an integer
    CategoryID INT,           -- Category ID as an integer
    Unit NVARCHAR(255),       -- Unit description with varying lengths
    Price DECIMAL(10, 2)      -- Price with up to 10 digits and 2 decimal places
);
*/

-------------------------------------------------------------------------------------------

--Insert Into W3Schools..Products Values
