Use master

Drop database PortfolioProject

/*--------------------------------------------------------------------------------------------------------------------------------------------------------
02:16:57 Data Analyst Portfolio Project | SQL Data Exploration

Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types

First thing is that there are going to be 4 projects.
	1. SQL - we doing a lot of data exploration & we'll be setting up a lot of our data to visualize it in Tableau
	2. Tableau
	3. SQL - we're going back to SQL but we're going to be doing a lot more of the ETL process, so a lot more of the data cleaning.
		I did that one as the 3rd project coz I think it's going to be a little more advanced than the 1st project.
		I tried to make it as beginner friendly as possible.
	4. Python - we'll be using a lot of Pandas, doing a little bit of data cleaning & then doing visualizations as well

The whole point of the series is that, if you are trying to apply for a data analyst job,
by the end of the series you should have an entire portfolio or @ least a really good start @ a portfolio to show a potential employer.
I give you full permission to copy every script, every query line for line if that is what you want to do & create your own portfolio,
but I encourage you to try to think of your own queries,
try to think of your own insights & your own things that you can do to make this portfolio project unique.

Our World in Data - Coronavirus (COVID-19) Deaths: https://ourworldindata.org/covid-deaths
	
COVID Portfolio Project - Data Exploration.sql: https://github.com/AlexTheAnalyst/PortfolioProjects/tree/main

There's going to be a good size amount of data, we're about to do a lot of different things.
We're going to start @ the very basics of just like querying the table, & then we're going to go into things like joins,
CTEs, temp tables, creating views.
The whole purpose of what we're about to do is not to keep it too simple,
I want to showcase to a potential employer that you can do more advanced things.

We've probably got like 15 to 20 queries here.

Think about it in terms of how we're going to visualize this in the future, coz a lot of what we're doing,
we're going to visualize in the future in Tableau.

--------------------------------------------------------------------------------------------------------------------------------------------------------*/

Select *
From PortfolioProject..CovidDeaths
Where continent is not null
Order By 3,4

Select Count(*)
From PortfolioProject..CovidDeaths

/*
2:32:36 / 19:23:45
Select Data that we are going to be starting with */
Select location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject..CovidDeaths
Where location = 'Kenya'
And continent is not null
Order By 1,2

/*
Total Cases vs Total Deaths
Shows likelihood of dying if you contract covid in your country */
Select location, date, total_cases, total_deaths, (total_deaths / total_cases) * 100 As DeathPercentage
From PortfolioProject..CovidDeaths
Where location = 'Kenya'
And continent Is Not Null
Order By 1,2
/* Msg 8134, Level 16, State 1, Line 53
Divide by zero error encountered. */

Select
	location,
	date,
	total_cases,
	total_deaths,
	Case
		When total_cases = 0 Then 0
		Else (total_deaths / total_cases) * 100
	End As DeathPercentage
From
	PortfolioProject..CovidDeaths
Where
	location = 'Kenya'
	And continent Is Not Null
Order By
	location, date

/*
Total Cases vs Population
Shows what percentage of population infected with Covid */
Select location, date, population, total_cases,  (total_cases / population) * 100 As PercentPopulationInfected
From PortfolioProject..CovidDeaths
Where location Like 'bul%'
And continent Is Not Null
order by 1,2

/*
Countries with Highest Infection Rate compared to Population */
Select location, population, MAX(total_cases) As HighestInfectionCount,  Max((total_cases / population)) * 100 As PercentPopulationInfected
From PortfolioProject..CovidDeaths
Where continent Is Not Null
Group By location, population
Order By PercentPopulationInfected Desc

/*
Countries with Highest Death Count per Population */
Select location, MAX(total_deaths) As TotalDeathCount
From PortfolioProject..CovidDeaths
Where continent Is Not Null
Group By location
Order By TotalDeathCount Desc

/*
BREAKING THINGS DOWN BY CONTINENT
Showing contintents with the highest death count per population */
Select continent, MAX(Cast(Total_deaths As int)) As TotalDeathCount
From PortfolioProject..CovidDeaths
--Where location Like '%states%'
Where continent Is Not Null
Group By continent
Order By TotalDeathCount Desc

/*
For the purposes of hierarchy & that drill down effect in Tableau which is something we are going to do,
we want to start including continent in our queries, so we can drill down further into these things. */
Select location, MAX(Cast(Total_deaths As int)) As TotalDeathCount
From PortfolioProject..CovidDeaths
--Where location like '%states%'
Where continent Is Null 
Group By location
Order By TotalDeathCount Desc

/*
We're going to start getting into some a little bit more advanced things, we're going to start getting into some temp tables,
coz we're going to eventually set these up in views, so that we have these views to use for Tableau later &
it shows you how to create a view. So that's important.

We want to start looking @ this from a viewpoint of I'm going to visualize this, so how do we do that.
Drill down effect; it's like clicking on North America & then when you bring up North America,
then it shows all the countries in North America. Africa & then there's all the African countries. */

/*
GLOBAL NUMBERS */
Select SUM(new_cases) As total_cases, SUM(Cast(new_deaths As int)) As total_deaths, SUM(Cast(new_deaths As int)) / SUM(New_Cases) * 100 As DeathPercentage
From PortfolioProject..CovidDeaths
where continent Is Not Null
order by 1,2