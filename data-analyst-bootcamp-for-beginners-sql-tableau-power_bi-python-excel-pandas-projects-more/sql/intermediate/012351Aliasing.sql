/*
Aliasing

	Aliasing is temporarily changing the column name or table name in your script & it's not really going to impact your output @ all.
	Aliasing is used for the readability of your script.
	It may not sound super useful especially for small scripts,
	but when you start getting to larger scripts where you have 6, 7 or 8 Joins & you're selecting 10 different column names it actually is very useful & very important.

Aliasing column names */
Select FirstName As Fname
From AlexTheAnalyst..EmployeeDemographics

/*
You can either use the As or you cannot use it */
Select FirstName Fname
From AlexTheAnalyst..EmployeeDemographics

/*
To combine the FirstName & LastName column into 1 single column & name it FullName. */
Select FirstName + '' + LastName As FullName
From AlexTheAnalyst.dbo.EmployeeDemographics

/*
Now another time that you're often going to use aliasing in the Select statement is when you're using aggregate functions. */
Select Avg(Age) As AvgAge
From AlexTheAnalyst..EmployeeDemographics

/*
Aliasing table names */
Select Demo.EmployeeID
From AlexTheAnalyst..EmployeeDemographics As Demo

/*
So when you alias in a table name, when you are selecting in the Select statement you actually need to preface your column name with a table name or
the table alias.EmployeeID & this is extremely important to do especially when you have a lot of Joins that you're doing or
you're selecting a lot of columns when you have several Joins coz it can get very messy quick. */
Select Demo.EmployeeID, Sal.Salary
From AlexTheAnalyst..EmployeeDemographics As Demo
Join AlexTheAnalyst..EmployeeSalary As Sal
	On Demo.EmployeeID = Sal.EmployeeID
/*
So looking @ the script now is very clean, it is very easy to understand, & that's what's so important with aliasing.
It makes it a lot more easily readable & a lot more manageable when you're looking @ it when you have a very long script. */

Select a.EmployeeID, a.FirstName, a.LastName, b.JobTitle, c.Age
From AlexTheAnalyst..EmployeeDemographics a
Left Join AlexTheAnalyst..EmployeeSalary b
	On a.EmployeeID = b.EmployeeID
Left Join AlexTheAnalyst..WareHouseEmployeeDemographics c
	On a.EmployeeID = c.EmployeeID
/*
Now unfortunately I have seen a lot of scripts that look exactly like this,	& this is what you do not want to do.
You do not want to use your aliasing to just write an a, b, or c, that is very frowned upon when writing queries coz
it really doesn't give any context to what the table that you're referencing is & it gets really confusing as this query continues to grow &
as you add more columns to your Select statement, it makes it more difficult to understand where those columns are coming from. */

Select Demo.EmployeeID, Demo.FirstName, Demo.LastName, Sal.JobTitle, Ware.Age
From AlexTheAnalyst..EmployeeDemographics Demo
Left Join AlexTheAnalyst..EmployeeSalary Sal
	On Demo.EmployeeID = Sal.EmployeeID
Left Join AlexTheAnalyst..WareHouseEmployeeDemographics Ware
	On Demo.EmployeeID = Ware.EmployeeID
/*
When you hand this query off to somebody, it is going to be a lot easier for them to read through it &
understand where those columns & table names are coming from & so they will appreciate that in the long run.
It is important to understand aliasing especially as you start working in teams &
as you start creating more & more complex queries, you want to have it more organized & more easily readable &
so it may not come into play with those really simple queries, but as you build out those more complex queries this becomes very useful. */