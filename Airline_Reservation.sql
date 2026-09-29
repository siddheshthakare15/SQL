CREATE DATABASE airline_reservation;
USE airline_reservation;
CREATE TABLE airline (
    AIRLINE_ID INT PRIMARY KEY,
    AIRLINE_NAME VARCHAR(50) NOT NULL,
    COUNTRY VARCHAR(40) NOT NULL,
    PHONE_NO BIGINT,
    EMAIL VARCHAR(80)
);
INSERT INTO airline
(AIRLINE_ID, AIRLINE_NAME, COUNTRY, PHONE_NO, EMAIL)
VALUES
(1, 'Air India', 'India', 18002331401, 'support@airindia.com'),
(2, 'IndiGo', 'India', 18001803838, 'support@indigo.com'),
(3, 'Vistara', 'India', 9289228888, 'support@vistara.com'),
(4, 'Emirates', 'UAE', 80077777, 'support@emirates.com'),
(5, 'Singapore Airlines', 'Singapore', 6222118888, 'support@sia.com');
CREATE TABLE airport (
    AIRPORT_ID INT PRIMARY KEY,
    AIRPORT_CODE CHAR(3) UNIQUE NOT NULL,
    AIRPORT_NAME VARCHAR(80) NOT NULL,
    CITY VARCHAR(40) NOT NULL,
    STATE VARCHAR(40),
    COUNTRY VARCHAR(40) NOT NULL
);
INSERT INTO airport
(AIRPORT_ID, AIRPORT_CODE, AIRPORT_NAME, CITY, STATE, COUNTRY)
VALUES
(101, 'BOM', 'Chhatrapati Shivaji Maharaj International Airport', 'Mumbai', 'Maharashtra', 'India'),
(102, 'DEL', 'Indira Gandhi International Airport', 'Delhi', 'Delhi', 'India'),
(103, 'BLR', 'Kempegowda International Airport', 'Bengaluru', 'Karnataka', 'India'),
(104, 'MAA', 'Chennai International Airport', 'Chennai', 'Tamil Nadu', 'India'),
(105, 'HYD', 'Rajiv Gandhi International Airport', 'Hyderabad', 'Telangana', 'India'),
(106, 'CCU', 'Netaji Subhas Chandra Bose International Airport', 'Kolkata', 'West Bengal', 'India'),
(107, 'PNQ', 'Pune International Airport', 'Pune', 'Maharashtra', 'India'),
(108, 'GOI', 'Goa International Airport', 'Goa', 'Goa', 'India'),
(109, 'DXB', 'Dubai International Airport', 'Dubai', 'Dubai', 'UAE'),
(110, 'SIN', 'Singapore Changi Airport', 'Singapore', 'Singapore', 'Singapore');
CREATE TABLE aircraft (
    AIRCRAFT_ID INT PRIMARY KEY,
    AIRLINE_ID INT NOT NULL,
    MODEL VARCHAR(50) NOT NULL,
    TOTAL_SEATS INT NOT NULL,
    MANUFACTURING_YEAR YEAR,
    FOREIGN KEY (AIRLINE_ID)
        REFERENCES airline(AIRLINE_ID)
);
INSERT INTO aircraft
(AIRCRAFT_ID, AIRLINE_ID, MODEL, TOTAL_SEATS, MANUFACTURING_YEAR)
VALUES
(201, 1, 'Airbus A320', 180, 2019),
(202, 1, 'Boeing 787', 256, 2020),
(203, 2, 'Airbus A320neo', 186, 2021),
(204, 2, 'Airbus A321neo', 222, 2022),
(205, 3, 'Airbus A321', 188, 2018),
(206, 4, 'Boeing 777-300ER', 354, 2019),
(207, 4, 'Airbus A380', 484, 2020),
(208, 5, 'Airbus A350', 253, 2021),
(209, 5, 'Boeing 787-10', 337, 2022),
(210, 3, 'Boeing 737', 160, 2017);
CREATE TABLE flight (
    FLIGHT_ID INT PRIMARY KEY,
    FLIGHT_NO VARCHAR(10) UNIQUE NOT NULL,
    AIRLINE_ID INT NOT NULL,
    AIRCRAFT_ID INT NOT NULL,
    SOURCE_AIRPORT_ID INT NOT NULL,
    DESTINATION_AIRPORT_ID INT NOT NULL,
    DEPARTURE_TIME DATETIME NOT NULL,
    ARRIVAL_TIME DATETIME NOT NULL,
    BASE_FARE DECIMAL(10,2) NOT NULL,
    STATUS VARCHAR(20) DEFAULT 'Scheduled',

    FOREIGN KEY (AIRLINE_ID)
        REFERENCES airline(AIRLINE_ID),

    FOREIGN KEY (AIRCRAFT_ID)
        REFERENCES aircraft(AIRCRAFT_ID),

    FOREIGN KEY (SOURCE_AIRPORT_ID)
        REFERENCES airport(AIRPORT_ID),

    FOREIGN KEY (DESTINATION_AIRPORT_ID)
        REFERENCES airport(AIRPORT_ID)
);
INSERT INTO flight
(FLIGHT_ID, FLIGHT_NO, AIRLINE_ID, AIRCRAFT_ID,
 SOURCE_AIRPORT_ID, DESTINATION_AIRPORT_ID,
 DEPARTURE_TIME, ARRIVAL_TIME, BASE_FARE, STATUS)
VALUES
(301, 'AI101', 1, 201, 101, 102,
 '2026-09-01 06:30:00', '2026-09-01 08:45:00', 5500.00, 'Scheduled'),

(302, 'AI102', 1, 202, 102, 101,
 '2026-09-02 10:00:00', '2026-09-02 12:20:00', 6200.00, 'Scheduled'),

(303, '6E201', 2, 203, 101, 103,
 '2026-09-03 07:15:00', '2026-09-03 09:05:00', 4800.00, 'Scheduled'),

(304, '6E202', 2, 204, 103, 101,
 '2026-09-04 18:00:00', '2026-09-04 20:00:00', 5100.00, 'Scheduled'),

(305, 'UK301', 3, 205, 101, 104,
 '2026-09-05 09:30:00', '2026-09-05 11:40:00', 6700.00, 'Scheduled'),

(306, 'UK302', 3, 210, 104, 101,
 '2026-09-06 15:00:00', '2026-09-06 17:15:00', 6900.00, 'Scheduled'),

(307, 'AI205', 1, 201, 101, 105,
 '2026-09-07 11:00:00', '2026-09-07 12:50:00', 4300.00, 'Scheduled'),

(308, '6E305', 2, 203, 102, 106,
 '2026-09-08 13:00:00', '2026-09-08 15:20:00', 5900.00, 'Scheduled'),

(309, 'EK501', 4, 206, 101, 109,
 '2026-09-09 04:00:00', '2026-09-09 06:15:00', 18500.00, 'Scheduled'),

(310, 'EK502', 4, 207, 109, 101,
 '2026-09-10 14:00:00', '2026-09-10 19:00:00', 20500.00, 'Scheduled'),

(311, 'SQ421', 5, 208, 101, 110,
 '2026-09-11 22:00:00', '2026-09-12 06:00:00', 22000.00, 'Scheduled'),

(312, 'SQ422', 5, 209, 110, 101,
 '2026-09-13 09:00:00', '2026-09-13 17:00:00', 22500.00, 'Scheduled'),

(313, 'AI410', 1, 202, 101, 107,
 '2026-09-14 08:00:00', '2026-09-14 09:10:00', 3200.00, 'Scheduled'),

(314, '6E411', 2, 204, 107, 101,
 '2026-09-15 19:00:00', '2026-09-15 20:10:00', 3500.00, 'Scheduled'),

(315, 'AI510', 1, 201, 101, 108,
 '2026-09-16 16:00:00', '2026-09-16 17:15:00', 4200.00, 'Scheduled');
 CREATE TABLE passenger (
    PASSENGER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(40) NOT NULL,
    LAST_NAME VARCHAR(40) NOT NULL,
    GENDER VARCHAR(10),
    AGE INT,
    PHONE_NO BIGINT NOT NULL,
    EMAIL VARCHAR(80),
    CITY VARCHAR(40),
    PASSPORT_NO VARCHAR(20) UNIQUE
);
INSERT INTO passenger
(PASSENGER_ID, FIRST_NAME, LAST_NAME, GENDER, AGE, PHONE_NO, EMAIL, CITY, PASSPORT_NO)
VALUES
(1, 'Rahul', 'Sharma', 'Male', 28, 9876500001, 'rahul.sharma@gmail.com', 'Mumbai', 'P100001'),
(2, 'Priya', 'Patel', 'Female', 31, 9876500002, 'priya.patel@gmail.com', 'Pune', 'P100002'),
(3, 'Amit', 'Verma', 'Male', 35, 9876500003, 'amit.verma@gmail.com', 'Delhi', 'P100003'),
(4, 'Sneha', 'Desai', 'Female', 26, 9876500004, 'sneha.desai@gmail.com', 'Mumbai', 'P100004'),
(5, 'Rohan', 'Mehta', 'Male', 42, 9876500005, 'rohan.mehta@gmail.com', 'Ahmedabad', 'P100005'),
(6, 'Anjali', 'Kumar', 'Female', 29, 9876500006, 'anjali.kumar@gmail.com', 'Delhi', 'P100006'),
(7, 'Vikram', 'Singh', 'Male', 38, 9876500007, 'vikram.singh@gmail.com', 'Jaipur', 'P100007'),
(8, 'Neha', 'Joshi', 'Female', 24, 9876500008, 'neha.joshi@gmail.com', 'Pune', 'P100008'),
(9, 'Arjun', 'Nair', 'Male', 33, 9876500009, 'arjun.nair@gmail.com', 'Kochi', 'P100009'),
(10, 'Kavita', 'Shah', 'Female', 40, 9876500010, 'kavita.shah@gmail.com', 'Mumbai', 'P100010'),

(11, 'Sanjay', 'Rao', 'Male', 45, 9876500011, 'sanjay.rao@gmail.com', 'Bengaluru', 'P100011'),
(12, 'Pooja', 'Iyer', 'Female', 27, 9876500012, 'pooja.iyer@gmail.com', 'Chennai', 'P100012'),
(13, 'Karan', 'Malhotra', 'Male', 30, 9876500013, 'karan.malhotra@gmail.com', 'Delhi', 'P100013'),
(14, 'Riya', 'Kapoor', 'Female', 22, 9876500014, 'riya.kapoor@gmail.com', 'Mumbai', 'P100014'),
(15, 'Nikhil', 'Gupta', 'Male', 36, 9876500015, 'nikhil.gupta@gmail.com', 'Pune', 'P100015'),
(16, 'Meera', 'Chopra', 'Female', 34, 9876500016, 'meera.chopra@gmail.com', 'Kolkata', 'P100016'),
(17, 'Aditya', 'Kulkarni', 'Male', 25, 9876500017, 'aditya.kulkarni@gmail.com', 'Pune', 'P100017'),
(18, 'Simran', 'Kaur', 'Female', 29, 9876500018, 'simran.kaur@gmail.com', 'Amritsar', 'P100018'),
(19, 'Manish', 'Yadav', 'Male', 41, 9876500019, 'manish.yadav@gmail.com', 'Lucknow', 'P100019'),
(20, 'Ayesha', 'Khan', 'Female', 32, 9876500020, 'ayesha.khan@gmail.com', 'Mumbai', 'P100020'),

(21, 'Varun', 'Bose', 'Male', 37, 9876500021, 'varun.bose@gmail.com', 'Kolkata', 'P100021'),
(22, 'Tanya', 'Sen', 'Female', 26, 9876500022, 'tanya.sen@gmail.com', 'Kolkata', 'P100022'),
(23, 'Deepak', 'Mishra', 'Male', 48, 9876500023, 'deepak.mishra@gmail.com', 'Varanasi', 'P100023'),
(24, 'Isha', 'Reddy', 'Female', 23, 9876500024, 'isha.reddy@gmail.com', 'Hyderabad', 'P100024'),
(25, 'Mohit', 'Agarwal', 'Male', 39, 9876500025, 'mohit.agarwal@gmail.com', 'Jaipur', 'P100025'),
(26, 'Divya', 'Menon', 'Female', 30, 9876500026, 'divya.menon@gmail.com', 'Kochi', 'P100026'),
(27, 'Suresh', 'Pillai', 'Male', 52, 9876500027, 'suresh.pillai@gmail.com', 'Kochi', 'P100027'),
(28, 'Nandini', 'Rao', 'Female', 28, 9876500028, 'nandini.rao@gmail.com', 'Bengaluru', 'P100028'),
(29, 'Akash', 'Patil', 'Male', 27, 9876500029, 'akash.patil@gmail.com', 'Mumbai', 'P100029'),
(30, 'Shreya', 'Das', 'Female', 33, 9876500030, 'shreya.das@gmail.com', 'Kolkata', 'P100030'),

(31, 'Harsh', 'Thakur', 'Male', 31, 9876500031, 'harsh.thakur@gmail.com', 'Delhi', 'P100031'),
(32, 'Mansi', 'Joshi', 'Female', 25, 9876500032, 'mansi.joshi@gmail.com', 'Pune', 'P100032'),
(33, 'Raj', 'Chavan', 'Male', 44, 9876500033, 'raj.chavan@gmail.com', 'Mumbai', 'P100033'),
(34, 'Swati', 'Naik', 'Female', 36, 9876500034, 'swati.naik@gmail.com', 'Goa', 'P100034'),
(35, 'Yash', 'Saxena', 'Male', 29, 9876500035, 'yash.saxena@gmail.com', 'Delhi', 'P100035'),
(36, 'Komal', 'Bhat', 'Female', 27, 9876500036, 'komal.bhat@gmail.com', 'Bengaluru', 'P100036'),
(37, 'Abhishek', 'Jain', 'Male', 40, 9876500037, 'abhishek.jain@gmail.com', 'Indore', 'P100037'),
(38, 'Aarti', 'Sinha', 'Female', 32, 9876500038, 'aarti.sinha@gmail.com', 'Patna', 'P100038'),
(39, 'Ritesh', 'Tiwari', 'Male', 34, 9876500039, 'ritesh.tiwari@gmail.com', 'Lucknow', 'P100039'),
(40, 'Tanvi', 'Deshmukh', 'Female', 21, 9876500040, 'tanvi.deshmukh@gmail.com', 'Nagpur', 'P100040');
CREATE TABLE booking (
    BOOKING_ID INT PRIMARY KEY,
    PASSENGER_ID INT NOT NULL,
    FLIGHT_ID INT NOT NULL,
    BOOKING_DATE DATE NOT NULL,
    CLASS VARCHAR(20) NOT NULL,
    BOOKING_STATUS VARCHAR(20) DEFAULT 'Confirmed',
    TOTAL_AMOUNT DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (PASSENGER_ID)
        REFERENCES passenger(PASSENGER_ID),

    FOREIGN KEY (FLIGHT_ID)
        REFERENCES flight(FLIGHT_ID)
);
INSERT INTO booking
(BOOKING_ID, PASSENGER_ID, FLIGHT_ID, BOOKING_DATE, CLASS, BOOKING_STATUS, TOTAL_AMOUNT)
VALUES
(5001, 1, 301, '2026-08-01', 'Economy',  'Confirmed', 5500.00),
(5002, 2, 301, '2026-08-02', 'Business', 'Confirmed', 9500.00),
(5003, 3, 302, '2026-08-03', 'Economy',  'Confirmed', 6200.00),
(5004, 4, 303, '2026-08-04', 'Economy',  'Confirmed', 4800.00),
(5005, 5, 304, '2026-08-04', 'Business', 'Confirmed', 8500.00),
(5006, 6, 305, '2026-08-05', 'Economy',  'Confirmed', 6700.00),
(5007, 7, 306, '2026-08-05', 'Economy',  'Cancelled',    0.00),
(5008, 8, 307, '2026-08-05', 'Economy',  'Confirmed', 4300.00),
(5009, 9, 308, '2026-08-05', 'Business', 'Confirmed', 9000.00),
(5010, 10, 309, '2026-08-06', 'Economy', 'Confirmed', 18500.00),

(5011, 11, 310, '2026-08-06', 'Business', 'Confirmed', 32000.00),
(5012, 12, 311, '2026-08-06', 'Economy',  'Confirmed', 22000.00),
(5013, 13, 312, '2026-08-07', 'Economy',  'Confirmed', 22500.00),
(5014, 14, 313, '2026-08-07', 'Economy',  'Confirmed', 3200.00),
(5015, 15, 314, '2026-08-07', 'Business', 'Confirmed', 6500.00),
(5016, 16, 315, '2026-08-08', 'Economy',  'Confirmed', 4200.00),
(5017, 17, 301, '2026-08-08', 'Economy',  'Confirmed', 5500.00),
(5018, 18, 302, '2026-08-08', 'Economy',  'Confirmed', 6200.00),
(5019, 19, 303, '2026-08-09', 'Business', 'Confirmed', 8000.00),
(5020, 20, 304, '2026-08-09', 'Economy',  'Confirmed', 5100.00),

(5021, 21, 305, '2026-08-09', 'Economy',  'Confirmed', 6700.00),
(5022, 22, 306, '2026-08-10', 'Business', 'Confirmed', 10500.00),
(5023, 23, 307, '2026-08-10', 'Economy',  'Confirmed', 4300.00),
(5024, 24, 308, '2026-08-10', 'Economy',  'Confirmed', 5900.00),
(5025, 25, 309, '2026-08-11', 'Business', 'Confirmed', 28000.00),
(5026, 26, 310, '2026-08-11', 'Economy',  'Confirmed', 20500.00),
(5027, 27, 311, '2026-08-11', 'Business', 'Confirmed', 35000.00),
(5028, 28, 312, '2026-08-12', 'Economy',  'Confirmed', 22500.00),
(5029, 29, 313, '2026-08-12', 'Economy',  'Confirmed', 3200.00),
(5030, 30, 314, '2026-08-12', 'Business', 'Confirmed', 6500.00),

(5031, 31, 315, '2026-08-13', 'Economy',  'Confirmed', 4200.00),
(5032, 32, 301, '2026-08-13', 'Economy',  'Confirmed', 5500.00),
(5033, 33, 302, '2026-08-13', 'Business', 'Confirmed', 9500.00),
(5034, 34, 303, '2026-08-14', 'Economy',  'Confirmed', 4800.00),
(5035, 35, 304, '2026-08-14', 'Economy',  'Confirmed', 5100.00),
(5036, 36, 305, '2026-08-14', 'Business', 'Confirmed', 11500.00),
(5037, 37, 306, '2026-08-15', 'Economy',  'Confirmed', 6900.00),
(5038, 38, 307, '2026-08-15', 'Economy',  'Confirmed', 4300.00),
(5039, 39, 308, '2026-08-15', 'Business', 'Confirmed', 9000.00),
(5040, 40, 309, '2026-08-16', 'Economy',  'Confirmed', 18500.00);
CREATE TABLE seat (
    SEAT_ID INT PRIMARY KEY,
    BOOKING_ID INT UNIQUE NOT NULL,
    SEAT_NO VARCHAR(5) NOT NULL,
    SEAT_TYPE VARCHAR(20) NOT NULL,

    FOREIGN KEY (BOOKING_ID)
        REFERENCES booking(BOOKING_ID)
);
INSERT INTO seat
(SEAT_ID, BOOKING_ID, SEAT_NO, SEAT_TYPE)
VALUES
(6001,5001,'1A','Window'),
(6002,5002,'1B','Window'),
(6003,5003,'2A','Window'),
(6004,5004,'2B','Middle'),
(6005,5005,'3A','Window'),
(6006,5006,'3B','Middle'),
(6007,5007,'4A','Window'),
(6008,5008,'4B','Middle'),
(6009,5009,'5A','Window'),
(6010,5010,'5B','Middle'),
(6011,5011,'6A','Window'),
(6012,5012,'6B','Middle'),
(6013,5013,'7A','Window'),
(6014,5014,'7B','Middle'),
(6015,5015,'8A','Window'),
(6016,5016,'8B','Middle'),
(6017,5017,'9A','Window'),
(6018,5018,'9B','Middle'),
(6019,5019,'10A','Window'),
(6020,5020,'10B','Middle'),
(6021,5021,'11A','Window'),
(6022,5022,'11B','Middle'),
(6023,5023,'12A','Window'),
(6024,5024,'12B','Middle'),
(6025,5025,'13A','Window'),
(6026,5026,'13B','Middle'),
(6027,5027,'14A','Window'),
(6028,5028,'14B','Middle'),
(6029,5029,'15A','Window'),
(6030,5030,'15B','Middle'),
(6031,5031,'16A','Window'),
(6032,5032,'16B','Middle'),
(6033,5033,'17A','Window'),
(6034,5034,'17B','Middle'),
(6035,5035,'18A','Window'),
(6036,5036,'18B','Middle'),
(6037,5037,'19A','Window'),
(6038,5038,'19B','Middle'),
(6039,5039,'20A','Window'),
(6040,5040,'20B','Middle');
CREATE TABLE payment (
    PAYMENT_ID INT PRIMARY KEY,
    BOOKING_ID INT UNIQUE NOT NULL,
    PAYMENT_DATE DATE NOT NULL,
    PAYMENT_METHOD VARCHAR(20) NOT NULL,
    PAYMENT_STATUS VARCHAR(20) NOT NULL,
    AMOUNT DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (BOOKING_ID)
        REFERENCES booking(BOOKING_ID)
);
INSERT INTO payment
(PAYMENT_ID, BOOKING_ID, PAYMENT_DATE, PAYMENT_METHOD, PAYMENT_STATUS, AMOUNT)
VALUES
(7001,5001,'2026-08-01','UPI','Paid',5500.00),
(7002,5002,'2026-08-02','Card','Paid',9500.00),
(7003,5003,'2026-08-03','UPI','Paid',6200.00),
(7004,5004,'2026-08-04','Card','Paid',4800.00),
(7005,5005,'2026-08-04','Net Banking','Paid',8500.00),
(7006,5006,'2026-08-05','UPI','Paid',6700.00),
(7007,5007,'2026-08-05','Card','Refunded',0.00),
(7008,5008,'2026-08-05','UPI','Paid',4300.00),
(7009,5009,'2026-08-05','Card','Paid',9000.00),
(7010,5010,'2026-08-06','UPI','Paid',18500.00),
(7011,5011,'2026-08-06','Card','Paid',32000.00),
(7012,5012,'2026-08-06','UPI','Paid',22000.00),
(7013,5013,'2026-08-07','Card','Paid',22500.00),
(7014,5014,'2026-08-07','UPI','Paid',3200.00),
(7015,5015,'2026-08-07','Card','Paid',6500.00),
(7016,5016,'2026-08-08','UPI','Paid',4200.00),
(7017,5017,'2026-08-08','Card','Paid',5500.00),
(7018,5018,'2026-08-08','UPI','Paid',6200.00),
(7019,5019,'2026-08-09','Card','Paid',8000.00),
(7020,5020,'2026-08-09','UPI','Paid',5100.00),
(7021,5021,'2026-08-09','Card','Paid',6700.00),
(7022,5022,'2026-08-10','UPI','Paid',10500.00),
(7023,5023,'2026-08-10','Card','Paid',4300.00),
(7024,5024,'2026-08-10','UPI','Paid',5900.00),
(7025,5025,'2026-08-11','Card','Paid',28000.00),
(7026,5026,'2026-08-11','UPI','Paid',20500.00),
(7027,5027,'2026-08-11','Card','Paid',35000.00),
(7028,5028,'2026-08-12','UPI','Paid',22500.00),
(7029,5029,'2026-08-12','Card','Paid',3200.00),
(7030,5030,'2026-08-12','UPI','Paid',6500.00),
(7031,5031,'2026-08-13','Card','Paid',4200.00),
(7032,5032,'2026-08-13','UPI','Paid',5500.00),
(7033,5033,'2026-08-13','Card','Paid',9500.00),
(7034,5034,'2026-08-14','UPI','Paid',4800.00),
(7035,5035,'2026-08-14','Card','Paid',5100.00),
(7036,5036,'2026-08-14','UPI','Paid',11500.00),
(7037,5037,'2026-08-15','Card','Paid',6900.00),
(7038,5038,'2026-08-15','UPI','Paid',4300.00),
(7039,5039,'2026-08-15','Card','Paid',9000.00),
(7040,5040,'2026-08-16','UPI','Paid',18500.00);
SHOW TABLES;
DESC airline;
DESC airport;
DESC aircraft;
DESC flight;
DESC passenger;
DESC booking;
DESC seat;
DESC payment;
select * from airline;
select * from airport;
select * from aircraft;
select * from flight;
select * from passenger;
select * from booking;
select * from seat;
select * from payment;

# Q.1 Find the total number of passengers in the passenger table.
SELECT COUNT(*) AS total_passengers
FROM passenger;

#Q.2 Find the total revenue generated from all bookings using TOTAL_AMOUNT.
SELECT SUM(TOTAL_AMOUNT) AS total_revenue
FROM booking;

#Q.3 Find the average BASE_FARE of all flights.
SELECT AVG(BASE_FARE) AS average_fare
FROM flight;

#Q.4 Find the highest and lowest flight base fare.
SELECT
    MAX(BASE_FARE) AS highest_fare,
    MIN(BASE_FARE) AS lowest_fare
FROM flight;

#Q.5 Display all passengers whose age is greater than 35.
SELECT *
FROM passenger
WHERE AGE > 35;

#Q.6 Find the number of passengers from each city.
SELECT CITY, COUNT(*) AS passenger_count
FROM passenger
GROUP BY CITY;

#Q.7 Find the total booking amount generated by each class.
SELECT
    CLASS,
    SUM(TOTAL_AMOUNT) AS total_revenue
FROM booking
GROUP BY CLASS;

#Q.8 Display each flight number along with its airline name.
	    SELECT
    f.FLIGHT_NO,
    a.AIRLINE_NAME
    FROM flight f
    INNER JOIN airline a
    ON f.AIRLINE_ID = a.AIRLINE_ID;

#Q.9 Display all passengers and their booking IDs, including passengers who have not made any booking.
   SELECT
    p.PASSENGER_ID,
    p.FIRST_NAME,
    p.LAST_NAME,
    b.BOOKING_ID
FROM passenger p
LEFT JOIN booking b
    ON p.PASSENGER_ID = b.PASSENGER_ID;

#Q.10 Display all bookings along with passenger names using a RIGHT JOIN.
    SELECT
    p.FIRST_NAME,
    p.LAST_NAME,
    b.BOOKING_ID,
    b.TOTAL_AMOUNT
FROM passenger p
RIGHT JOIN booking b
    ON p.PASSENGER_ID = b.PASSENGER_ID;

#Q.11 Find the total booking revenue generated by each airline.
SELECT
    a.AIRLINE_NAME,
    SUM(b.TOTAL_AMOUNT) AS total_revenue
FROM airline a
INNER JOIN flight f
    ON a.AIRLINE_ID = f.AIRLINE_ID
INNER JOIN booking b
    ON f.FLIGHT_ID = b.FLIGHT_ID
GROUP BY a.AIRLINE_NAME;

#Q.12 Find the number of bookings made for each airline.
SELECT
    a.AIRLINE_NAME,
    COUNT(b.BOOKING_ID) AS booking_count
FROM airline a
INNER JOIN flight f
    ON a.AIRLINE_ID = f.AIRLINE_ID
INNER JOIN booking b
    ON f.FLIGHT_ID = b.FLIGHT_ID
GROUP BY a.AIRLINE_NAME;

#Q.13 Find airlines having more than 5 bookings.
SELECT
    a.AIRLINE_NAME,
    COUNT(b.BOOKING_ID) AS booking_count
FROM airline a
INNER JOIN flight f
    ON a.AIRLINE_ID = f.AIRLINE_ID
INNER JOIN booking b
    ON f.FLIGHT_ID = b.FLIGHT_ID
GROUP BY a.AIRLINE_NAME
HAVING COUNT(b.BOOKING_ID) > 5;

#Q.14 Display the flight number, airline name, and base fare for flights whose base fare is greater than ₹10,000.
SELECT
    f.FLIGHT_NO,
    a.AIRLINE_NAME,
    f.BASE_FARE
FROM flight f
INNER JOIN airline a
    ON f.AIRLINE_ID = a.AIRLINE_ID
WHERE f.BASE_FARE > 10000;

#Q.15 Find all female passengers whose age is greater than 30.
SELECT *
FROM passenger
WHERE GENDER = 'Female'
  AND AGE > 30;

#Q.16 Find bookings whose TOTAL_AMOUNT is greater than the average booking amount.
    SELECT *
	FROM booking
	WHERE TOTAL_AMOUNT > (
	SELECT AVG(TOTAL_AMOUNT)
  	 FROM booking
	);

#Q.17 Display booking ID and categorize the booking amount as Low, Medium, or High.
    SELECT
    BOOKING_ID,
    TOTAL_AMOUNT,
    CASE
        WHEN TOTAL_AMOUNT < 10000 THEN 'Low'
        WHEN TOTAL_AMOUNT BETWEEN 10000 AND 20000 THEN 'Medium'
        ELSE 'High'
    END AS amount_category
FROM booking;

#Q.18 Using a CTE, calculate the total revenue generated by each airline.
WITH airline_revenue AS (
    SELECT
        a.AIRLINE_NAME,
        SUM(b.TOTAL_AMOUNT) AS total_revenue
    FROM airline a
    INNER JOIN flight f
        ON a.AIRLINE_ID = f.AIRLINE_ID
    INNER JOIN booking b
        ON f.FLIGHT_ID = b.FLIGHT_ID
    GROUP BY a.AIRLINE_NAME
)
SELECT *
FROM airline_revenue;

#Q.19 Rank passengers according to their total booking expenditure.
SELECT
    p.PASSENGER_ID,
    p.FIRST_NAME,
    p.LAST_NAME,
    SUM(b.TOTAL_AMOUNT) AS total_spent,
    RANK() OVER (
        ORDER BY SUM(b.TOTAL_AMOUNT) DESC
    ) AS spending_rank
FROM passenger p
INNER JOIN booking b
    ON p.PASSENGER_ID = b.PASSENGER_ID
GROUP BY
    p.PASSENGER_ID,
    p.FIRST_NAME,
    p.LAST_NAME;

