/*                                                                                                             Thu, Sep 18, '25
Select + From statements
Top, Distinct, Count, As, Max, Min, Avg
-------------------------------------------------------------------------------------------------------------------------------
Choosing what database & what table to hit off of
*/
Select *
From MuyaTheAnalyst..EmployeeDemographics

Select FirstName, LastName
From MuyaTheAnalyst..EmployeeDemographics

Select Top 5 *
From MuyaTheAnalyst..EmployeeDemographics

Select *
From MuyaTheAnalyst.dbo.EmployeeSalary

/*-----------------------------------------------------------------------------------------------------------------------------
Distinct
When we use distinct, we're actually saying that we want the unique values in a specific column.
Everything should be returned, so all 9 rows should be returned, & thats coz every single 1 of these are unique.
*/
Select Distinct(EmployeeID)
From MuyaTheAnalyst..EmployeeDemographics

Select Distinct(Gender)
From MuyaTheAnalyst..EmployeeDemographics
-- So, there's only going to be 2 results, the male & the female. And that's coz there's only 2 distinct values in that column.

/*-----------------------------------------------------------------------------------------------------------------------------
Count
Count is going to show us all the Non Null values in a column.
All that it's going to give us is a count of 9, coz we have 9 last names.
If for whatever reason somebody's last name was left out, & that was null,
then it would have returned maybe 8 or 7 depending on how many were actually in there.
If an entire column was null, it would be returned 0.
*/
Select Count(LastName)
From MuyaTheAnalyst..EmployeeDemographics

/*-----------------------------------------------------------------------------------------------------------------------------
As
*/
Select COUNT(LastName) As LastNameCount -- Giving it a column name
From MuyaTheAnalyst..EmployeeDemographics

/*-----------------------------------------------------------------------------------------------------------------------------
Max, Min, & Avg

@ our salary table we have salaries that would be useful for this information.
*/
Select MAX(Salary)
From MuyaTheAnalyst..EmployeeSalary

Select MIN(Salary)
From MuyaTheAnalyst..EmployeeSalary

Select AVG(Salary)
From MuyaTheAnalyst..EmployeeSalary

-- They're extremely useful & are definitely among the basics that you have to know.
