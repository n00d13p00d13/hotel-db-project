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
    Phone VARCHAR(20) NOT NULL,
    G_ID INT,
    FOREIGN KEY(G_ID) REFERENCES Guest(G_ID)
);
SELECT * FROM GuestPhones;

CREATE TABLE RoomType IF NOT EXISTS (
    RoomType_ID INT AUTO_INCREMENT PRIMARY KEY,
    Type_Name VARCHAR(20) NOT NULL,
    PricePerNight DECIMAL(10,2) NOT NULL
);
SELECT * FROM RoomType;

CREATE TABLE Room (
    R_ID INT AUTO_INCREMENT PRIMARY KEY,
    Number VARCHAR(10) NOT NULL UNIQUE,
    Floor INT NOT NULL,
    -- Status VARCHAR(20),  -- Available, Booked, Under Maintenance
    Status ENUM('Available', 'Booked', 'Under Maintenance') NOT NULL,
    RoomType_ID INT NOT NULL,
    FOREIGN KEY (RoomType_ID) REFERENCES RoomType(RoomType_ID)
);
SELECT * FROM Room;

CREATE TABLE Booking IF NOT EXISTS (
    B_ID INT AUTO_INCREMENT PRIMARY KEY,
    G_ID INT NOT NULL,
    R_ID INT NOT NULL,
    Check_In_Date DATE NOT NULL,
    Check_Out_Date DATE NOT NULL,
    Booking_Date DATE NOT NULL,
    Meal_Plan VARCHAR(50),
    Status ENUM('Confirmed', 'Cancelled', 'Pending') NOT NULL,
    FOREIGN KEY (G_ID) REFERENCES Guest(G_ID),
    FOREIGN KEY (R_ID) REFERENCES Room(R_ID)
);
SELECT * FROM booking;

CREATE TABLE Payment IF NOT EXISTS (
    Pay_ID INT AUTO_INCREMENT PRIMARY KEY,
    B_ID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Payment_Date DATE NOT NULL,
    Payment_Method ENUM('Card', 'Cash', 'Online') NOT NULL,
    FOREIGN KEY (B_ID) REFERENCES Booking(B_ID)
);
SELECT * FROM payment;

CREATE TABLE Staff IF NOT EXISTS (
    Staff_ID INT AUTO_INCREMENT PRIMARY KEY,
    F_name VARCHAR(20) NOT NULL,
    L_name VARCHAR(20) NOT NULL,
    Role VARCHAR(40) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    Salary DECIMAL(10,2) NOT NULL,
    HireDate DATE NOT NULL
);
SELECT * FROM staff;

--------------------------------
-- 7) Shift Table
--------------------------------
CREATE TABLE Shift IF NOT EXISTS (
    Shift_ID INT AUTO_INCREMENT PRIMARY KEY,
    Staff_ID INT NOT NULL,
    ShiftName VARCHAR(50) NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    FOREIGN KEY(Shift_ID) REFERENCES Staff(Shift_ID)
);
SELECT * FROM shift;
