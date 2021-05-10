/*
Relational Schema

Tour (TourName, Description)
Primary Key (TourName)

Event (EventYear, EventMonth, EventDay, EventFee)
Primary Key (EventYear, EventMonth, EventDay)
Foreign Key (TourName) References Tour

Booking (DateBooked, Payment)
Foreign Key (TourName)
Foreign Key (EventYear) References Event
Foreign Key (EventMonth) References Event
Foreign Key (EventDay) References Event
Foreign Key (ClientID) References Client

Client (ClientID, Surname, GivenName, Gender)
Primary Key (ClientID)
*/  

CREATE DATABASE DB103475494;

USE DB103475494;

