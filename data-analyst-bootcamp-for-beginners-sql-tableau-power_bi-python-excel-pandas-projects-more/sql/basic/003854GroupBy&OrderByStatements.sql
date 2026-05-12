/* Group By, Order By
The Group By statement is similar to Distinct in the Select statement in that it's going to show the unique values in a column,
but with the difference below. */
Select Distinct (Gender)
From MuyaTheAnalyst..EmployeeDemographics

/* To return the very 1st unique value of female, & the very first unique value of male. */
Select Gender
From MuyaTheAnalyst..EmployeeDemographics
Group By Gender

Select Gender, COUNT(Gender) As [#OfEmployees] -- As [#OfEmployees] = @Wajunagus
From MuyaTheAnalyst..EmployeeDemographics
Group By Gender

/* The COUNT(Gender) is a derived field, or a derived column. It's derived based off the Gender column,
so it's technically not a real column that's in the table. */
Select Gender, Age, COUNT(Gender)
From MuyaTheAnalyst..EmployeeDemographics
Group By Gender, Age


Select Gender, COUNT(Gender)
From MuyaTheAnalyst..EmployeeDemographics
Where Age > 31
Group By Gender

Select Gender, COUNT(Gender) As CountGender
From MuyaTheAnalyst..EmployeeDemographics
Where Age > 31
Group By Gender
Order By CountGender -- As a default, SQL has an ascending feature which is going to be smallest to largest going down.

Select Gender, COUNT(Gender) As CountGender
From MuyaTheAnalyst..EmployeeDemographics
Where Age > 31
Group By Gender
Order By CountGender Desc -- Largest to smallest.

Select *
From MuyaTheAnalyst..EmployeeDemographics
Order By Age

Select *
From MuyaTheAnalyst..EmployeeDemographics
Order By Age Desc

Select *
From MuyaTheAnalyst..EmployeeDemographics
Order By Age, Gender

Select *
From MuyaTheAnalyst..EmployeeDemographics
Order By Age, Gender Desc

Select *
From MuyaTheAnalyst..EmployeeDemographics
Order By Age Desc, Gender Desc

Select *
From MuyaTheAnalyst..EmployeeDemographics
Order By 4 Desc, 5 Desc

/* Practice the basics, coz they are what you're going to be using day in day out.
From tables, try to think of use cases & what you would want to know from that information. */
