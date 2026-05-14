Select Top 1
	Date,
	Volume As [Volume (Market activity)]
From TV..CCC_D1
Order By Volume Desc

Select COUNT(*)
From TV..CCC_D1

--------------------------------------------------------------------------------------

-- Data

-- CCC_D1
--Insert Into TV..CCC_D1 Values
Day,Date,OpenPrice,High,Low,ClosePrice,Volume
Tue,2026-03-24,303.34,314.80,303.34,314.18,15.57
Wed,2026-03-25,312.58,314.75,307.24,312.06,14.54
Thu,2026-03-26,310.23,312.84,303.14,303.72,12.81
Fri,2026-03-27,303.39,305.01,297.56,297.59,10.88
Mon,2026-03-30,296.16,296.74,287.80,290.20,12.59
Tue,2026-03-31,289.29,293.55,288.46,292.88,12.22

Mon,2026-04-20,285.27,288.90,284.87,287.13,9.68
Tue,2026-04-21,286.75,287.82,277.96,287.82,12.32
Wed,2026-04-22,288.70,290.55,286.50,288.39,10.14
Thu,2026-04-23,288.64,301.54,288.49,299.95,10.29
Fri,2026-04-24,300.77,305.18,293.23,294.42,14.36
Mon,2026-04-27,289.82,293.50,285.84,287.07,11.84
Tue,2026-04-28,287.89,292.94,287.44,290.42,10.47
Wed,2026-04-29,289.63,291.63,286.49,289.10,11.04
Thu,2026-04-30,287.86,289.53,282.28,283.72,11.92
Fri,2026-05-01,283.68,288.49,279.33,288.12,11.12
Mon,2026-05-04,286.34,288.49,282.60,284.26,10.50
Tue,2026-05-05,284.27,294.32,284.10,286.58,14.39
Wed,2026-05-06,286.68,290.47,280.85,281.53,14.04

-- CCC_W1
--Insert Into TV..CCC_W1 Values

-- CCC_MN
--Insert Into TV..CCC_MN Values

--------------------------------------------------------------------------------------

-- CCC_D1
Select
	Date,
	OpenPrice,
	High,
	Low,
	ClosePrice,
	Volume As [Volume(Market activity)],
 	(ClosePrice-OpenPrice)/0.0001 As [ClosePrice-OpenPrice],
	(High-Low)/0.0001 As [High-Low],
	Format(((ClosePrice-OpenPrice)/OpenPrice)*100,'N2')+'%' As [% Move]
From TV..CCC_D1
/*Where Date = '2025-04-14'*/
/*Where Date = '2025-01-02' Or Date = '2025-03-31'*/
Where Date Between '2025-04-25' And '2025-05-02'
/*Where (High-Low)/0.0001 > 100*/
/*Where (ClosePrice-OpenPrice)/0.0001 > 100*/
/*Where Volume > 200000*/
Order By Date

--------------------------------------------------------------------------------------

-- CCC_W1
Select
	WeekStarting,
	OpenPrice,
	High,
	Low,
	ClosePrice,
	Volume As [Volume(Market activity)],
	(ClosePrice-OpenPrice)/0.0001 As [CP-OP],
	(High-Low)/0.0001 As [H-L],
	Format(((ClosePrice-OpenPrice)/OpenPrice)*100,'N2')+'%' As [% Move (CP-OP)/OP*100]
From TV..CCC_W1
/*Where WeekStarting = '2025-04-20'*/
/*Where WeekStarting Between
	'2025-03-30' And
	'2025-04-20'*/
Order By WeekStarting

--------------------------------------------------------------------------------------

-- CCC_MN
Select
	MonthStarting,
	OpenPrice,
	High,
	Low,
	ClosePrice,
	Volume As [Volume(Market activity)],
	(ClosePrice-OpenPrice)/0.0001 As [ClosePrice-OpenPrice],
	(High-Low)/0.0001 As [Volatility(High-Low)],
	Format(((ClosePrice-OpenPrice)/OpenPrice)*100,'N2')+'%' As [% Move]
From TV..CCC_MN
Order By MonthStarting

--------------------------------------------------------------------------------------

-- TV

-- CCC_D1
/*
DROP TABLE IF EXISTS TV..CCC_D1
Create Table TV..CCC_D1 (
	Date DATE,
	OpenPrice DECIMAL(10,5),
	High DECIMAL(10,5),
	Low DECIMAL(10,5),
	ClosePrice DECIMAL(10,5),
	Volume INT
)

-- CCC_W1
DROP TABLE IF EXISTS TV..CCC_W1
CREATE TABLE TV..CCC_W1 (
    WeekStarting DATE,         -- Date of the week starting
    OpenPrice DECIMAL(10,5),   -- Opening price
    High DECIMAL(10,5),		   -- Highest price
    Low DECIMAL(10,5),		   -- Lowest price
    ClosePrice DECIMAL(10,5),  -- Closing price
    Volume BIGINT              -- Volume of trades
);

-- CCC_MN
DROP TABLE IF EXISTS TV..CCC_MN
CREATE TABLE TV..CCC_MN (
    MonthStarting DATE,
    OpenPrice DECIMAL(10,5),
    High DECIMAL(10,5),
    Low DECIMAL(10,5),
    ClosePrice DECIMAL(10,5),
    Volume BIGINT
);
*/
