-- ==========================================================
-- Database Setup Script for College Management System
-- Target Database: CollegeManagement
-- ==========================================================

-- 1. Admin Login Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'adminlogin')
BEGIN
    CREATE TABLE adminlogin (
        ID INT IDENTITY(1,1) PRIMARY KEY,
        Username VARCHAR(55),
        Password VARCHAR(55)
    );

    INSERT INTO adminlogin (Username, Password)
    VALUES ('Divyanshu@123', 'Ramkrishn991');
END
GO

-- 2. Students Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Students')
BEGIN
    CREATE TABLE Students (
        ID INT PRIMARY KEY,
        Name VARCHAR(255),
        Dob VARCHAR(255),
        Gender VARCHAR(255),
        Email VARCHAR(255),
        Phone VARCHAR(255),
        AdmissionDate VARCHAR(255),
        Course VARCHAR(255),
        Address VARCHAR(255),
        StudentPhoto VARCHAR(255),
        Status BIT DEFAULT 1,
        Rts DATETIME DEFAULT GETDATE()
    );

    -- Sample Students (matches photos in CollegeImg/Students/)
    INSERT INTO Students (ID, Name, Dob, Gender, Email, Phone, AdmissionDate, Course, Address, StudentPhoto, Status, Rts)
    VALUES 
    (1, 'Rahul Sharma', '2001-05-15', 'Male', 'rahul@gmail.com', '9876543210', '2023-07-01', 'B.Tech CS', 'New Delhi', '1.jpg', 1, GETDATE()),
    (2, 'Priya Patel', '2002-08-20', 'Female', 'priya@gmail.com', '9876543211', '2023-07-02', 'BCA', 'Mumbai', '2.jpg', 1, GETDATE()),
    (3, 'Amit Verma', '2001-11-10', 'Male', 'amit@gmail.com', '9876543212', '2023-07-05', 'B.Sc IT', 'Jaipur', '3.jpg', 1, GETDATE());
END
GO

-- 3. Teachers Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Teachers')
BEGIN
    CREATE TABLE Teachers (
        ID INT PRIMARY KEY,
        Name VARCHAR(50),
        Dob VARCHAR(255),
        Gender VARCHAR(20),
        Email VARCHAR(50),
        Phone VARCHAR(15),
        Address VARCHAR(255),
        Qualification VARCHAR(100),
        JoiningDate VARCHAR(255),
        Department VARCHAR(100),
        ProfilePhoto VARCHAR(255),
        Status BIT DEFAULT 1,
        Rts DATETIME DEFAULT GETDATE()
    );

    -- Sample Teachers (matches photos in CollegeImg/Teachers/)
    INSERT INTO Teachers (ID, Name, Dob, Gender, Email, Phone, Address, Qualification, JoiningDate, Department, ProfilePhoto, Status, Rts)
    VALUES
    (1, 'Dr. Rajesh Kumar', '1980-03-12', 'Male', 'rajesh@college.edu', '9812345678', 'Delhi', 'Ph.D. Computer Science', '2018-06-15', 'Computer Science', '1.jpg', 1, GETDATE()),
    (2, 'Prof. Sunita Rao', '1985-07-25', 'Female', 'sunita@college.edu', '9812345679', 'Bangalore', 'M.Tech IT', '2019-08-01', 'Information Technology', '2.jpg', 1, GETDATE());
END
GO

-- 4. Courses Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Courses')
BEGIN
    CREATE TABLE Courses (
        ID INT PRIMARY KEY,
        CourseName VARCHAR(100),
        CourseCode VARCHAR(20),
        DurationYears VARCHAR(20),
        Department VARCHAR(100),
        Status BIT DEFAULT 1,
        Rts DATETIME DEFAULT GETDATE()
    );

    INSERT INTO Courses (ID, CourseName, CourseCode, DurationYears, Department, Status)
    VALUES
    (1, 'Bachelor of Technology (CS)', 'BT-CS', '4', 'Computer Science', 1),
    (2, 'Bachelor of Computer Applications', 'BCA', '3', 'Information Technology', 1);
END
GO

-- 5. Subjects Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Subjects')
BEGIN
    CREATE TABLE Subjects (
        ID INT PRIMARY KEY,
        SubjectName VARCHAR(100),
        SubjectCode VARCHAR(20),
        CreditHours INT,
        Semester INT,
        Status BIT DEFAULT 1,
        Rts DATETIME DEFAULT GETDATE()
    );

    INSERT INTO Subjects (ID, SubjectName, SubjectCode, CreditHours, Semester, Status)
    VALUES
    (1, 'Data Structures & Algorithms', 'CS201', 4, 3, 1),
    (2, 'Database Management Systems', 'CS202', 4, 3, 1);
END
GO

-- 6. Attendance Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Attendance')
BEGIN
    CREATE TABLE Attendance (
        ID INT PRIMARY KEY,
        StudentsID INT,
        AttendanceDate VARCHAR(255),
        Status BIT DEFAULT 1,
        Rts DATETIME DEFAULT GETDATE()
    );
END
GO

-- 7. ExamResults Table
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'ExamResults')
BEGIN
    CREATE TABLE ExamResults (
        StudentID INT,
        ResultID INT PRIMARY KEY,
        Subject VARCHAR(100),
        ExamDate DATE,
        MarksObtained INT,
        TotalMarks INT,
        Grade VARCHAR(5),
        Status BIT DEFAULT 1,
        Rts DATETIME DEFAULT GETDATE()
    );
END
GO
