/*
Case statement | Use cases

	A case statement allows you to specify a condition & then it allows you to specify what you want returned when that condition is met. */

/*
For our Case statement we're going to be using Age column */
Select FirstName,LastName,Age,
Case
	When Age > 30 Then 'Old'
	Else 'Young'
End
From AlexTheAnalyst..EmployeeDemographics
Where Age is Not Null
Order By Age

/*
We can do as many When & Then statements as we want */
Select FirstName, LastName, Age,
Case
	When Age > 30 Then 'Old'
	When Age Between 27 And 30 Then 'Young'
	Else 'Baby'
End
From AlexTheAnalyst..EmployeeDemographics
Where Age is Not Null
Order By Age

/*
Something to note is that the very 1st condition that is met, is going to be returned.
So if there are multiple conditions that meet the criteria, only the very 1st one is going to be returned.
Demonstrated below. */
Select FirstName, LastName, Age,
Case
	When Age > 30 Then 'Old'
	When Age = 38 Then 'Stanley'
	Else 'Baby'
End
From AlexTheAnalyst..EmployeeDemographics
Where Age is Not Null
Order By Age

/*
Now works correctly */
Select FirstName, LastName, Age,
Case
	When Age = 38 Then 'Stanley' --condition is met first
	When Age > 30 Then 'Old'
	Else 'Baby'
End
From AlexTheAnalyst..EmployeeDemographics
Where Age is Not Null
Order By Age

/*
Use case
	We are going to be focusing on the JobTitle & the Salary column

Situation:
	We had a fantastic year this year selling paper & corporate has allowed Michael Scott to give out a yearly raise to every single employee,
	but not every employee is going to get the same raise coz our salesmen are genuinely the people who made us our money &
	they're going to get the biggest raises.
	Well, other pax really aren't going to get that big of a raise.
	So now let's go through & create a Case statement to calculate what their salary will be after they get their raise. */
Select FirstName, LastName, JobTitle, Salary,
Case
	When JobTitle = 'Salesman' Then Salary + (Salary * .10) -- 10%
	When JobTitle = 'Accountant' Then Salary + (Salary * .05) -- 5%
	When JobTitle = 'HR' Then Salary + (Salary * .000001)
	Else Salary + (Salary * .03) -- 3%
End As SalaryAfterRaise
From AlexTheAnalyst..EmployeeDemographics
Join AlexTheAnalyst..EmployeeSalary
	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Order By JobTitle --@Wajunagus

/*
I find myself using the case system a lot when I'm wanting to categorize or label things, & you can even do calculations. */