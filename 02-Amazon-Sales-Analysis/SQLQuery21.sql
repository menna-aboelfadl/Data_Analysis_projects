select*from Categories
alter table Categories
drop column Picture

select*from Customers

select*from Employees 
alter table Employees
drop column PhotoPath

select*from EmployeeTerritories
select*from Order_Details
select*from Orders
select*from Products
select*from Region
select*from Shippers
select*from Suppliers
select*from Territories


SELECT 
SUM(UnitPrice * Quantity * (1 - Discount)) AS Total_Sales
FROM [Order_Details] 

CREATE VIEW vw_Total_Sales AS 
SELECT 
sum(UnitPrice * Quantity * (1 - Discount)) AS Total_Sales
FROM Order_Details;

CREATE VIEW vw_Total_orders as
SELECT 
COUNT(DISTINCT OrderID) as Total_orders
from Orders;
select*from vw_Total_orders
select * from Customers c
right join Orders o on c.CustomerID=o.CustomerID


CREATE VIEW vw_Total_quantity as
SELECT
SUM(Quantity) AS Total_Quantity
FROM Order_Details;
select * from vw_Total_quantity




CREATE VIEW TotalQuantityPerProduct AS
SELECT p.ProductName, SUM(od.Quantity) AS Total_Quantity
FROM Order_Details od
JOIN products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName

select*from TotalQuantityPerProduct
 
create view total_quantity_by_category as
select CategoryName
from Categories

select * from Customers
where City = 'Berlin'

select * from Customers
where Country='Mexico'

select * from Employees
where year(HireDate) = '1992'

select * from Employees
where City='London' and year(HireDate)='1993'

select * from Employees
where ReportsTo is NULL

select e.FirstName,e.EmployeeID,et.TerritoryID
from Employees e
join EmployeeTerritories et
on e.EmployeeID=et.EmployeeID

select *from Order_Details
where Discount not in (0)

select o.OrderID,
sum(od.UnitPrice) as 'Total Order Price'
from Orders o
inner join Order_Details od
on od.OrderID=o.OrderID
group by o.OrderID 





CREATE VIEW vw_Sales_Details AS
SELECT 
    o.OrderID,
    o.OrderDate,
    o.ShipCountry,
    c.CustomerID,
    c.CompanyName,
    p.ProductID,
    p.ProductName,
    cat.CategoryName,
    od.Quantity,
    od.UnitPrice,
    od.Discount,
    
    (od.UnitPrice * od.Quantity * (1 - od.Discount)) AS Sales
FROM Orders o
JOIN [Order_Details] od ON o.OrderID = od.OrderID
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories cat ON p.CategoryID = cat.CategoryID

CREATE VIEW vw_Sales_By_Year AS
SELECT 
    YEAR(OrderDate) AS OrderYear,
    SUM(Sales) AS Total_Sales
FROM vw_Sales_Details
GROUP BY YEAR(OrderDate)

CREATE VIEW vw_Sales_By_Country AS
select ShipCountry ,
SUM(Sales) AS Total_Sales

FROM vw_Sales_Details
GROUP BY ShipCountry

CREATE VIEW vw_Sales_By_Categorie AS
SELECT CategoryName ,
     
 SUM(Sales) AS Total_Sales
FROM vw_Sales_Details
GROUP BY CategoryName

CREATE VIEW TotalProfit AS
SELECT SUM(UnitPrice * Quantity * (1 - Discount)) AS Total_Profit
FROM Order_Details;



