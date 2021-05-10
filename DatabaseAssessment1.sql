/*
Relational Schema

Tour (TourName, Description)
Primary Key (TourName)

Event (EventYear, EventMonth, EventDay, EventFee)
Primary Key (EventYear, EventMonth, EventDay)
Foreign Key (TourName) References Tour

Booking (DateBooked, Payment)
Foreign Key (TourName) References Tour
Foreign Key (EventYear) References Event
Foreign Key (EventMonth) References Event
Foreign Key (EventDay) References Event
Foreign Key (ClientId) References Client

Client (ClientId, Surname, GivenName, Gender)
Primary Key (ClientId)
*/  

CREATE DATABASE DB103475494;

USE DB103475494;

CREATE TABLE Tour (
    TourName NVARCHAR(100),
    Description NVARCHAR(500),
    PRIMARY KEY (TourName)
);
CREATE TABLE Client (
    ClientId INT,
    Surname NVARCHAR(100) Not Null,
    GivenName NVARCHAR(100) Not Null,
    Gender NVARCHAR(1) CHECK (Gender IN ('M', 'F', 'T') ),
    PRIMARY KEY (ClientId)
);
CREATE TABLE Event (
    TourName NVARCHAR(100) Not Null,
    EventMonth NVARCHAR(3) CHECK (EventMonth IN ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec') ),
    EventDay INT CHECK (EventDay >= 1 AND EventDay <= 31),
    EventYear INT CHECK (LEN(EventYear) = 4),
    EventFee MONEY Not Null CHECK (EventFee > 0),
    PRIMARY KEY (EventYear, EventMonth, EventDay, TourName), 
    FOREIGN KEY (TourName) REFERENCES Tour
);
CREATE TABLE Booking (
    ClientId INT,
    TourName NVARCHAR(100),
    EventMonth NVARCHAR(3) CHECK (EventMonth IN ('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec') ),
    EventDay INT CHECK (EventDay >= 1 AND EventDay <= 31),
    EventYear INT CHECK (LEN(EventYear) = 4),
    Payment MONEY CHECK (Payment > 0),
    DateBooked DATE Not Null,
    PRIMARY KEY (ClientID, TourName, EventYear, EventMonth, EventDay),
    FOREIGN KEY (EventYear, EventMonth, EventDay, TourName) REFERENCES Event
);

-- exec sp_columns Booking
exec sp_columns Booking

drop table client
drop table event
drop table tour

SELECT * FROM sys.tables;

-- Task 3
INSERT INTO Booking (ClientId, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked)
VALUES (1, 'North', 'Jan', 9, 2016, 200, '12/10/2015');
INSERT INTO Booking (ClientId, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked)
VALUES (2, 'North', 'Jan', 9, 2016, 200, '12/16/2015');
INSERT INTO Booking (ClientId, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked)
VALUES (1, 'North', 'Feb', 13, 2016, 225, '1/08/2016');
INSERT INTO Booking (ClientId, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked)
VALUES (2, 'North', 'Feb', 13, 2016, 125, '1/14/2016');
INSERT INTO Booking (ClientId, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked)
VALUES (3, 'North', 'Feb', 13, 2016, 225, '2/03/2016');
INSERT INTO Booking (ClientId, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked)
VALUES (1, 'South', 'Jan', 9, 2016, 200, '12/10/2015');
INSERT INTO Booking (ClientId, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked)
VALUES (2, 'South', 'Jan', 16, 2016, 200, '12/18/2015');
INSERT INTO Booking (ClientId, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked)
VALUES (3, 'South', 'Jan', 16, 2016, 200, '1/09/2016');
INSERT INTO Booking (ClientId, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked)
VALUES (2, 'West', 'Jan', 29, 2016, 225, '12/17/2015');
INSERT INTO Booking (ClientId, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked)
VALUES (3, 'West', 'Jan', 29, 2016, 200, '12/18/2015');
INSERT INTO Booking (ClientId, TourName, EventMonth, EventDay, EventYear, Payment, DateBooked)
VALUES (4, 'West', 'Jan', 29, 2016, 200, '12/18/2015');

INSERT INTO Client (ClientId, Surname, GivenName, Gender)
Values (1, 'Price', 'Taylor', 'M');
INSERT INTO Client (ClientId, Surname, GivenName, Gender)
Values (2, 'Gamble', 'Ellyse', 'M');
INSERT INTO Client (ClientId, Surname, GivenName, Gender)
Values (3, 'Tan', 'Tilly', 'M');
INSERT INTO Client (ClientId, Surname, GivenName, Gender)
Values (4, 'Choi', 'Riki', 'M');

INSERT INTO Tour (TourName, Description)
Values ('North', 'Tour of wineries and outlets of the Bedigo and Castlemaine region');
INSERT INTO Tour (TourName, Description)
Values ('South', 'Tour of wineries and outlets of Mornington Penisula');
INSERT INTO Tour (TourName, Description)
Values ('West', 'Tour of wineries and outlets of the Geelong and Otways region');

INSERT INTO Event (TourName, EventMonth, EventDay, EventYear, EventFee)
Values ('North', 'Jan', 9, 2016, 200);
INSERT INTO Event (TourName, EventMonth, EventDay, EventYear, EventFee)
Values ('North', 'Feb', 13, 2016, 225);
INSERT INTO Event (TourName, EventMonth, EventDay, EventYear, EventFee)
Values ('South', 'Jan', 9, 2016, 200);
INSERT INTO Event (TourName, EventMonth, EventDay, EventYear, EventFee)
Values ('South', 'Jan', 16, 2016, 200);
INSERT INTO Event (TourName, EventMonth, EventDay, EventYear, EventFee)
Values ('West', 'Jan', 29, 2016, 225);

select * from Client

SELECT GivenName, Surname, TourName, Description, EventYear, EventMonth, EventDay, EventFee, Payment
From Booking B
INNER JOIN Client B
ON C.ClientId = B.ClientId
INNER JOIN Event E
ON B.TourName = E.TourName