
DROP DATABASE IF EXISTS HotelDB;
CREATE DATABASE HotelDB ; 
USE HotelDB  ;



 CREATE TABLE Guest ( 
 GuestId INT PRIMARY KEY AUTO_INCREMENT, 
 FirstName VARCHAR(20) NOT NULL ,
 LastName VARCHAR(20) NOT NULL ,
 Address VARCHAR(50) NOT NULL ,
 City VARCHAR(50) NOT NULL , 
 State CHAR(2) NOT NULL , 
 Zip CHAR(5) NOT NULL , 
 Phone CHAR(14) NOT NULL ); 

CREATE TABLE RoomType ( 
 RoomTypeId INT PRIMARY KEY NOT NULL , 
 RoomType VARCHAR(10) NOT NULL, 
 StandardOccupancy INT NOT NULL,
 MaximumOccupancy INT NOT NULL,
 BasePrice DECIMAL( 6,2 ) NOT NULL ,
 ExtraPerson DECIMAL ( 4,2)  ) ; 

CREATE TABLE Amenities (
 AmenityId INT PRIMARY KEY NOT NULL , 
 AmenityType VARCHAR (30) NOT NULL );
 
 
CREATE TABLE Room(  
RoomId INT PRIMARY KEY NOT NULL , 
RoomNumber  INT  NOT NULL  ,
RoomTypeId INT NOT NULL , 
FOREIGN KEY _fk_Room_RoomType (RoomTypeId)
REFERENCES RoomType (RoomTypeId),
IsADDAccessible BOOL NOT NULL DEFAULT 1
);
 
 
 CREATE TABLE RoomAmenities (
 RoomId INT NOT NULL , 
 AmenityId INT NOT NULL ,
 PRIMARY KEY _pk_RoomAmenities ( RoomId,AmenityId) ,
 FOREIGN KEY _fk_RoomAmenities_Room(RoomId)
  REFERENCES Room (RoomId) ,
 FOREIGN KEY _fk_RoomAmenities_Amenities (AmenityId) 
 REFERENCES Amenities(AmenityId) ) ; 
 
 
 CREATE TABLE Reservation ( 
 ReservationId INT PRIMARY KEY AUTO_INCREMENT,
 RoomId INT NOT NULL ,
 GuestId INT NOT NULL , 
 FirstName VARCHAR(20) NOT NULL ,
 LastName VARCHAR(20) NOT NULL ,
 Adults INT NOT NULL , 
 Children INT NOT NULL , 
 StartDate DATE , 
 EndDate DATE , 
 TotalRoomCost DECIMAL ( 8,2 ) NOT NULL,
 
 FOREIGN KEY fk_Reservation_Guest (GuestId)
		REFERENCES Guest (GuestId),
	FOREIGN KEY fk_Reservation_Room (RoomId)
		REFERENCES Room (RoomId)
 );
 
 
 
 
 





