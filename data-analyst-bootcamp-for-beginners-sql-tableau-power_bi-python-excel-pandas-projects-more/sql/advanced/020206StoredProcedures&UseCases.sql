/*
Stored Procedures + Use Cases

What is a stored procedure?
	A stored procedure is a group of SQL statements that has been created & then stored in that database.
	A stored procedure can accept input parameters, that means that a single stored procedure can be used over the network by several different users &
	we can all be using different input data.
	A stored procedure will also reduce Network traffic & increase the performance &
	lastly if we modify that stored procedure, everyone who uses that stored procedure in the future will also get that update.

Dataset: https://github.com/AlexTheAnalyst/SQL-Code/blob/master/Stored%20Procedures.sql */

Use AlexTheAnalyst

/*
Simple */
Create Procedure Test
As
Select *
From AlexTheAnalyst..EmployeeDemographics

Exec Test

/*
Complex */
CREATE PROCEDURE Temp_Employee
AS
DROP TABLE IF EXISTS #temp_employee
Create table #temp_employee (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)

Insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

Select * 
From #temp_employee

Exec Temp_Employee