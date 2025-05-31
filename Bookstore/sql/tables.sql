USE Bookstore;

DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS LagerSaldo;
DROP TABLE IF EXISTS BookAuthor;

DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS ShippingCompany;
DROP TABLE IF EXISTS Bookshops;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Authors;

DROP TABLE IF EXISTS Cities;
DROP TABLE IF EXISTS Publishers;
DROP TABLE IF EXISTS Genres;
DROP TABLE IF EXISTS Formats;


CREATE TABLE Authors (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    FirstName NVARCHAR(max) NOT NULL,
    LastName NVARCHAR(max) NOT NULL,
    Birthday DATE,
    DateOfDeath DATE
);

INSERT INTO Authors (FirstName, LastName, Birthday, DateOfDeath)
VALUES 
    ('George', 'Orwell', '1903-06-25', '1950-01-21'),
    ('Liu', 'Cixin', '1963-06-23', NULL ),
    ('Franz', 'Kafka', '1883-07-03', '1924-06-03'),
    ('Niccolò', 'Machiavelli', '1469-05-03', '1527-06-21'),
    ('Dante', 'Alighieri', '1265-05-21', '1321-09-13'),
    ('Fyodor', 'Dostoevsky', '1821-11-11', '1881-02-9'),
    ('Hjälmar', 'Söderberg', '1869-07-02', '1941-10-14'),
    ('Umberto', 'Eco', '1932-01-05', '2016-02-19'),
    ('Friedrich', 'Engels', '1820-11-28', '1895-08-05'),
    ('Gustav', 'Le Bon', '1841-05-07', '1931-12-13'),
    ('Miquel', 'De Cervantes','1547-09-29', '1616-04-22'),
    ('Leo', 'Tolstoj', '1828-09-09', '1910-11-20'),
    ('Karl', 'Marx', '1818-05-05', '1883-03-14');


CREATE TABLE Formats (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    [Format] NVARCHAR(25)
);

INSERT INTO Formats ([Format])
VALUES
    ('Hardcover'),
    ('Paperback');



CREATE TABLE Genres (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    GenreName NVARCHAR(max) NOT NULL
); 

INSERT INTO Genres (GenreName)
VALUES
    ('Politics & History'),
    ('Dystopian Fiction'),
    ('Popular Fiction'),
    ('Poetry'),
    ('Thriller'),
    ('Philosophical novel'),
    ('Science Fiction'),
    ('Historical Fiction'),
    ('Adventure Fiction'),
    ('Realist Novel'),
    ('Economic Theory & Philosophy');



CREATE TABLE Publishers (
    id INT IDENTITY(1, 1) PRIMARY KEY, 
    [Name] NVARCHAR(max) NOT NULL
); 

INSERT INTO Publishers (name)
VALUES
    ('Penguin Books Ltd'),
    ('Oxford University Press'),
    ('Natal Publishing, LLC'),
    ('Penguin Putham Inc'),
    ('Random House Inc'),
    ('KNIZNIK'),
    ('Gondol'),
    ('Bloomsbury Publishing PLC'),
    ('Vintage Publishing'),
    ('Verso Books'),
    ('Taylor & Francis Inc'),
    ('Modernista'),
    ('Wordsworth Editions Ltd'),
    ('Norsteds'),
    ('Pages Planet Publishing'),
    ('Happy Hour Books');



CREATE TABLE Books (
    ISBN NVARCHAR(13) PRIMARY KEY CHECK(LEN(ISBN) = 13),
    Title NVARCHAR(max) NOT NULL,
    [Language] NVARCHAR(max) NOT NULL, 
    Price INT,
    PublicationDate DATE,
    FormatId INT FOREIGN KEY REFERENCES Formats(id),
    GenreId INT FOREIGN KEY REFERENCES Genres(id),
    PublisherId INT FOREIGN KEY REFERENCES Publishers(id)
);

INSERT INTO Books (ISBN, Title, [Language], Price, PublicationDate, FormatId, GenreId, PublisherId)
VALUES
    ('9780141442349', 'The Prince', 'English', 95, '2011-06-30', 2, 1, 1),
    ('9780226500362', 'Discourses on Livy', 'English', 365, '1998-01-28', 1, 1, 2),
    ('9780241197790', 'The Trial', 'English', 107, '2015-07-02', 2, 2, 1),
    ('9789358480313', 'The Metamorphosis', 'English', 136, '2023-06-25', 2, 3, 16),
    ('9789361908927', 'The Trial', 'Spanish', 239, '2024-02-21', 1, 2, 15),
    ('9789177422822', 'Förvandlingen', 'Swedish', 199, '2020-01-29', 1, 3, 12),
    ('9780143107194', 'The Divine Comedy: Inferno, Purgatorio, Paradiso', 'English', 399, '2013-02-26', 1, 4, 5),
    ('9780007902095', 'Inferno', 'English', 70, '2011-10-01', 2, 4, 1),
    ('9780385722674', 'Doctor Glas', 'English', 238, '2002-08-13', 1, 5, 5),
    ('9781517250706', 'Besy', 'Russian', 365, '2015-09-30', 1, 6, 6),
    ('9789189516052', 'Trekropparsproblemet', 'Swedish', 240, '2024-03-08', 2, 7, 7),
    ('9780099466031', 'Name of Rose', 'English', 143, '2004-02-05', 2, 8, 9),
    ('9789173376501', 'Upplaga noll', 'Swedish', 303, '2015-03-30', 1, 8, 12),
    ('9780241455678', 'Fascism and Democracy', 'English', 55, '2020-01-21', 2, 1, 4),
    ('9780765377081', 'The Dark Forest', 'English', 389, '2015-08-13', 1, 7, 8),
    ('9780765377104', 'Death''s end', 'English', 399, '2016-09-20', 1, 7, 8),
    ('9780141191119', 'Origin of the Family, Private Property and the State', 'English', 162, '2010-04-28', 2, 1, 10),
    ('9781138531093', 'Psychology of the Great War', 'English', 1340, '2018-06-17', 1, 1, 11),
    ('9781853260360', 'Don Quixote', 'English', 70, '1992-05-05', 2, 9, 13),
    ('9789113118338', 'Anna Karenina: Volym I', 'Swedish' ,329, '2021-03-10', 2, 10, 14),
    ('9789113118345', 'Anna Karenina: Volym II', 'Swedish' ,309, '2021-03-10', 2, 10, 14),
    ('9780241382707', 'War of the Worlds','English', 207, '2018-12-06', 1, 7, 2),
    ('9780141441412', 'Demons', 'English', 169, '2007-04-25', 2, 6, 3),
    ('9789177813071', 'Kommunistiska manifestet','Swedish' ,102, '2018-03-19', 2, 11, 12);



CREATE TABLE BookAuthor (
    ISBN NVARCHAR(13) FOREIGN KEY REFERENCES Books(ISBN),
    AuthorId INT FOREIGN KEY REFERENCES Authors(id),
    PRIMARY KEY (ISBN, AuthorId)
);

INSERT INTO BookAuthor (ISBN, AuthorId)
VALUES 
    ('9780141442349', 4),
    ('9780226500362', 4),
    ('9780241197790', 3),
    ('9789358480313', 3),
    ('9789361908927', 3),
    ('9789177422822', 3),
    ('9780143107194', 5),
    ('9780007902095', 5),
    ('9780385722674', 7),
    ('9781517250706', 6),
    ('9789189516052', 2),
    ('9780099466031', 8),
    ('9789173376501', 8),
    ('9780241455678', 1),
    ('9780765377081', 2),
    ('9780765377104', 2),
    ('9780141191119', 9),
    ('9781138531093', 10),
    ('9781853260360', 11),
    ('9789113118338', 12),
    ('9789113118345', 12),
    ('9780241382707', 1),
    ('9780141441412', 6),
    ('9789177813071', 9),
    ('9789177813071', 13);
    


CREATE TABLE Cities (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    City NVARCHAR(max) NOT NULL,
    Country NVARCHAR(max)
);

INSERT INTO Cities (City, Country)
VALUES 
    ('Malmö', 'Sweden'),
    ('Gothenburg', 'Sweden'),
    ('Copenhagen', 'Denmark'),
    ('Oslo', 'Norway '),
    ('Hofors', 'Sweden'),
    ('Lund', 'Sweden'),
    ('Uppsala', 'Sweden'), 
    ('Stockholm', 'Sweden');


CREATE TABLE Bookshops (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    [Name] NVARCHAR(max) NOT NULL,
    [Address] NVARCHAR(max) NOT NULL,
    CityId INT FOREIGN KEY REFERENCES Cities(id),
    Phone NVARCHAR(max)
);

INSERT INTO Bookshops ([Name], [Address], CityId, Phone)
VALUES 
    ('The English Bookshop', 'Kunggatan 19', 2 ,'031455510'),
    ('Adlibris', 'Kungsgatan 15', 8 ,'0703260742'),
    ('FredrikHC Books', 'Lilla Fiskaregatan 4D', 6 ,'0702220552'),
    ('Hornstulls bokhandel', 'Bergsunds strand 32', 8 ,'0704448193'),
    ('Näckrosen bokhandel', 'Storgatan 10', 2 ,'0736526479');



CREATE TABLE LagerSaldo (
    BookshopId INT FOREIGN KEY REFERENCES Bookshops(id),
    ISBN NVARCHAR(13) FOREIGN KEY REFERENCES Books(ISBN),
    [Number of books] INT,
    PRIMARY KEY(BookshopId, ISBN)
); 

INSERT INTO LagerSaldo (BookshopId, ISBN, [Number of books])
VALUES 
    (1, '9789358480313', 14),
    (1, '9780241455678', 7),
    (1, '9780007902095', 21),
    (1, '9780385722674', 8),
    (1, '9780141442349', 4),
    (1, '9780141441412', 2),
    (1, '9780143107194', 4),
    (2, '9780241197790', 3),
    (2, '9780141441412', 1),
    (2, '9781853260360', 18),
    (2, '9780226500362', 9),
    (3, '9789189516052', 11),
    (3, '9780241382707', 7),
    (3, '9781853260360', 27),
    (3, '9789173376501', 2),
    (3, '9780141191119', 1),
    (4, '9781138531093', 1),
    (4, '9780765377104', 4),
    (4, '9780241455678', 2),
    (4, '9789177422822', 5),
    (4, '9780099466031', 1),
    (4, '9789113118345', 4),
    (4, '9789113118338', 9),
    (5, '9781517250706', 1),
    (5, '9780765377104', 4),
    (5, '9789358480313', 2),
    (5, '9789361908927', 1),
    (5, '9789177422822', 5),
    (5, '9780099466031', 1),
    (5, '9789113118345', 4),
    (5, '9789113118338', 9),
    (5, '9789177813071', 1),
    (5, '9780765377081', 12);



CREATE TABLE Customers (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    FirstName NVARCHAR(max) NOT NULL,
    LastName NVARCHAR(max) NOT NULL,
    Email NVARCHAR(max) NOT NULL, 
    [Address] NVARCHAR(max) NOT NULL,
    CityId INT FOREIGN KEY REFERENCES Cities(id)
);

INSERT INTO Customers (FirstName, LastName, Email, [Address], CityId)
VALUES
    ('Ella', 'Andersson', 'ella.andersson@gmail.com', 'Västeråsgatan 6', 8),
    ('Joakim', 'Holmner', 'joakim.holmner@gmail.com', 'Mölledalsgatan 151', 1),
    ('Viktoria', 'Johnsson', 'viktoria.johnsson@gmail.com', 'Amalievej 10', 3),
    ('Daniel', 'Öberg', 'daniel.öberg@gmail.com', 'Västra Gunnesgärde 51', 2),
    ('Sara', 'Persson', 'sara.persson@gmail.com', 'Uggleberget 26', 2),
    ('Marcus', 'Hasselblad', 'marcus.hasselblad@gmail.com', 'Karlavägen 1', 8),
    ('Martin', 'Hermansson', 'martin.hermansson@gmail.com',' Stolemagerstien 13', 3),
    ('Sofia', 'Medin', 'sofia.medin@gmail.com','Lilvägen 23', 8),
    ('Caroline', 'Mårtensson', 'caroline.mårtensson@gmail.com', 'Uplandsgade', 3),
    ('Michael', 'Olsson', 'michael.olsson@gmail.com','Rosenlundgata 21', 4);



CREATE TABLE ShippingCompany (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    CompanyName NVARCHAR(max) NOT NULL
);

INSERT INTO ShippingCompany (CompanyName)
VALUES 
    ('DHL'),
    ('Postnord'), 
    ('UPS'),
    ('Schenker');


CREATE TABLE Orders (
    id INT IDENTITY(1, 1) PRIMARY KEY, 
    CustomerId INT FOREIGN KEY REFERENCES Customers(id),
    OrderDate DATE NOT NULL, 
    ShipDate DATE NOT NULL,
    ShipCompanyId INT FOREIGN KEY REFERENCES ShippingCompany(id)
);

INSERT INTO Orders (CustomerId, OrderDate, ShipDate, ShipCompanyId)
VALUES 
    (4, '2025-03-19', '2025-03-23', 4),
    (9, '2025-04-01', '2025-03-23', 2),
    (5, '2025-11-24', '2025-11-25', 4),
    (2, '2025-05-19', '2025-05-26', 1),
    (10, '2025-05-21', '2025-05-23', 3),
    (2, '2025-03-18', '2025-03-19', 1),
    (2, '2025-02-07', '2025-02-10', 1),
    (4, '2025-05-22', '2025-05-27', 3),
    (7, '2025-04-03', '2025-04-06', 2),
    (9, '2025-05-01', '2025-05-02', 1),
    (4, '2025-05-13', '2025-05-13', 1);


CREATE TABLE OrderDetails (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    OrderId INT FOREIGN KEY REFERENCES Orders(id),
    BookISBN NVARCHAR(13) FOREIGN KEY REFERENCES Books(ISBN),
    Quantity INT NOT NULL
);

INSERT INTO OrderDetails (OrderId, BookISBN, Quantity)
VALUES
    (5, '9780241455678', 2),
    (11, '9789358480313', 1),
    (1, '9780241455678', 1),
    (3, '9780765377104', 2),
    (6, '9789113118345', 3),
    (9, '9780143107194', 1),
    (1, '9789177422822', 2),
    (4, '9780007902095', 1),
    (2, '9780007902095', 1), 
    (7, '9780099466031', 1),
    (10, '9789177813071', 2),
    (8, '9781853260360', 2);

