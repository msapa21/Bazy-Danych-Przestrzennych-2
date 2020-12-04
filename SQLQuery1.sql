SELECT EmployeeKey, FirstName, LastName, Title INTO dbo.stg_dimemp FROM AdventureWorksDW2019.dbo.DimEmployee WHERE EmployeeKey>=270 AND EmployeeKey<=275;

DROP TABLE IF EXISTS AdventureWorksDW2019.dbo.stg_dimemp
SELECT EmployeeKey, FirstName, LastName, Title INTO AdventureWorksDW2019.dbo.stg_dimemp FROM AdventureWorksDW2019.dbo.DimEmployee WHERE EmployeeKey>=270 AND EmployeeKey<=275;
SELECT * FROM AdventureWorksDW2019.dbo.stg_dimemp;

DROP TABLE IF EXISTS AdventureWorksDW2019.dbo.scd_dimemp

CREATE TABLE AdventureWorksDW2019.dbo.scd_dimemp (
    EmployeeKey int ,
    FirstName nvarchar(50) not null,
    LastName nvarchar(50) not null,
    Title nvarchar(50),
    StartDate datetime,
	EndDate datetime,
	PRIMARY KEY(EmployeeKey)
); 

SELECT * FROM AdventureWorksDW2019.dbo.stg_dimemp;
SELECT * FROM AdventureWorksDW2019.dbo.scd_dimemp;

update AdventureWorksDW2019.dbo.stg_dimemp
set LastName = 'Nowak'
where EmployeeKey = 270;update AdventureWorksDW2019.dbo.stg_dimemp
set TITLE = 'Senior Design Engineer'
where EmployeeKey = 274;

update AdventureWorksDW2019.dbo.STG_DimEmp
set FIRSTNAME = 'Ryszard'
where EmployeeKey = 275

--6. Jaki typ SCD zosta³ zaimplementowany w ka¿dej z kwerend w zadaniu numer 5b i c?
-- SCD Typ 2
--7. Jakie ustawienie i dlaczego mia³o wp³yw na dzia³anie procesu w przypadku kwerendy 5c?
-- Podczas uruchomienia procesu SSIS wyst¹pi³ b³¹d dlatego ¿e w Slowly Changing Dimension
-- FirstName ma ustawiony Change Type na Fixed Attribute, wiêc nie mo¿e siê zmieniæ