/*
Having clause

Let's look @ the Count of job titles & Group By job title */
Select JobTitle, COUNT(JobTitle) As [#OfEmployees] -- As [#OfEmployees] = @Wajunagus
From AlexTheAnalyst..[EmployeeDemographics]
Join AlexTheAnalyst..[EmployeeSalary]
	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Group By JobTitle

/*
Example I
	Now lets say we want to look @ all the jobs that have more than 1 employee in that specific job. */
Select JobTitle, COUNT(JobTitle) As [#OfEmployees] -- As [#OfEmployees] = Wajunagus
From AlexTheAnalyst..EmployeeDemographics
Join AlexTheAnalyst..EmployeeSalary
	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Group By JobTitle
Having COUNT(JobTitle) > 1
/*
The Having statement is completely dependent on the Group By statement coz we're performing this after it has been aggregated.

Example II */
Select JobTitle, AVG(Salary) As AvgSalary	-- As AvgSalary = @Wajunagus
From AlexTheAnalyst..EmployeeDemographics
Join AlexTheAnalyst..EmployeeSalary
	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Group By JobTitle
Having AVG(Salary) > 45000
Order By AVG(Salary)

/*
The Having clause, definitely one that is good to know & is very useful in specific situations. */