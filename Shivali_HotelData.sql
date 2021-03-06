USE HotelDB ;

INSERT INTO Guest (GuestId,FirstName, LastName,Address, City, State, Zip, Phone) VALUES
    (1,'Shivali',' Desai','64 Newlyn Cres.', 'Brampton', 'ON', 'L63A9','(647) 647-6470'),
    (2,'Mack','Simmer','379 Old Shore Street','Council Bluffs','IA',51501,'(291) 553-0508'),
    (3,'Bettyann',' Seery','750 Wintergreen Dr.','Wasilla','AK',99654,'(478) 277-9632'),
    (4,'Duane ','Cullison','9662 Foxrun Lane','Harlingen','TX',78552,'(308) 494-0198'),
    (5,'Karie ','Yang','9378 W. Augusta Ave.','West Deptford','NJ',8096,'(214) 730-0298'),
    (6,'Aurore',' Lipton','762 Wild Rose Street','Saginaw','MI',48601,'(377) 507-0974'),
    (7,'Zachery',' Luechtefield','7 Poplar Dr.','Arvada','CO',80003,'(814) 485-2615'),
    (8,'Jeremiah ','Pendergrass','70 Oakwood St.','Zion','IL',60099,'(279) 491-0960'),
    (9,'Walter',' Holaway','7556 Arrowhead St.','Cumberland','RI',2864,'(446) 396-6785'),
    (10,'Wilfred ','Vise','77 West Surrey Street','Oswego','NY',13126,'(834) 727-1001'),
    (11,'Maritza ','Tilton','939 Linda Rd.','Burke','VA',22015,'(446) 351-6860'),
    (12,'Joleen',' Tison','87 Queen St.','Drexel Hill','PA',19026,'(231) 893-2755');
    
    

INSERT RoomType ( RoomTypeId, RoomType , StandardOccupancy, MaximumOccupancy, BasePrice, ExtraPerson) VALUES
	( 1, 'Single' , 2,2,174.99,0.00),
    ( 2, 'Double', 2,4,199.99,10.00 ) ,
    ( 3, 'Suite' , 3,8,399.99,20.00) ;
    
INSERT INTO Amenities (AmenityId, AmenityType) VALUES 
    (1,'Microwave'),
    (2,'Jacuzzi'),
    (3,'Refrigerator'),
    (4,'Oven');
    
SELECT * FROM Amenities ;

INSERT INTO Room (RoomId, RoomNumber, RoomTypeId , IsADDAccessible ) VALUES
    (1,201,'2', 0 ),
    (2,202,'2',1),
    (3,203,'2',0),
    (4,204,'2',1),
    (5,205,'1',0),
    (6,206,'1',1),
    (7,207,'1',0),
    (8,208,'1',1),
    (9,301,'2',0),
    (10,302,'2',1),
    (11,303,'2',0),
    (12,304,'2',1),
    (13,305,'1',0),
    (14,306,'1',1),
    (15,307,'1',0),
    (16,308,'1',1),
    (17,401,'3',1),
    (18,402,'3',1);

SELECT * FROM Room ; 

 INSERT INTO Reservation ( ReservationId, RoomId, GuestId,FirstName, LastName,Adults, Children, StartDate, EndDate, TotalRoomCost) VALUES
	(1,16,2,'Mack', 'Simmer',1,0,'2023-02-02 00:00:00','2023-02-04 00:00:00',299.98),
    (2,3,3,'Bettyann','Seery',2,1,'2023-02-05 00:00:00','2023-02-10 00:00:00',999.95),
    (3,13,4,'Duane','Cullison',2,0,'2023-02-22 00:00:00','2023-02-24 00:00:00',349.98),
    (4,1,5,'Karie',' Yang',2,2,'2023-03-06 00:00:00','2023-03-07 00:00:00',199.99),
    (5,15,1,'Shivali', 'Desai',1,1,'2023-03-17 00:00:00','2023-03-20 00:00:00',524.97),
    (6,10,6,'Aurore',' Lipton',3,0,'2023-03-18 00:00:00','2023-03-23 00:00:00',924.95),
    (7,2,7,'Zachery',' Luechtefeld',2,2,'2023-03-29 00:00:00','2023-03-31 00:00:00',349.98),
    (8,12,8,'Jeremiah',' Pendergrass',2,0,'2023-03-31 00:00:00','2023-04-05 00:00:00',874.95),
    (9,9,9,'Walter',' Holaway',1,0,'2023-04-09 00:00:00','2023-04-13 00:00:00',799.96),
    (10,7,10,'Wilfred',' Vise',1,1,'2023-04-23 00:00:00','2023-04-24 00:00:00',174.99),
    (11,17,11,'Maritza',' Tilton',2,4,'2023-05-30 00:00:00','2023-06-02 00:00:00',1199.97),
    (12,6,12,'Joleen',' Tison',2,0,'2023-06-10 00:00:00','2023-06-14 00:00:00',599.96),
    (13,8,12,'Joleen',' Tison',1,0,'2023-06-10 00:00:00','2023-06-14 00:00:00',599.96),
    (14,12,6,'Aurore',' Lipton',3,0,'2023-06-17 00:00:00','2023-06-18 00:00:00',184.99),
    (15,5,1,'Shivali','Desai',2,0,'2023-06-28 00:00:00','2023-07-02 00:00:00',699.96),
    (16,4,9,'Walter',' Holaway',3,1,'2023-07-13 00:00:00','2023-07-14 00:00:00',184.99),
    (17,17,10,'Wilfred',' Vise',4,2,'2023-07-18 00:00:00','2023-07-21 00:00:00',1259.97),
    (18,11,3,'Bettyann',' Seery',2,1,'2023-07-28 00:00:00','2023-07-29 00:00:00',199.99),
    (19,13,3,'Bettyann',' Seery',1,0,'2023-08-30 00:00:00','2023-09-01 00:00:00',349.98),
    (20,8,2,'Mack',' Simmer',2,0,'2023-09-16 00:00:00','2023-09-17 00:00:00',149.99),
    (21,3,5,'Karie',' Yang',2,2,'2023-09-13 00:00:00','2023-09-15 00:00:00',399.98),
    (22,17,4,'Duane',' Cullison',2,2,'2023-11-22 00:00:00','2023-11-25 00:00:00',1199.97),
    (23,6,2,'Mack',' Simmer',2,0,'2023-11-22 00:00:00','2023-11-25 00:00:00',449.97),
    (24,9,2,'Mack',' Simmer',2,2,'2023-11-22 00:00:00','2023-11-25 00:00:00',599.97),
    (25,10,11,'Maritza',' Tilton',2,0,'2023-12-24 00:00:00','2023-12-28 00:00:00',699.96);

SELECT * FROM Reservation;
    
    INSERT INTO RoomAmenities (RoomID, AmenityID) VALUES
	(1, 1),
	(1, 2),
	(2, 3),
	(3, 1),
	(3, 2),
	(4, 3),
	(5, 1),
	(5, 3),
	(5, 2),
	(6, 1),
	(6, 3),
	(7, 1),
	(7, 3),
	(7, 2),
	(8, 1),
	(8, 3),
	(9, 1),
	(9, 2),
	(10, 3),
	(11, 1),
	(11, 2),
	(12, 3),
	(13, 1),
	(13, 3),
	(13, 2),
	(14, 1),
	(14, 3),
	(15, 1),
	(15, 3),
	(15, 2),
	(16, 1),
	(16, 3),
	(17, 1),
	(17, 3),
	(17, 4),
	(18, 1),
	(18, 3),
	(18, 4);
    
   -- Removing Jeremiah Pendergrass and his reservations
   
    SELECT * FROM Guest 
    Where FirstName = 'Jeremiah ' and LastName ='Pendergrass' ;
    DELETE FROM Reservation WHERE GuestId = 8;
    DELETE FROM Guest WHERE GuestId = 8;
   
	