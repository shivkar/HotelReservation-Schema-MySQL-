USE HOTELDB ;
INSERT INTO Amenity (AmenityId, AmenityType) VALUES 
    (1,'Microwave'),
    (2,'Refrigerator'),
    (3,'Oven'),
    (4,'Jacuzzi');
    
SELECT * FROM Amenity ;

INSERT INTO Room (RoomNumber, Type, Amenity , IsAddAccessible, StandardOccupancy, MaximumOccupancy, BasePrice, ExtraPerson) VALUES
    (201,'Double','Microwave Jacuzzi', 0,2,4,199.99,10.00),
    (202,'Double','Refrigerator',1,2,4,174.99,10.00),
    (203,'Double','Microwave Jacuzzi',0,2,4,199.99,10.00),
    (204,'Double','Refrigerator',1,2,4,174.99,10.00),
    (205,'Single','Microwave Refrigerator Jacuzzi',0,2,2,174.99,0.00),
    (206,'Single','Microwave Refrigerator',1,2,2,149.99,0.00),
    (207,'Single','Microwave Refrigerator Jacuzzi',0,2,2,174.99,0.00),
    (208,'Single','Microwave Refrigerator',1,2,2,149.99,0.00),
    (301,'Double','Microwave Jacuzzi',0,2,4,199.99,10.00),
    (302,'Double','Refrigerator',1,2,4,174.99,10.00),
    (303,'Double','Microwave Jacuzzi',0,2,4,199.99,10.00),
    (304,'Double','Refrigerator',1,2,4,174.99,10.00),
    (305,'Single','Microwave Refrigerator Jacuzzi',0,2,2,174.99,0.00),
    (306,'Single','Microwave Refrigerator',1,2,2,149.99,0.00),
    (307,'Single','Microwave Refrigerator Jacuzzi',0,2,2,174.99,0.00),
    (308,'Single','Microwave Refrigerator',1,2,2,149.99,0.00),
    (401,'Suite','Microwave Refrigerator Oven',1,3,8,399.99,20.00),
    (402,'Suite','Microwave Refrigerator Oven',1,3,8,399.99,20.00);

SELECT * FROM Room ; 

 INSERT INTO Reservations ( ReservationId, RoomNumber,GuestName,Adults, Children, StartDate, EndDate, TotalRoomCost) VALUES
	(1,308,'Mack Simmer',1,0,'2023-02-02 00:00:00','2023-02-04 00:00:00',299.98),
    (2,203,'Bettyann Seery',2,1,'2023-02-05 00:00:00','2023-02-10 00:00:00',999.95),
    (3,305,'Duane Cullison',2,0,'2023-02-22 00:00:00','2023-02-24 00:00:00',349.98),
    (4,201,'Karie Yang',2,2,'2023-03-06 00:00:00','2023-03-07 00:00:00',199.99),
    (5,307,'Shivali Desai',1,1,'2023-03-17 00:00:00','2023-03-20 00:00:00',524.97),
    (6,302,'Aurore Lipton',3,0,'2023-03-18 00:00:00','2023-03-23 00:00:00',924.95),
    (7,202,'Zachery Luechtefeld',2,2,'2023-03-29 00:00:00','2023-03-31 00:00:00',349.98),
    (8,304,'Jeremiah Pendergrass',2,0,'2023-03-31 00:00:00','2023-04-05 00:00:00',874.95),
    (9,301,'Walter Holaway',1,0,'2023-04-09 00:00:00','2023-04-13 00:00:00',799.96),
    (10,207,'Wilfred Vise',1,1,'2023-04-23 00:00:00','2023-04-24 00:00:00',174.99),
    (11,401,'Maritza Tilton',2,4,'2023-05-30 00:00:00','2023-06-02 00:00:00',1199.97),
    (12,206,'Joleen Tison',2,0,'2023-06-10 00:00:00','2023-06-14 00:00:00',599.96),
    (13,208,'Joleen Tison',1,0,'2023-06-10 00:00:00','2023-06-14 00:00:00',599.96),
    (14,304,'Aurore Lipton',3,0,'2023-06-17 00:00:00','2023-06-18 00:00:00',184.99),
    (15,205,'Shivali Desai',2,0,'2023-06-28 00:00:00','2023-07-02 00:00:00',699.96),
    (16,204,'Walter Holaway',3,1,'2023-07-13 00:00:00','2023-07-14 00:00:00',184.99),
    (17,401,'Wilfred Vise',4,2,'2023-07-18 00:00:00','2023-07-21 00:00:00',1259.97),
    (18,303,'Bettyann Seery',2,1,'2023-07-28 00:00:00','2023-07-29 00:00:00',199.99),
    (19,305,'Bettyann Seery',1,0,'2023-08-30 00:00:00','2023-09-01 00:00:00',349.98),
    (20,208,'Mack Simmer',2,0,'2023-09-16 00:00:00','2023-09-17 00:00:00',149.99),
    (21,203,'Karie Yang',2,2,'2023-09-13 00:00:00','2023-09-15 00:00:00',399.98),
    (22,401,'Duane Cullison',2,2,'2023-11-22 00:00:00','2023-11-25 00:00:00',1199.97),
    (23,206,'Mack Simmer',2,0,'2023-11-22 00:00:00','2023-11-25 00:00:00',449.97),
    (24,301,'Mack Simmer',2,2,'2023-11-22 00:00:00','2023-11-25 00:00:00',599.97),
    (25,302,'Maritza Tilton',2,0,'2023-12-24 00:00:00','2023-12-28 00:00:00',699.96);

SELECT * FROM Reservations;

 INSERT INTO Guest (GuestId,GuestName, Address, City, State, Zip, Phone) VALUES
    (1,'Shivali Desai','64 Newlyn Cres.', 'Brampton', 'ON', 'L63A9','(647) 647-6470'),
    (2,'Mack Simmer','379 Old Shore Street','Council Bluffs','IA',51501,'(291) 553-0508'),
    (3,'Bettyann Seery','750 Wintergreen Dr.','Wasilla','AK',99654,'(478) 277-9632'),
    (4,'Duane Cullison','9662 Foxrun Lane','Harlingen','TX',78552,'(308) 494-0198'),
    (5,'Karie Yang','9378 W. Augusta Ave.','West Deptford','NJ',8096,'(214) 730-0298'),
    (6,'Aurore Lipton','762 Wild Rose Street','Saginaw','MI',48601,'(377) 507-0974'),
    (7,'Zachery Luechtefield','7 Poplar Dr.','Arvada','CO',80003,'(814) 485-2615'),
    (8,'Jeremiah Pendergrass','70 Oakwood St.','Zion','IL',60099,'(279) 491-0960'),
    (9,'Walter Holaway','7556 Arrowhead St.','Cumberland','RI',2864,'(446) 396-6785'),
    (10,'Wilfred Vise','77 West Surrey Street','Oswego','NY',13126,'(834) 727-1001'),
    (11,'Maritza Tilton','939 Linda Rd.','Burke','VA',22015,'(446) 351-6860'),
    (12,'Joleen Tison','87 Queen St.','Drexel Hill','PA',19026,'(231) 893-2755');
    
   
	INSERT INTO RoomReservation (RoomNumber, ReservationId) VALUES
    (308,1),
    (203,2),
    (305,3),
    (201,4),
    (307,5),
    (302,6),
    (202,7),
    (304,8),
    (301,9),
    (207,10),
    (401,11),
    (206,12),
    (208,13),
    (304,14),
    (205,15),
    (204,16),
    (401,17),
    (303,18),
    (305,19),
    (208,20),
    (203,21),
    (401,22),
    (206,23),
    (301,24),
    (302,25);
    
SELECT * From RoomReservation ;
    
    INSERT INTO GuestReservation (GuestId, ReservationId) VALUES
    (2,1),
    (3,2),
    (4,3),
    (5,4),
    (1,5),
    (6,6),
    (7,7),
    (8,8),
    (9,9),
    (10,10),
    (11,11),
    (12,12),
    (12,13),
    (6,14),
    (1,15),
    (9,16),
    (10,17),
    (3,18),
    (3,19),
    (2,20),
    (5,21),
    (4,22),
    (2,23),
    (2,24),
    (11,25);
    
    SELECT * FROM GuestReservation;
    
   -- Removing Jeremiah Pendergrass and his reservations
    DELETE FROM GuestReservation WHERE GuestId = 8;
    DELETE FROM Guest WHERE GuestId = 8;
    DELETE FROM RoomReservation WHERE ReservationId = 8;
	DELETE FROM Reservations WHERE ReservationId = 8;
	