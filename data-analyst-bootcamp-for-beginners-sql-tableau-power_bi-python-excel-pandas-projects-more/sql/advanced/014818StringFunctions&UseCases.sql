/*
String Functions
	TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

Dataset - https://github.com/AlexTheAnalyst/SQL-Code/blob/master/String%20Functions

We're going to create a new table, insert a little bit of bad data into it & then we're going to be using that to work on our string functions. */

/*
TRIM, LTRIM, RTRIM
	Let's look @ the EmployeeID coz that's the one where we have some blank spaces on the right & the left side. */
Select EmployeeID, TRIM(EmployeeID) As IDTRIM -- 'TRIM' gets rid of blank spaces on the left & right side, so on both sides
From AlexTheAnalyst..EmployeeErrors

Select EmployeeID, LTRIM(EmployeeID) As IDTRIM
From AlexTheAnalyst..EmployeeErrors

Select EmployeeID, RTRIM(EmployeeID) As IDTRIM
From AlexTheAnalyst..EmployeeErrors

/*
Replace
	For this one we're going to be looking @ the LastName. */
Select LastName, REPLACE(LastName, '- Fired','') As LastNameFixed
From AlexTheAnalyst..EmployeeErrors

/*
Substring
	Fuzzy matching */
Select SUBSTRING(FirstName,1,3)
From AlexTheAnalyst..EmployeeErrors

Select SUBSTRING(FirstName,3,3)
From AlexTheAnalyst..EmployeeErrors

Select Err.FirstName, Demo.FirstName
From AlexTheAnalyst..EmployeeErrors Err
Join AlexTheAnalyst..EmployeeDemographics Demo
	On Err.FirstName = Demo.FirstName
/*
So, the only one that is going to work is 'Toby' and that's coz even though it has a Capital 'O' it's still going to take it.
So, you know we want to get all of them to match & we can do that but it's going to be in a little bit of a different way than maybe is perfect but
that's why they call it fuzzy matching. */
Select Substring(Err.FirstName,1,3), Substring(Demo.FirstName,1,3)
From AlexTheAnalyst..EmployeeErrors Err
Join AlexTheAnalyst..EmployeeDemographics Demo
	On SubString(Err.FirstName,1,3) = Substring(Demo.FirstName,1,3)
/*
As you can see, it is now going to match all of them, & you can do this on a lot of different things.
Typically when I'm doing a fuzzy match like this, I'm not just going to do it on a FirstName only coz there can be a tonne of people named Jim or Alex,
you're going to do this on many different things, so if I'm trying to do a fuzzy match an a person, I do it on their:
	- Gender - to make sure that their Gender is the same
	- LastName - so I need to use the Substring again
	- Age
	- DOB
With these, then you can typically get a very high accuracy in matching people across tables whether or not you have like an EmployeeID,
taking for example we were not given that. */
Select Err.FirstName, Substring(Err.FirstName,1,3), Demo.FirstName, Substring(Demo.FirstName,1,3)
From AlexTheAnalyst..EmployeeErrors Err
Join AlexTheAnalyst..EmployeeDemographics Demo
	On SubString(Err.FirstName,1,3) = Substring(Demo.FirstName,1,3)

/*
Upper & Lower */
Select FirstName, LOWER(FirstName)
From AlexTheAnalyst..EmployeeErrors

Select FirstName, Upper(FirstName)
From AlexTheAnalyst..EmployeeErrors