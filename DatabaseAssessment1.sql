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
