
DROP DATABASE IF EXISTS HotelDB;
CREATE DATABASE HOTELDB ;
USE HOTELDB ;

CREATE TABLE Room(  
RoomNumber  INT PRIMARY KEY AUTO_INCREMENT  ,
Type VARCHAR(10) NOT NULL ,
Amenity VARCHAR (30) NOT NULL , 
IsAddAccessible BOOL NOT NULL DEFAULT 1,
 StandardOccupancy INT NOT NULL,
 MaximumOccupancy INT NOT NULL,
 BasePrice DECIMAL( 5,2 ) NOT NULL ,
 ExtraPerson DECIMAL ( 4,2) NOT NULL ) ; 
 
 CREATE TABLE Guest ( 
 GuestId INT PRIMARY KEY AUTO_INCREMENT, 
 GuestName VARCHAR(50) NOT NULL ,
 Address VARCHAR(50) NOT NULL ,
 City VARCHAR(50) NOT NULL , 
 State CHAR(2) NOT NULL , 
 Zip CHAR(5) NOT NULL , 
 Phone CHAR(14) NOT NULL ); 
 
 CREATE TABLE Reservations ( 
 ReservationId INT PRIMARY KEY AUTO_INCREMENT,
 RoomNumber INT NOT NULL  ,
 GuestName VARCHAR(50) NOT NULL ,
 Adults INT NOT NULL , 
 Children INT NOT NULL , 
 StartDate DATE , 
 EndDate DATE , 
 TotalRoomCost DECIMAL ( 7,2 ) NOT NULL) ; 
 
 CREATE TABLE Amenity (
    AmenityId INT PRIMARY KEY AUTO_INCREMENT,
    AmenityType VARCHAR(30)) ;
    
 
 CREATE TABLE RoomAmenity (
    RoomNumber INT NOT NULL,
    AmenityId INT NOT NULL,
    PRIMARY KEY pk_RoomAmenity (RoomNumber, AmenityId),
	FOREIGN KEY fk_RoomAmenity_Room (RoomNumber)
		REFERENCES Room(RoomNumber),
	FOREIGN KEY fk_RoomAmenity_Amenity (AmenityId)
		REFERENCES Amenity(AmenityId)
);

CREATE TABLE GuestReservation (
	GuestId INT,
    ReservationId INT,
    PRIMARY KEY pk_GuestReservation (GuestId, ReservationId),
    FOREIGN KEY fk_GuestReservation_Guest (GuestId)
		REFERENCES Guest (GuestId),
	FOREIGN KEY fk_GuestReservation_Reservations (ReservationId)
		REFERENCES Reservations (ReservationId)
);

CREATE TABLE RoomReservation(
	RoomNumber INT,
    ReservationId INT,
    PRIMARY KEY pk_RoomReservation (RoomNumber, ReservationId),
    FOREIGN KEY fk_RoomReservation_Room (RoomNumber)
		REFERENCES Room (RoomNumber),
	FOREIGN KEY fk_RoomReservation_Reservations (ReservationId)
		REFERENCES Reservations (ReservationId)
);