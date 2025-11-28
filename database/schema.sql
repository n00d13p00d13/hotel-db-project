CREATE TABLE Guest IF NOT EXISTS (
    G_ID INT AUTO_INCREMENT PRIMARY KEY, 
    F_name VARCHAR(20) NOT NULL,
    L_name VARCHAR(20) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    SSD VARCHAR(20),     -- National ID
    Age INT
);
-- AUTO_INCREMENT ده السطر القولتلكوا عليه بيزود تلقائي
SELECT * FROM Guest;

CREATE TABLE GuestPhones IF NOT EXISTS (
    PhoneID INT AUTO_INCREMENT PRIMARY KEY,
    Phone VARCHAR(20),
    G_ID INT,
    FOREIGN KEY(G_ID) REFERENCES Guest(G_ID)
);
SELECT * FROM GuestPhones;

CREATE TABLE RoomType IF NOT EXISTS (
    RoomType_ID INT AUTO_INCREMENT PRIMARY KEY,
    Type_Name VARCHAR(20),
    PricePerNight DECIMAL(10,2)
);
SELECT * FROM RoomType;

CREATE TABLE Room (
    R_ID INT AUTO_INCREMENT PRIMARY KEY,
    Number VARCHAR(10) UNIQUE,
    Floor INT,
    -- Status VARCHAR(20),  -- Available, Booked, Under Maintenance
    Status ENUM('Available', 'Booked', 'Under Maintenance'),
    RoomType_ID INT,
    FOREIGN KEY (RoomType_ID) REFERENCES RoomType(RoomType_ID)
);
SELECT * FROM Room;

CREATE TABLE Booking IF NOT EXISTS (
    B_ID INT AUTO_INCREMENT PRIMARY KEY,
    G_ID INT,
    R_ID INT,
    Check_In_Date DATE,
    Check_Out_Date DATE,
    Booking_Date DATE,
    Meal_Plan VARCHAR(50),
    Status ENUM('Confirmed', 'Cancelled', 'Pending'),
    FOREIGN KEY (G_ID) REFERENCES Guest(G_ID),
    FOREIGN KEY (R_ID) REFERENCES Room(R_ID)
);
SELECT * FROM booking;

CREATE TABLE Payment IF NOT EXISTS (
    Pay_ID INT AUTO_INCREMENT PRIMARY KEY,
    B_ID INT,
    Amount DECIMAL(10,2),
    Payment_Date DATE,
    Payment_Method ENUM('Card', 'Cash', 'Online'),
    FOREIGN KEY (B_ID) REFERENCES Booking(B_ID)
);
SELECT * FROM payment;

CREATE TABLE Staff IF NOT EXISTS (
    Staff_ID INT AUTO_INCREMENT PRIMARY KEY,
    F_name VARCHAR(20),
    L_name VARCHAR(20),
    Role VARCHAR(40),
    Phone VARCHAR(20),
    Email VARCHAR(50) UNIQUE,
    Salary DECIMAL(10,2),
    HireDate DATE
);
SELECT * FROM staff;

--------------------------------
-- 7) Shift Table
--------------------------------
CREATE TABLE Shift IF NOT EXISTS (
    Shift_ID INT AUTO_INCREMENT PRIMARY KEY,
    ShiftName VARCHAR(50),
    StartTime TIME,
    EndTime TIME
);
SELECT * FROM shift;

CREATE TABLE Shift_Staff IF NOT EXISTS (
    ShiftStaff_ID INT AUTO_INCREMENT PRIMARY KEY,
    Staff_ID INT,
    Shift_ID INT,
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
    FOREIGN KEY (Shift_ID) REFERENCES Shift(Shift_ID)
);
SELECT * FROM shift_staff;

