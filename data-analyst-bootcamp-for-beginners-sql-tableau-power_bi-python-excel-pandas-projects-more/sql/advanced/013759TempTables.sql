Select *
From #Temp_Employee_II

Select AvgAge * AvgSalary
From #Temp_Employee_II

/*
Temp Tables

	We create them very much the same way we're going to do Create Table, it's just a little bit different &
	you can hit off of this Temp Table multiple times which you cannot do with something like a CTE or a Subquery where you can only use it 1 time or
	with a Subquery you need to write it multiple times within a Query & so these Temp Tables are extremely useful. */

Use AlexTheAnalyst

Drop Table If Exists #temp_Employee
Create Table #temp_Employee (
EmployeeID int,
JobTitle varchar(100),
Salary int
)

/*
Most of the time I'm not inserting values, I am taking a large table & taking a subset of that & then sticking it into a Temp Table. */
Insert Into #temp_Employee
Select *
From EmployeeSalary
/*
This is 1 of the big uses of a Temp Table.
Let's say for example that this EmployeeSalary table had an extremely large number of rows &
we were trying to hit a somewhat complex query off of it where we're using Joins & maybe some Window functions, it would take a very long time to hit off of this.
We can hit off the Temp Table & it already has that subsection of data that we're wanting to use for all our later queries */

DROP TABLE IF EXISTS #Temp_Employee_II	-- Tip - When you're running a stored procedure multiple times, every time that you run it, it's encounters this & so if that already exists, it is going to delete that table & then allow you to create it again. This Temp Table lives somewhere, it doesn't live in the actual database.
Create table #Temp_Employee_II (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)

Insert Into #Temp_Employee_II
Select JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
From EmployeeDemographics Emp
Join EmployeeSalary Sal
	On Emp.EmployeeID = Sal.EmployeeID
Group By JobTitle
/*
Whenever we want to run the query above,
we don't have to run it on these 2 tables & create the Join & then do the calculations which takes time.
What it's going to do is it's going to take these exact values & place this into the Temp Table &
if we want to run further calculations on these values, we can easily do that in a fraction of the time,
instead of having to run this every single time which will take up so much processing power &
it will reduce your runtime dramatically when you're placing this data in this Temp Table & hitting off of that.
A lot of times these Temp Tables are used in stored procedures. */