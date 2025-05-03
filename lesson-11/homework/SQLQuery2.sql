CREATE TABLE Orders_DB1 (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);

INSERT INTO Orders_DB1 (OrderID, CustomerName, Product, Quantity) VALUES
(101, 'Alice', 'Laptop', 1),
(102, 'Bob', 'Phone', 2),
(103, 'Charlie', 'Tablet', 1),
(104, 'David', 'Monitor', 1);

CREATE TABLE Orders_DB2 (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);

INSERT INTO Orders_DB2 (OrderID, CustomerName, Product, Quantity) VALUES
(101, 'Alice', 'Laptop', 1),
(103, 'Charlie', 'Tablet', 1);

declare @MissingOrders table (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT
);

;with ect as (
select o1.OrderID, o1.CustomerName, o1.Product, o1.Quantity from Orders_DB1 o1
left join Orders_DB2 o2
on o1.OrderID = o2.OrderID
where o2.OrderID is NULL)

insert into @MissingOrders
select * from ect;

select * from @MissingOrders
