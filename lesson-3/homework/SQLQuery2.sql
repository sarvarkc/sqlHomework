DROP TABLE IF EXISTS Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);

INSERT INTO Orders (OrderID, CustomerName, OrderDate, TotalAmount, Status)
VALUES
(1, 'Alice Johnson', '2023-12-01', 150.75, 'Pending'),
(2, 'Bob Smith', '2024-11-28', 240.50, 'Shipped'),
(3, 'Carol White', '2023-12-03', 89.99, 'Delivered'),
(4, 'David Brown', '2023-12-05', 305.60, 'Cancelled'),
(5, 'Emily Davis', '2023-12-06', 430.20, 'Pending'),
(6, 'Frank Harris', '2024-12-07', 125.00, 'Shipped'),
(7, 'Grace Lee', '2023-12-08', 2210.80, 'Delivered'),
(8, 'Henry Clark', '2023-12-09', 74.25, 'Pending'),
(9, 'Ivy Walker', '2023-12-10', 150.00, 'Cancelled'),
(10, 'Jack Turner', '2022-12-11', 560.90, 'Delivered'),
(11, 'Kara Scott', '2023-12-12', 300.00, 'Shipped'),
(12, 'Liam Hall', '2023-12-13', 399.99, 'Pending'),
(13, 'Mia Young', '2022-12-14', 240.75, 'Shipped'),
(14, 'Noah Allen', '2023-12-15', 680.00, 'Delivered'),
(15, 'Olivia King', '2024-12-16', 120.40, 'Cancelled'),
(16, 'Paul Wright', '2023-12-17', 4520.00, 'Pending'),
(17, 'Quincy Adams', '2023-12-18', 180.60, 'Shipped'),
(18, 'Rachel Moore', '2023-12-19', 2340.00, 'Delivered'),
(19, 'Sam Foster', '2021-12-20', 90.50, 'Cancelled'),
(20, 'Tina Brooks', '2023-12-21', 275.30, 'Delivered');

SELECT 
    CASE 
        WHEN Status IN ('Shipped', 'Delivered') THEN 'Completed'
        WHEN Status = 'Pending' THEN 'Pending'
        ELSE 'Cancelled'
    END AS OrderStatus,
    COUNT(*) AS TotalOrders,
    SUM(TotalAmount) AS TotalRevenue
FROM Orders
Where OrderDate BETWEEN '2023-01-01' and '2023-12-31'
GROUP BY 
    CASE 
        WHEN Status IN ('Shipped', 'Delivered') THEN 'Completed'
        WHEN Status = 'Pending' THEN 'Pending'
        ELSE 'Cancelled'
    END -- It is equal OrderStatus!
HAVING SUM(TotalAmount) > 5000
ORDER BY TotalRevenue DESC
