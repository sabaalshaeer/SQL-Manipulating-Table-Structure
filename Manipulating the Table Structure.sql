--Manipulating Table Structure
--Create the Obsolete_Titles1 table has partnum,book title, sale price, and publishing date
CREATE TABLE Obsolete_Titles1 (
	partnum varchar(10) NOT NULL,
	bktitle varchar(80),
	devcost money,
	slprice money,
	pubdate smalldatetime
)

--Enter the command to display the table structure of the Obsolete_Titles1 table
sp_help Obsolete_Titles1

--Creating a Table with Constraints
--Create the potential_Customers1 table with column constraints for effective storage of potential customer information
CREATE TABLE Potential_Customers1 (
	custnum varchar(5) PRIMARY KEY,
	referredby varchar(5),
	custname varchar(30) NOT NULL,
	address varchar(50) NOT NULL,
	cellno varchar(15) CHECK (LEN(cellno)>=10),
	repid varchar(3) NOT NULL
)

--View the structure of the potential_Customers1 table 
sp_help Potential_Customers1

--Adding and dropping Columns
--Add a column named pubaddresstothe Obsolete_titles1 table
ALTER TABLE Obsolete_Titles1 ADD pubaddress varchar(40)

--Drop the devcost column from Obsolete_titles1 table
ALTER TABLE Obsolete_Titles1 DROP COLUMN devcost

--Check whether the modifications succeeded
sp_help Obsolete_Titles1

--Modifying Column Definitions and Constraints
--Create a copy of the Sales table
SELECT * INTO Sales_Copy
FROM Sales

--View the structure of Sales_copy
sp_help Sales_Copy

--Add the primary key to the Sales_copy table
ALTER TABLE Sales_Copy ADD CONSTRAINT pkeysales PRIMARY KEY (ordnum)

--the previouse statment fails because the primary key is nullable,it can accept null value assignment, if you have a primary key , its value must be provided
--add new a stament before the up statemnet
--highlight the first line and ececute then highlight the second one and exceute
ALTER TABLE Sales_Copy ALTER COLUMN ordnum varchar(10) NOT NULL
ALTER TABLE Sales_Copy ADD CONSTRAINT pkeysales PRIMARY KEY (ordnum)


--Verify the change 
sp_help Sales_copy

--Deleting table
--View a list of all tables in the Pub2 database
SELECT *
FROM Pub2.INFORMATION_SCHEMA.TABLES

--We will drop three tables from the data base, Obsolete_titles1,Potential_Customers1, and Sales_copy
DROP TABLE Obsolete_Titles1
DROP TABLE Potential_Customers1
DROP TABLE Sales_Copy

SELECT *
FROM Pub2.INFORMATION_SCHEMA.TABLES






















