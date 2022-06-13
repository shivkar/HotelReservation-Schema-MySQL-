Use HotelDB ; 

-- QUERY 1
-- Write a query that returns a list of reservations that end in July 2023, 
-- including the name of the guest, the room number(s), and the reservation dates.
--------------------
SELECT 
Reservation.FirstName,
Reservation.LastName,
Room.RoomNumber,
Reservation.StartDate ,
Reservation.EndDate 
From Reservation 
INNER JOIN Room ON Reservation.RoomId = Room.RoomId
Where EndDate  Between '2023-07-01' And '2023-07-31'; 

-- 4 rows GuestName	RoomNumber	StartDate	EndDate

-- Shivali Desai	205	28-06-2023	02-07-2023
-- Walter Holaway	204	13-07-2023	14-07-2023
-- Wilfred Vise	401	18-07-2023	21-07-2023
-- Bettyann Seery	303	28-07-2023	29-07-2023


-- QUERY 2
-- Write a query that returns a list of all reservations for rooms with a jacuzzi, 
-- displaying the guest's name, the room number, and the dates of the reservation.
--------------------

SELECT 
Reservation.FirstName,
Reservation.LastName,
Room.RoomNumber,
Reservation.StartDate,
Reservation.EndDate 
 FROM Reservation 
INNER JOIN Room ON Reservation.RoomId = Room.RoomId
INNER JOIN RoomAmenities ON Room.RoomId = RoomAmenities.RoomId
WHERE AmenityId = 2  ;

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
Reservation.FirstName , 
Reservation.LastName,
Room.RoomNumber,
Reservation.StartDate, 
Reservation.EndDate, 
Reservation.Adults + Reservation. Children As TotalPeople 
FROM Reservation  
INNER JOIN Room ON Reservation.RoomId = Room.RoomId
WHERE Reservation.guestId = 1;

-- 2 Rows 
-- Shivali Desai	307	17-03-2023	20-03-2023	2
-- Shivali Desai	205	28-06-2023	02-07-2023	2

-- QUERY 4
-- Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. 
-- The results should include all rooms, whether or not there is a reservation associated with the room.
--------------------

SELECT 
Room. RoomNumber ,
Reservation.ReservationId,
Reservation.TotalRoomCost
From Room 
LEFT OUTER JOIN Reservation ON Room.RoomId = Reservation.RoomId;
    
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

-- QUERY 5
-- Write a query that returns all the rooms accommodating at least 
-- three guests and that are reserved on any date in April 2023.

SELECT 
	Room.RoomNumber
FROM Room
INNER JOIN Reservation ON Room.RoomId = Reservation.RoomId
WHERE 	(Reservation.Adults + Reservation.Children) >=3
		AND ((Reservation.StartDate BETWEEN '2023-04-01' AND '2023-04-30')
		OR (Reservation.EndDate BETWEEN '2023-04-01' AND '2023-04-30'));
        
        -- None 
        
-- QUERY 6
-- Write a query that returns a list of all guest names and the number of reservations per guest, 
-- sorted starting with the guest with the most reservations and then by the guest's last name.
--------------------

SELECT 
	Guest.FirstName ,  
    Guest.LastName ,
    COUNT(Reservation.ReservationId) AS TotalReservations
FROM Guest  
INNER JOIN Reservation ON Guest.GuestId = Reservation.GuestId
GROUP BY Reservation.GuestId 
ORDER BY TotalReservations DESC, Guest.LastName ;

-- 12 rows GuestName	TotalReservations
-- Mack Simmer	4
-- Bettyann Seery	3
-- Aurore Lipton	2
-- Duane Cullison	2
-- Joleen Tison	2
-- Karie Yang	2
-- Maritza Tilton	2
-- Shivali Desai	2
-- Walter Holaway	2
-- Wilfred Vise	2
-- Zachery Luechtefield	1


-- 7. Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)

SELECT 
Guest.FirstName , 
Guest.LastName ,
Guest.Address,
Guest.phone 
FROM Guest 
WHERE phone = '(647) 647-6470';