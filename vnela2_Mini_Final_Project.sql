CREATE DATABASE Hotel; -- creating the database called Hotel Management
USE   Hotel;

/* Creating all the required tables for Hotel Management */

/* this database is about hotel management system. It includes tables for guests, rooms, reservations, bookings, staff, departments, and payments.
guests table: This table contains information about the hotel's guests, including their unique guest ID, first name, last name, email address, phone number, address, city, state, and zip code.

rooms table: This table contains information about the hotel's available rooms, including the room number (which serves as the primary key), room type, price, availability status (which can be "Available", "Occupied", or "Maintenance"), bed type, and floor.

reservations table: This table tracks the reservations made by guests, including the unique reservation ID, the guest ID associated with the reservation (from the guests table), the room number associated with the reservation (from the rooms table), the check-in and check-out dates, and the total cost of the reservation.

bookings table: This table contains information about guest bookings, including the unique booking ID, the guest ID associated with the booking (from the guests table), the booking date, and the booking time.

staff table: This table contains information about the hotel's staff, including their unique staff ID, first name, last name, position, salary, phone number, and email address.

departments table: This table tracks the different departments within the hotel and assigns them unique department IDs.

payments table: This table contains information about guest payments, including the unique payment ID, the guest ID associated with the payment (from the guests table), the payment amount, payment date, and payment method.

All tables use primary keys to identify individual records, and foreign keys to establish relationships between tables, such as linking guest information in the reservations and bookings tables to the guests table.
*/

CREATE TABLE guests (
  guest_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  address VARCHAR(100) NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  zip_code VARCHAR(10) NOT NULL
) auto_increment = 8801;

CREATE TABLE rooms (
  room_number INT PRIMARY KEY,
  room_type VARCHAR(50) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  availability ENUM('Available', 'Occupied', 'Maintenance') DEFAULT 'Available',
  bed_type VARCHAR(50) NOT NULL,
  floor INT NOT NULL
);


CREATE TABLE reservations (
  reservation_id INT AUTO_INCREMENT PRIMARY KEY,
  guest_id INT NOT NULL,
  room_number INT NOT NULL,
  check_in_date DATE NOT NULL,
  check_out_date DATE NOT NULL,
  total_cost DECIMAL(10, 2),
  FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
  FOREIGN KEY (room_number) REFERENCES rooms(room_number)
)auto_increment = 98481;

DELIMITER // 

CREATE TRIGGER update_amount
before insert on reservations
for each row 
begin 
	declare num_days INT;
    declare total_cost INT;
    set num_days = DATEDIFF(NEW.check_out_date,NEW.check_in_date);
    set new.total_cost = num_days *120;
    end //
    DELIMITER ;
/* This is a SQL code for creating a trigger named "update_amount". A trigger is a special type of stored procedure that is automatically executed in response to certain database events. In this case, the trigger is defined to be executed before a new row is inserted into the "reservations" table.

The trigger performs the following actions:

Declares two local variables, "num_days" and "total_cost", of type integer.

Calculates the number of days between the check-out date and check-in date of the new reservation, and stores the result in the "num_days" variable using the DATEDIFF function.

Calculates the total cost of the reservation by multiplying the number of days by the daily rate of $120, and stores the result in the "total_cost" variable.

Sets the "total_cost" value of the new reservation to the calculated value using the "NEW" keyword to refer to the newly inserted row.

The trigger is defined using the "BEGIN" and "END" keywords to enclose the trigger's code. The "DELIMITER" keyword is used to change the delimiter used by MySQL to the double slash "//" so that the code can be executed as a single statement.
*/


DELIMITER //
create trigger zero_error
before update
on reservations
for each row
begin
if old.total_cost = 0.00 then 
set new.total_cost = 120.00;
end if;
end //
DELIMITER //

/* This is a SQL code for creating a trigger named "zero_error". The trigger is defined to be executed before an update is made on the "reservations" table. The purpose of this trigger is to handle the scenario where the "total_cost" of a reservation is mistakenly set to 0.

The trigger performs the following actions:

Declares a local variable, "total_cost", of type decimal.

Checks if the "total_cost" value of the old row (i.e., the row being updated) is equal to 0.00 using an "IF" statement.

If the "total_cost" value of the old row is equal to 0.00, then the "SET" statement is executed to set the "total_cost" value of the new row (i.e., the updated row) to 120.00, assuming a daily rate of $120.

The trigger is defined using the "BEGIN" and "END" keywords to enclose the trigger's code.

The "DELIMITER" keyword is used to change the delimiter used by MySQL to the double slash "//" so that the code can be executed as a single statement. */

CREATE TABLE bookings (
  booking_id INT AUTO_INCREMENT PRIMARY KEY,
  guest_id INT NOT NULL,
  booking_date DATE NOT NULL,
  booking_time TIME NOT NULL,
  FOREIGN KEY (guest_id) REFERENCES guests(guest_id)
) auto_increment = 98661;

CREATE TABLE staff (
  staff_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  position VARCHAR(50) NOT NULL,
  salary DECIMAL(10, 2) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  email VARCHAR(100) NOT NULL
) auto_increment = 7701;

CREATE TABLE departments (
  department_id INT AUTO_INCREMENT PRIMARY KEY,
  department_name VARCHAR(50) NOT NULL
) auto_increment = 9991;



CREATE TABLE payments (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  guest_id INT NOT NULL,
  booking_id INT,
  amount DECIMAL(10, 2) NOT NULL,
  payment_date DATE NOT NULL,
  payment_method VARCHAR(50) NOT NULL,
  FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
  FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
)auto_increment = 001111;


DELIMITER //
create trigger update_department_position
after insert 
on staff
for each row
insert into departments(department_name)
values (new.position);
end //
DELIMITER //

/* This is a SQL code for creating a trigger named "update_department_position". The trigger is defined to be executed after a new row is inserted into the "staff" table. The purpose of this trigger is to update the "departments" table with the new "position" value of the staff member.

The trigger performs the following actions:

Inserts a new row into the "departments" table using the "INSERT INTO" statement. The value of the "department_name" column is set to the "position" value of the newly inserted row in the "staff" table, which is referenced using the "NEW" keyword.

The trigger is defined using the "BEGIN" and "END" keywords to enclose the trigger's code.*/
-- Inserting into guests tabel

INSERT INTO guests (first_name, last_name, email, phone_number, address, city, state, zip_code)
VALUES ('Prashanth', 'Noornampally', 'prashanth@gmail.com', '475-223-8961', '860 Broadway', 'New Haven', 'CT', '06519'),
('Nikhil','GS','nikhil@gmail.com','203-456-7891', '480 ferry st','West Haven','CT', '505301'),
('Kishore', 'Keerthi', 'kishore@gmail.com', '860-789-1234', '620 Howard Ave', 'Bayonne', 'Jersey', '06517'),
('Sai', 'Krishna', 'sai@gmail.com', '860-994-5678', '321 Eastern St', 'Milford', 'CT', '07618'),
('Karnakar', 'Mudhigonda', 'karnakar@gmail.com', '475-456-3456', '326 Blacthley Ave', 'East Haven', 'NJ', '14523'),
('Praneeth', 'Mekala', 'praneeth@gmail.com', '860-221-9876', '4 Rowe st', 'Paterson', 'CT', '786458');

-- Inserting into rooms tabel
INSERT INTO rooms (room_number, room_type, price, availability, bed_type, floor)
VALUES (143, 'AC', 120.00, 'Available', 'Queen', 1),
       (144, 'Non AC', 120.00, 'Available', 'Twin', 1),
       (145, 'AC', 120.00, 'Occupied', 'Queen', 1),
       (146, 'AC', 120.00, 'Available', 'Queen', 2),
       (147, 'Non AC', 120.00, 'Occupied', 'Twin', 2),
       (148, 'AC', 120.00, 'Available', 'Queen', 2);
       
   
 
INSERT INTO reservations (guest_id, room_number, check_in_date, check_out_date)
VALUES (8801, 143, '2023-04-01', '2023-04-02'),
    (8802, 144, '2023-04-04', '2023-04-06'),
    (8803, 145, '2023-04-04', '2023-04-05'),
    (8804, 146, '2023-04-05', '2023-04-05'),
    (8805, 147, '2023-04-06', '2023-04-07'),
    (8806, 148, '2023-04-06', '2023-04-09');
    
INSERT INTO bookings (guest_id, booking_date, booking_time)
VALUES (8801, '2023-03-31', '18:00:00'),
(8802, '2023-04-04', '17:56:23'),
(8803, '2023-04-03', '13:23:56'),
(8804, '2023-04-04', '10:11:43'),
(8805, '2023-04-06', '16:23:45'),
(8806, '2023-04-06', '07:23:54');
    
    
INSERT INTO staff (first_name, last_name, position, salary, phone_number, email)
VALUES ('Sharath', 'Rathod', 'Front desk Agent', 10000.00, '(203) 555-0178', 'sharathrathod@gmail.com'),
       ('Pratheek', 'Mekala', 'House Keeper', 8000.00, '(860) 555-8834', 'pratheekmekala@gmail.com'),
       ('Kisore', 'Reddy', 'Maintainance Technician', 12000.00, '(203) 555-6291', 'kisorereddy@gmail.com'),
       ('Sai', 'Surya', 'General Manager', 25000.00, '(475) 555-9467', 'saisurya@gmail.com'),
       ('Ram', 'Chandra', 'Food and Beverage', 8000.00, '(860) 555-3320', 'ramchandra@gmail.com'),
       ('Simon', 'RR', 'Human Resources', 10000.00, '(203) 555-8152', 'simonrr@gmail.com');




INSERT INTO payments (guest_id,booking_id, amount,payment_date, payment_method)
VALUES 
(8801,98661, 240,'2023-04-01', 'Credit card'),
(8802,98662, 300,'2023-04-04' ,'Credit card'),
(8803,98663, 240, '2023-04-04','Cash'),
(8804,98664, 120,'2023-04-05', 'Debit card'),
(8805,98665, 200,'2023-04-06', 'Cash'),
(8806,98666, 480,'2023-04-06', 'Credit card');

-- Basic Select
-- i) 

select * from bookings;
select * from departments;
select * from guests;
select * from payments;
select * from reservations;
select * from rooms;
select * from staff;

-- ii)

SELECT * FROM guests ORDER BY first_name DESC;

-- iii)
SELECT * FROM guests
WHERE city = 'New Haven' OR city = 'West Haven';

SELECT * FROM payments
WHERE amount = 240.00 AND payment_method='Credit card';

-- iv)
SELECT * FROM staff
WHERE first_name LIKE '%ra%';

SELECT * FROM guests
WHERE state IN ('CT');

-- B)
-- i)
SELECT AVG(price) AS average_price FROM rooms;

-- ii) 
SELECT COUNT(guest_id) AS Number_of_Guest_ID FROM guests; 

-- iii)
SELECT SUM(salary) AS total_salary_of_staff FROM staff;

-- C)

SELECT g.guest_id, g.first_name,g.last_name,CONCAT(g.address,' ', g.city,' ',g.state,' ',g.zip_code) AS Address, p.amount,p.payment_date,p.payment_method
FROM guests g
LEFT JOIN payments p ON g.guest_id = p.guest_id;

SELECT s.first_name,s.last_name,s.salary,d.department_id
FROM staff s
INNER JOIN departments d on s.position = d.department_name;

SELECT s.first_name,s.last_name,s.salary,d.department_id
FROM staff s
LEFT OUTER JOIN departments d on s.position = d.department_name;



-- D)

SELECT sum(amount), payment_method
FROM payments
GROUP BY payment_method
HAVING sum(amount) > 300.00;

-- E) 
CREATE VIEW Availability_for_room AS 
SELECT * FROM rooms WHERE availability='Available';

CREATE VIEW current_reservations AS
SELECT g.first_name, g.last_name, r.room_number, r.check_in_date, r.check_out_date
FROM guests g
JOIN reservations r ON g.guest_id = r.guest_id
WHERE r.check_out_date > NOW();


CREATE VIEW staff_department AS 
SELECT s.first_name, s.last_name, d.department_name 
FROM staff s 
INNER JOIN departments d ON s.position = d.department_id;