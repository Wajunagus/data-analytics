/*
Inner/Outer Joins | Use cases
	Inner Joins, Full/Left/Right Outer Joins

	A Join is a way to combine multiple tables into a single output.
	When you're doing a Join, you have to do it based off a similar column, & typically you want it to be a unique field.
	So we're going to be using the EmployeeID from both tables to Join these tables together to create 1 output.

Inner Join
	Join by default, is going to say Inner.
	An Inner Join is only going to show everything that is common or overlapping between table A & table B. */
Select *
From AlexTheAnalyst..EmployeeDemographics
Inner Join AlexTheAnalyst..EmployeeSalary
	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/*
Full Outer Join
	Shows everything from table A & Table B regardless of if it has a match based on what we were joining them on,
	so even if table A has an EmployeeID, but there's no EmployeeID in table B, we're still going to show it, & vice versa. */
Select *
From AlexTheAnalyst..EmployeeDemographics
Full Outer Join AlexTheAnalyst..EmployeeSalary
	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/*
Left Outer Join
	A left Outer Join is going to take the left table, & say we want everything from the left table,
	& everything that's overlapping, but if it's only in the right table, we do not want it.
	Left table=EmployeeDemographics
	Right table=EmployeeSalary */
Select *
From AlexTheAnalyst..EmployeeDemographics
Left Outer Join AlexTheAnalyst..EmployeeSalary
	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/*
Right Outer Join */
Select *
From AlexTheAnalyst..EmployeeDemographics
Right Outer Join AlexTheAnalyst..EmployeeSalary
	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/*
Inner Join-based off the EmployeeID from EmployeeDemographics-with selected columns that you want in your output */
Select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
From AlexTheAnalyst..EmployeeDemographics
Inner Join AlexTheAnalyst..EmployeeSalary
	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/*
Inner Join-based off the EmployeeID from EmployeeSalary */
Select EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
From AlexTheAnalyst..EmployeeDemographics
Inner Join AlexTheAnalyst..EmployeeSalary
	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
/*
Gives us the same output, coz we're using an Inner Join, & an Inner Join is only going to show us everything that overlaps between both tables. */

/*
Right Outer Join-using EmployeeID from EmployeeSalary */
Select EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
From AlexTheAnalyst..EmployeeDemographics
Right Outer Join AlexTheAnalyst..EmployeeSalary
	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
/*
We get all the information from our EmployeeSalary table, & it does not have to be in our left table which is our EmployeeDemographics table. */

/*
Right Outer Join-using EmployeeID from EmployeeDemographics */
Select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
From AlexTheAnalyst..EmployeeDemographics
Right Outer Join AlexTheAnalyst..EmployeeSalary
	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/*
Left Outer Join-using EmployeeID from EmployeeDemographics */
Select EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
From AlexTheAnalyst..EmployeeDemographics
Left Outer Join AlexTheAnalyst..EmployeeSalary
	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
/*
It's basically going to do the opposite of (Right Outer Join-using EmployeeID from EmployeeDemographics) above.
Now we're looking @ everything from our left table regardless of if it's in our right table.
Left table=EmployeeDemographics */

/*
Left Outer Join-using EmployeeID from EmployeeSalary */
Select EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
From AlexTheAnalyst..EmployeeDemographics
Left Outer Join AlexTheAnalyst..EmployeeSalary
	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/*
Use case I
	Let's say Robert California is pressuring Michael Scott to meet his quarterly quota, & Michael Scott is almost there, he needs like a thousand more dollars,
	& he comes up with a genius idea to deduct pay from the highest paid employee @ his branch besides himself.
	So how does he go about doing this, & identifying the person that makes the most money. */
Select EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
From AlexTheAnalyst..EmployeeDemographics
Inner Join AlexTheAnalyst..EmployeeSalary
	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Where FirstName <> 'Michael'
Order By Salary Desc

/*
Use case II
	Kevin Malone who is an accountant, thinks that he may have made a mistake when looking @ the average salary for our Salesman.
	Now, Angela Martin is very good @ SQL, & so what she is going to do is, she wants to go in & calculate the average salary for our Salesman.
	So let's try to get that information. */
Select JobTitle, AVG(Salary)
From AlexTheAnalyst..EmployeeDemographics
Inner Join AlexTheAnalyst..EmployeeSalary
	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Where JobTitle = 'Salesman'
Group By JobTitle