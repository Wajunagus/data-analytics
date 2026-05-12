Select Top 1
	Date,
	Volume As [Volume (Market activity)]
From TV..EURUSD_D1
Order By Volume Desc

Select COUNT(*)
From TV..EURUSD_D1

--------------------------------------------------------------------------------------

-- Data

-- EURUSD_D1
--Insert Into TV..EURUSD_D1 Values

-- EURUSD_W1
--Insert Into TV..EURUSD_W1 Values

-- EURUSD_MN
--Insert Into TV..EURUSD_MN Values

--------------------------------------------------------------------------------------

-- EURUSD_D1
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
From TV..EURUSD_D1
/*Where Date = '2025-04-14'*/
/*Where Date = '2025-01-02' Or Date = '2025-03-31'*/
Where Date Between '2025-04-25' And '2025-05-02'
/*Where (High-Low)/0.0001 > 100*/
/*Where (ClosePrice-OpenPrice)/0.0001 > 100*/
/*Where Volume > 200000*/
Order By Date

--------------------------------------------------------------------------------------

-- EURUSD_W1
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
From TV..EURUSD_W1
/*Where WeekStarting = '2025-04-20'*/
/*Where WeekStarting Between
	'2025-03-30' And
	'2025-04-20'*/
Order By WeekStarting

--------------------------------------------------------------------------------------

-- EURUSD_MN
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
From TV..EURUSD_MN
Order By MonthStarting

--------------------------------------------------------------------------------------

-- TV

-- EURUSD_D1
/*
DROP TABLE IF EXISTS TV..EURUSD_D1
Create Table TV..EURUSD_D1 (
	Date DATE,
	OpenPrice DECIMAL(10,5),
	High DECIMAL(10,5),
	Low DECIMAL(10,5),
	ClosePrice DECIMAL(10,5),
	Volume INT
)

-- EURUSD_W1
DROP TABLE IF EXISTS TV..EURUSD_W1
CREATE TABLE TV..EURUSD_W1 (
    WeekStarting DATE,         -- Date of the week starting
    OpenPrice DECIMAL(10,5),   -- Opening price
    High DECIMAL(10,5),		   -- Highest price
    Low DECIMAL(10,5),		   -- Lowest price
    ClosePrice DECIMAL(10,5),  -- Closing price
    Volume BIGINT              -- Volume of trades
);

-- EURUSD_MN
DROP TABLE IF EXISTS TV..EURUSD_MN
CREATE TABLE TV..EURUSD_MN (
    MonthStarting DATE,
    OpenPrice DECIMAL(10,5),
    High DECIMAL(10,5),
    Low DECIMAL(10,5),
    ClosePrice DECIMAL(10,5),
    Volume BIGINT
);
*/
