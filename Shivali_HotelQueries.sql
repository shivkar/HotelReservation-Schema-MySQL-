Use HotelDB ; 

-- QUERY 1
-- Write a query that returns a list of reservations that end in July 2023, 
-- including the name of the guest, the room number(s), and the reservation dates.
--------------------
SELECT 
Guest.GuestName,
Room.RoomNumber ,
Reservations.StartDate ,
Reservations.EndDate 
From Guest 
INNER JOIN GuestReservation ON Guest.GuestId = GuestReservation.GuestId
INNER JOIN Reservations ON GuestReservation.ReservationId = RoomReservation.ReservationId
INNER JOIN Room  ON  RoomReservation.RoomNumber =Room.RoomNumber 
Where EndDate  Between '2023-07-01' And '2023-07-31'; 

-- QUERY 2
-- Write a query that returns a list of all reservations for rooms with a jacuzzi, 
-- displaying the guest's name, the room number, and the dates of the reservation.
--------------------

SELECT 
Guest.GuestName ,
Room.RoomNumber,
Reservations.StartDate,
Reservations.EndDate 
 FROM Room
INNER JOIN RoomReservation ON Room.RoomNumber = RoomReservation.RoomNumber
INNER JOIN Reservations ON RoomReservation.ReservationId = Reservations.ReservationId
INNER JOIN GuestReservation ON Reservations.ReservationId = GuestReservation.ReservationId
INNER JOIN Guest ON GuestReservation.GuestId = Guest.GuestId
WHERE Amenity Like  '%Jacuzzi%' ;

-- 11 rows 
-- Karie Yang	201	06-03-2023	07-03-2023
-- Bettyann Seery	203	05-02-2023	10-02-2023
-- Karie Yang	203	13-09-2023	15-09-2023
-- Shivali Desai	205	28-06-2023	02-07-2023
-- Wilfred Vise	207	23-04-2023	24-04-2023
-- Walter Holaway	301	09-04-2023	13-04-2023
-- Mack Simmer	301	22-11-2023	25-11-2023
-- Bettyann Seery	303	28-07-2023	29-07-2023
-- Duane Cullison	305	22-02-2023	24-02-2023
-- Bettyann Seery	305	30-08-2023	01-09-2023
-- Shivali Desai	307	17-03-2023	20-03-2023

-- QUERY 3
-- Write a query that returns all the rooms reserved for a specific guest, 
-- including the guest's name, the room(s) reserved, the starting date of the reservation, 
-- and how many people were included in the reservation. (Choose a guest's name from the existing data.)
--------------------

SELECT 

Guest.GuestName , 
Room. RoomNumber,
Reservations.StartDate, 
Reservations.EndDate, 
Reservations.Adults + Reservations. Children As TotalPeople 
FROM Guest 
INNER JOIN GuestReservation ON Guest.GuestId = GuestReservation.GuestId
INNER JOIN Reservations ON  GuestReservation.ReservationId = Reservations.ReservationId
INNER JOIN RoomReservation ON Reservations.ReservationId = RoomReservation.ReservationId
INNER JOIN Room ON RoomReservation.RoomNumber = Room.RoomNumber
WHERE Guest.GuestId = 1;

-- 2 Rows 
-- Shivali Desai	307	17-03-2023	20-03-2023	2
-- Shivali Desai	205	28-06-2023	02-07-2023	2

-- QUERY 4
-- Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. 
-- The results should include all rooms, whether or not there is a reservation associated with the room.
--------------------

SELECT 

Room. RoomNumber ,
Reservations.ReservationId,
CASE
		WHEN (((Room.RoomNumber BETWEEN '201' AND '204') OR (Room.RoomNumber BETWEEN '301' AND '304')) AND Reservations.Adults <= 2)
			THEN ((Room.BasePrice) * DATEDIFF(Reservations.EndDate, Reservations.StartDate))
		 WHEN (((Room.RoomNumber BETWEEN '201' AND '204') OR (Room.RoomNumber BETWEEN '301' AND '304')) AND Reservations.Adults > 2)
			 THEN ((Room.BasePrice + ((Reservations.Adults - Room.StandardOccupancy) * 10) * DATEDIFF(Reservations.EndDate, Reservations.StartDate)))
		WHEN ((Room.RoomNumber BETWEEN '205' AND '208') OR (Room.RoomNumber BETWEEN '305' AND '308'))
			 THEN ((Room.BasePrice) * DATEDIFF(Reservations.EndDate, Reservations.StartDate))
		WHEN (((Room.RoomNumber BETWEEN '401' AND '402')) AND Reservations.Adults <= 3)
			THEN ((Room.BasePrice) * DATEDIFF(Reservations.EndDate, Reservations.StartDate))
		WHEN (((Room.RoomNumber BETWEEN '401' AND '402')) AND Reservations.Adults > 3)
			THEN ((Room.BasePrice + ((Reservations.Adults - Room.StandardOccupancy) * 20) * DATEDIFF(Reservations.EndDate, Reservations.StartDate)))
	END AS Total
FROM Guest
RIGHT OUTER JOIN GuestReservation ON Guest.GuestId = GuestReservation.GuestId
RIGHT OUTER JOIN Reservations ON  GuestReservation.ReservationId = Reservations.ReservationId
RIGHT OUTER JOIN RoomReservation ON Reservations.ReservationId = RoomReservation.ReservationId
RIGHT OUTER JOIN Room ON RoomReservation.RoomNumber = Room.RoomNumber;
    
-- RoomNumber	ReservationId	Total
-- 201	4	199.99
-- 202	7	349.98
-- 203	2	999.95
-- 203	21	399.98
-- 204	16	184.99
-- 205	15	699.96
-- 206	12	599.96
-- 206	23	449.97
-- 207	10	174.99
-- 208	13	599.96
-- 208	20	149.99
-- 301	9	799.96
-- 301	24	599.97
-- 302	6	224.99
-- 302	25	699.96
-- 303	18	199.99
-- 304	14	184.99
-- 305	3	349.98
-- 305	19	349.98
-- 306	NULL	NULL
-- 307	5	524.97
-- 308	1	299.98
-- 401	11	1199.97
-- 401	17	459.99
-- 401	22	1199.97
-- 402	NULL	NULL
