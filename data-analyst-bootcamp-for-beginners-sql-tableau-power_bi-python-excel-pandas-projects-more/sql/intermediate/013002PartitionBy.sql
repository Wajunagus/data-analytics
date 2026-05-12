/*
Partition By

	Partition By is often compared to the Group By statement.
	The Group By statement is a little bit different.
	The Group By statement is going to reduce the # of rows in our output by actually rolling them up & then calculating the Sums or Averages for each group whereas
	Partition By actually divides the result set into partitions & changes how the window function is calculated & so the Partition By doesn't actually reduce the # of rows returned in our output.
	Let's look @ the syntax of how to use Partition By & then we'll compare it to the Group By statement later, just to see the differences between the 2. */

Select FirstName, LastName, Gender, Salary,
	Count(Gender) Over (Partition By Gender) As TotalGender, --We want to identify how many male & female employees we have. We want to see the output first & then we come back to why we wrote it this way.
	Avg(Salary) Over (Partition By Gender) As AvgSalary	-- As AvgSalary = @Wajunagus
From AlexTheAnalyst..EmployeeDemographics Dem
Join AlexTheAnalyst..EmployeeSalary Sal
	On Dem.EmployeeID = Sal.EmployeeID
/*
Coz we're using the Partition By, we're able to isolate just 1 column that we want to perform our aggregate function on,
& so we're able to add things like the FirstName & LastName columns even though we aren't trying to include that in any Partition or Group By statement,
yet we're still able to add the aggregate function to each individual row while still maintaining those other columns.

Let's take the entire query above & transform it into a Group By statement, & we'll see what that looks like & what the difference is. */
Select FirstName, LastName, Gender, Salary, Count(Gender) As TotalGender -- As As TotalGender = @Wajunagus
From AlexTheAnalyst..EmployeeDemographics Dem
Join AlexTheAnalyst..EmployeeSalary Sal
	On Dem.EmployeeID = Sal.EmployeeID
Group By FirstName, LastName, Gender, Salary -- We have to use all these columns in our Group By statement.
/*
As you can tell we are not able to see the output for the aggregate function.

If we want to get the same output that we had before where we're showing 3 for females & 6 for males */
Select Gender, Count(Gender) As TotalGender -- As TotalGender = @Wajunagus
From AlexTheAnalyst..EmployeeDemographics Dem
Join AlexTheAnalyst..EmployeeSalary Sal
	On Dem.EmployeeID = Sal.EmployeeID
Group By Gender
/*
What the Partition By is doing is basically taking this query & sticking it on 1 line in the Select statement
& so I hope now you can see how valuable the Partition By can be if used correctly. */