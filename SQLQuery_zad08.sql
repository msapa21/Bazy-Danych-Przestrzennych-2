-- zad.8
SELECT OrderDate, COUNT(Orders_cnt) AS Orders_cnt FROM (
SELECT *, CONVERT(tinyint, RevisionNumber) AS Orders_cnt FROM FactInternetSales
) _T GROUP BY OrderDate ORDER BY COUNT(Orders_cnt) DESC
  

-- a
SELECT OrderDate, COUNT(Orders_cnt) AS Orders_cnt FROM (
SELECT *, CONVERT(tinyint, RevisionNumber) AS Orders_cnt FROM FactInternetSales
) _T GROUP BY OrderDate HAVING COUNT(Orders_cnt) < 100 ORDER BY COUNT(Orders_cnt) DESC 

-- b

SELECT OrderDate, UnitPrice FROM
(SELECT OrderDate, UnitPrice, ROW_NUMBER() OVER (PARTITION BY OrderDate ORDER BY UnitPrice DESC) AS RN FROM FactInternetSales) _T WHERE RN <= 3 ORDER BY OrderDate 

