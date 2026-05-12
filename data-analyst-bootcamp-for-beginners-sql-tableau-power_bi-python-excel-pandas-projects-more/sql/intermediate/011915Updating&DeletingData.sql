Select *
From AlexTheAnalyst..EmployeeDemographics

/*
Updating/Deleting Data

	Now what's the difference between inserting data into a table & updating data.
	Insert Into is going to create a new row in your table, while updating is going to alter a pre-existing row.
	Deleting is going to specify what rows you want to remove from your table.

Update

	Holly Flax does not have an EmployeeID, Age or Gender. Now we want to update this table to give her that information. */
Update AlexTheAnalyst..EmployeeDemographics
Set EmployeeID = 1012 --Set is going to specify what column & what value you actually want to insert into that cell.
Where FirstName = 'Holly' And LastName = 'Flax'

Update AlexTheAnalyst..EmployeeDemographics
Set Age = 31, Gender = 'Female'
Where FirstName = 'Holly' And LastName = 'Flax'

/*
Delete

	Delete statement is going to remove an entire row from our table */
Delete From AlexTheAnalyst..EmployeeDemographics
Where EmployeeID = 1005

/*
Now you have to be very careful when you use the delete statement, coz once you run it you cannot get that data back.
There is no way to reverse a delete statement.
If you had gotten rid of the Where statement & ran the query, it would delete everything from the entire table & you cannot get that data back.

Little trick */
Select *
From AlexTheAnalyst..EmployeeDemographics
Where EmployeeID = 1004
/*
And now, if you run this you are going to see exactly what you will be deleting.
So using the Select statement can be a very good safeguard against accidentally deleting data that you do not want to delete. */