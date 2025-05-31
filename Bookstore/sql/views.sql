DROP VIEW IF EXISTS TitlesPerAuthor;
DROP VIEW IF EXISTS BooksPerPublisher;
DROP VIEW IF EXISTS OrdersPerCustomer;

GO

CREATE VIEW TitlesPerAuthor AS
SELECT
    CONCAT(a.FirstName, ' ', a.LastName) AS [Name],
    CASE 
        WHEN a.DateOfDeath IS NULL THEN 
            CAST(FLOOR(DATEDIFF(DAY, CONVERT(DATE, a.Birthday), GETDATE()) / 365.25) AS NVARCHAR(MAX)) 
        ELSE 
            'died at ' + CAST(FLOOR(DATEDIFF(DAY, a.Birthday, a.DateOfDeath) / 365.2) AS NVARCHAR(MAX))
    END AS Age,
    COUNT(DISTINCT b.ISBN) AS [Number of Titles],
    SUM(b.Price * ls.[Number of Books]) AS [Inventory value]

FROM 
    Authors a
JOIN 
    BookAuthor ba ON a.id = ba.AuthorId
JOIN 
    Books b ON ba.ISBN = b.ISBN
JOIN 
    LagerSaldo ls ON b.ISBN = ls.ISBN
GROUP BY 
    a.id,
    a.FirstName, 
    a.LastName, 
    a.Birthday,
    a.DateOfDeath;


GO

-- this view can be useful for inventory analysis, evaluating partnerships and understandning publisher-book distribution
CREATE VIEW BooksPerPublisher AS
SELECT 
    p.id,
    p.Name,
    COUNT(b.ISBN) AS [Number of Books]
FROM 
    Books b
JOIN 
    Publishers p ON b.PublisherId = p.id
GROUP BY 
    p.id,
    p.Name;


GO

-- this view is useful for customer segmentation and targeted marketing
CREATE VIEW OrdersPerCustomer AS 
SELECT
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    SUM(od.Quantity) AS NumberOfBooks,
    SUM(b.Price * od.Quantity) AS [TotalAmount]
FROM Customers c
JOIN 
    Orders o ON c.id = o.CustomerId
JOIN 
    OrderDetails od ON o.id = od.OrderId
JOIN 
    Books b ON od.BookISBN = b.ISBN
GROUP BY 
    c.FirstName, 
    c.LastName;


GO