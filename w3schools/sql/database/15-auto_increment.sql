/*
The following SQL statement defines the "Personid" column to be an auto-increment primary key field in the "Persons" table: */
CREATE TABLE W3Schools..Persons (
    Personid int IDENTITY(1,1) PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);

/*
The MS SQL Server uses the IDENTITY keyword to perform an auto-increment feature.
In the example above, the starting value for IDENTITY is 1, and it will increment by 1 for each new record.
Tip: To specify that the "Personid" column should start at value 10 and increment by 5, change it to IDENTITY(10,5). */