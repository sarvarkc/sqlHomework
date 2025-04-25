CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);

INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Charlie Nguyen');

INSERT INTO Products (ProductID, ProductName, Category) VALUES
(101, 'Laptop', 'Electronics'),
(102, 'Office Chair', 'Furniture'),
(103, 'Pen Pack', 'Stationery'),
(104, 'Wireless Mouse', 'Electronics');

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1001, 1, '2024-05-01'),
(1002, 2, '2024-05-03'),
(1003, 1, '2024-06-10');

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES
(1, 1001, 101, 1, 1200.00),
(2, 1001, 104, 2, 25.50),     
(3, 1002, 102, 1, 300.00),       
(4, 1002, 103, 5, 3.99),      
(5, 1003, 103, 10, 3.75);        

-- Task 1: All  Customers with their orders

select 
	c.CustomerName,
	o.OrderID,
	o.OrderDate
from Customers c
left join Orders o
on c.CustomerID = o.CustomerID

-- Task 2: Customers with no orders

select 
	c.CustomerName
from Customers c
left join Orders o
on c.CustomerID = o.CustomerID
where OrderID is NULL

-- Task 3: About Orders

select
	od.OrderID,
	od.Quantity,
	od.Price,
	p.ProductName
from OrderDetails od
join Products p
on p.ProductID = od.ProductID

-- Task 4: Custumers who has more than one order

select 
	c.CustomerName
from Customers c
join Orders o
on c.CustomerID = o.CustomerID
group by c.CustomerName
having COUNT(*) > 1

-- Task 5: The most expensive product in each order

SELECT
    od.OrderID,
    od.Price,
    p.ProductName,
    sub.MaxPrice
FROM OrderDetails od
JOIN Products p ON p.ProductID = od.ProductID
JOIN (
    SELECT OrderID, MAX(Price) AS MaxPrice
    FROM OrderDetails
    GROUP BY OrderID
) sub ON od.OrderID = sub.OrderID AND od.Price = sub.MaxPrice;

-- Task 6: Latest Order

select 
	c.CustomerName,
	max(o.OrderDate) as LatestOrder
from Customers c
join Orders o
on c.CustomerID = o.CustomerID
group by c.CustomerName

-- Task 7: Customers who only purchased Electronics

SELECT 
    distinct c.CustomerName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON od.OrderID = o.OrderID 
JOIN Products p ON p.ProductID = od.ProductID
GROUP BY c.CustomerName
HAVING SUM(CASE WHEN p.Category <> 'Electronics' THEN 1 ELSE 0 END) = 0;

-- Task 8: Who purchased at least one stationery

select 
	distinct c.CustomerName
from Customers c
join Orders o
on c.CustomerID = o.CustomerID
join OrderDetails od
on od.OrderID = o.OrderID 
join Products p
on p.ProductID = od.ProductID
where p.Category = 'Stationery'

-- Task 9: Total spent by each customer

select
	distinct c.CustomerID,
	c.CustomerName,
	sum(od.Price) over(partition by c.CustomerID) as TotalSpent
from Customers c
join Orders o
on c.CustomerID = o.CustomerID
join OrderDetails od
on od.OrderID = o.OrderID 