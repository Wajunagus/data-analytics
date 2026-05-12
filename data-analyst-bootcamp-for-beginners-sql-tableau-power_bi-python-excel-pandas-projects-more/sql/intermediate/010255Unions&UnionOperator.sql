/*
Unions | Union operator
	Union, Union All

	Dataset: SQL-Code/SQL Unions
		https://github.com/AlexTheAnalyst/SQL-Code/blob/master/SQL%20Unions%20Tutorial

	Unions & Joins are somewhat similar or closely related. And that's coz in both instances they're combining 2 tables to create 1 output.
	Now what's the difference?.
	The difference is that a Join combines both tables based off a common column & in the last video that was the EmployeeID.
	So in both tables we had an EmployeeID & when you're selecting your data, you have to choose either to only select 1 EmployeeID or 
	you can choose both EmployeeIDs but they're in separate columns,
	and with a Union you're actually able to select all the data from both tables & put it into 1 output where all the data is in each column &
	not separate it out & you dont have to choose which table you're choosing it from. */

Select *
From AlexTheAnalyst..EmployeeDemographics
Full Outer Join AlexTheAnalyst..WareHouseEmployeeDemographics
	On EmployeeDemographics.EmployeeID=WareHouseEmployeeDemographics.EmployeeID
/*
	Right now I'm doing a Full Outer Join so we're looking @ all the data, & if we were to pull this into an Excel spreadsheet we could just copy & paste
	& we would be good to go & thats coz we have all the same columns, FirstName, LastName, Age, Gender | FirstName, LastName, Age, Gender.
	But if we try to combine this in a query it wouldn't work, we cannot get it in the same column & that's where a Union comes into play.
	They have the exact same columns & that makes it super easy for what we're about to do. */

Select *
From AlexTheAnalyst..EmployeeDemographics
Union
Select *
From AlexTheAnalyst..WareHouseEmployeeDemographics
/*
	Now coz of the union, the information that used to be in the other table which were in separate columns, are now added down below in the exact same order.
	Now Darryl Philbin was actually in both tables, & the reason he isn't showing up multiple times is coz this Union is actually taking out &
	removing the duplicates, kind of like a Distinct statement. */

/*
Union All
	It is going to show us all of the information regardless if it is a duplicate or not */
Select *
From AlexTheAnalyst..EmployeeDemographics
Union All
Select *
From AlexTheAnalyst..WareHouseEmployeeDemographics
Order By EmployeeID