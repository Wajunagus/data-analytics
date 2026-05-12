/*
CTE (Common Table Expression)

It's a named temporary result set which is used to manipulate the complex subqueries data.
Now this only exists within the scope of the statement that we're about to write.
Once we cancel out this query, it's like it never existed.
A CTE is also only created in memory rather than a tempdb file like a temp table would be,
but in general a CTE acts very much like a subquery.

CTE are sometimes called with queries, I've never personally used that but I've seen it called that online,
but that's coz it uses this with statement right @ the very beginning */

Use AlexTheAnalyst

With CTE_Employee As (
Select FirstName, LastName, Gender, Salary,
	COUNT(Gender) Over (Partition By Gender) As TotalGender,
	Avg(Salary) Over (Partition By Gender) As AvgSalary
From EmployeeDemographics Demo
Join EmployeeSalary Sal
	On Demo.EmployeeID = Sal.EmployeeID
Where Salary > '45000'
)	--As you can see, it is basically just a Select statement within the 'With CTE_Employee As'. And what this is going to do is to take the FirstName, LastName, Gender & Salary & then it's going to take the aggregate function with the Partition By & the next aggregate function with the Partition By & it's going to place it to where we can now query off of this data. So it's putting it basically in a temporary place where we can then go & grab that data.
Select *
From CTE_Employee
/*
So this feels a lot like we're actually quering off of a temp table but it actually acts a lot more like a subquery.
Now we don't have to Select everything.

All the heavy lifting is done within the CTE & then we can just query off of what we want.
Note:
	1. The CTE is not stored anywhere & so it's not stored in some temp database somewhere.
	2. You actually have to put the Select statement directly after the CTE.
I just wanted to demonstrate that you can use aggregate functions within your CTE,
& then query off of those without having to do the aggregate function again which I find is very useful. */