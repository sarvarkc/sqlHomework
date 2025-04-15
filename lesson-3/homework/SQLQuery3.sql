DROP TABLE IF EXISTS Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

INSERT INTO Products (ProductID, ProductName, Category, Price, Stock)
VALUES
(1, 'Laptop', 'Electronics', 999.99, 0),
(2, 'Smartphone', 'Electronics', 699.99, 200),
(3, 'Headphones', 'Electronics', 129.99, 350),
(4, 'Bluetooth Speaker', 'Electronics', 89.99, 5),
(5, 'Tablet', 'Electronics', 399.99, 0),
(6, 'Desk Chair', 'Furniture', 129.50, 50),
(7, 'Office Desk', 'Furniture', 349.99, 120),
(8, 'Bookshelf', 'Furniture', 159.75, 180),
(9, 'Couch', 'Furniture', 799.99, 60),
(10, 'Dining Table', 'Furniture', 499.99, 0),
(11, 'Water Bottle', 'Sports', 19.99, 0),
(12, 'Tennis Racket', 'Sports', 89.99, 0),
(13, 'Soccer Ball', 'Sports', 29.99, 300),
(14, 'Baseball Glove', 'Sports', 39.99, 8),
(15, 'Running Shoes', 'Sports', 79.99, 4),
(16, 'T-shirt', 'Clothing', 25.99, 5),
(17, 'Jeans', 'Clothing', 39.99, 200),
(18, 'Jacket', 'Clothing', 79.99, 1),
(19, 'Sneakers', 'Clothing', 59.99, 2),
(20, 'Hats', 'Clothing', 19.99, 400);

select distinct Category, max(Price) as 'Max Price' from Products
group by Category;

SELECT *, 
	IIF(Stock = 0, 'Out of Stock',
		IIF(Stock between 1 and 10, 'Low Stock', 'In Stock') -- This is just second object in select
		)
	AS InStock
FROM Products
ORDER BY Price DESC
OFFSET 5 ROW;
