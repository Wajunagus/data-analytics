Use AlexTheAnalyst

Select EmployeeID, JobTitle, Salary
From EmployeeSalary

/*
Subqueries
	in the Select, From, & Where statements

	Subqueries are often called inner queries or nestic queries & they're basically a query within a query.
	A subquery is used to return data that will be used in the main query or the outer query as a condition to specify the data that we want retrieved.
	You can use subqueries almost anywhere. You can use it in the Select part of a query, the From, the Where, you can also use it in Insert, Update & Delete statements.

	https://github.com/AlexTheAnalyst/SQL-Code/blob/master/Subquery%20Tutorial.sql

Subquery in Select
	What we're going to try to do is kind of do something like a Windows function but without actually having to do the Windows function &
	so we're going to do this with a subquery. */
Select EmployeeID, Salary, (Select AVG(Salary) From EmployeeSalary) as AllAvgSalary
From EmployeeSalary

/*
How to do it with Partition By.
Just a different way of doing it, just to show a comparison of how you might be able to use a subquery in the select statement. */
Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
From EmployeeSalary

/*
Why Group By doesn't work */
Select EmployeeID, Salary, AVG(Salary) as AllAvgSalary
From EmployeeSalary
Group By EmployeeID, Salary
order by 1,2
/*
As you can see, since we have to use the Group By, it Groups By both the ordered EmployeeID & the Salary &
so we're not going to be able to get that AllAvgSalary that we're looking for that we can get in the Partition By &
also the subquery in the Select statement.

Subquery in From
	So, if you have watched previous videos where I've done tutorials on the CTE or on the temp tables,
	this is one that is very much like those except I think a little bit less efficient.
	When I'm doing something where I'm creating a table & then quering off of it which is what we're about to do, I much prefer a CTE or a temp table.
	Subqueries tend to be a little bit slow compared to a temp table or a CTE.
	I tend to use temp tables a lot more coz you can reuse them over & over whereas a subquery you cannot, you have to write it out each time.
	I don't really recommend using this method, but as an example I just wanted to show you how it works. */
Select a.EmployeeID, AllAvgSalary
From (Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
	 From EmployeeSalary) a
Order by a.EmployeeID

/*
Subquery in Where
	So for this example, we only want to return employees if they're over the age of 30 & as you can see in the EmployeeSalary table there is no Age column,
	that is in the EmployeeDemographics table.
	Now, if we wanted we could join to that table & get that information or we could use a subquery & so for this example we are going to be using a subquery. */
Select EmployeeID, JobTitle, Salary
From EmployeeSalary
where EmployeeID in (
	Select EmployeeID -- In your subquery you can only have 1 column selected, so I can't select everything, I have to specify 1 column & that's a little bit different than how we did it in the From statement where we were basically able to select the entire table & then in the Select statement specify what columns we wanted. In the Where statement we can't do that.
	From EmployeeDemographics
	where Age > 30) -- Now, if you wanted to display the Age as a column in this output, you would have to Join to that table & then put that column or that field in the Select statement, but in a lot of situations you won't actually want or need to do that & so a subquery can be a really good option in these scenarios.