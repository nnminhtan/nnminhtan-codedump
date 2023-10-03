USE MASTER
GO
IF EXISTS ( SELECT * FROM SYS.DATABASES WHERE NAME = 'QUANLYSINHVIEN')
	DROP DATABASE QUANLYSINHVIEN
GO

CREATE DATABASE QUANLYSINHVIEN
GO

USE QUANLYSINHVIEN
ALTER DATABASE QUANLYSINHVIEN COLLATE Vietnamese_CI_AS
--CREATE TABLE
IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE NAME = 'tblStudent')
	DROP TABLE tblStudent
GO
CREATE TABLE tblStudent
(
	STUDENTID NVARCHAR(20) NOT NULL PRIMARY KEY,
	FULLNAME NVARCHAR(20),
	AVERAGESCORE FLOAT,
	FACULTYID INT,
	MAJORID INT,
	AVATAR NVARCHAR(255)
)
IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE NAME = 'tblFaculty')
	DROP TABLE tblFaculty
GO
CREATE TABLE tblFaculty
(
	FACULTYID INT NOT NULL PRIMARY KEY,
	FACULTYNAME NVARCHAR(200)
)
IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE NAME = 'tblMajor')
	DROP TABLE tblMajor
GO
CREATE TABLE tblMajor
(
	FACULTYID INT NOT NULL,
	MAJORID INT NOT NULL,
	MAJORNAME NVARCHAR(255) NOT NULL
	primary key(MAJORID,FACULTYID)
)

ALTER TABLE tblStudent
	ADD CONSTRAINT FK_tblStudent_tblFaculty FOREIGN KEY(FACULTYID) REFERENCES tblFaculty(FACULTYID)
ALTER TABLE tblMajor
	ADD CONSTRAINT FK_tblMajor_tblFaculty FOREIGN KEY(FACULTYID) REFERENCES tblFaculty(FACULTYID)
ALTER TABLE tblStudent
	ADD CONSTRAINT FK_tblStudent_tblMajor FOREIGN KEY(MAJORID,FACULTYID) REFERENCES tblMajor(MAJORID,FACULTYID)
	
--ALTER TABLE tblMajor
--	ADD CONSTRAINT FK_tblMajor_tblFaculty FOREIGN KEY (FACULTYID) REFERENCES tblFaculty(FACULTYID)


INSERT INTO tblFaculty(FACULTYID,FACULTYNAME) VALUES('1','CNTT')
INSERT INTO tblFaculty(FACULTYID,FACULTYNAME) VALUES('2','NNA')
INSERT INTO tblFaculty(FACULTYID,FACULTYNAME) VALUES('3','QTKD')

INSERT INTO tblMajor(FACULTYID,MAJORID,MAJORNAME) VALUES('1','1','CONG NGHE PHAN MEM')
INSERT INTO tblMajor(FACULTYID,MAJORID,MAJORNAME) VALUES('2','1','TIENG ANH THUONG MAI')
INSERT INTO tblMajor(FACULTYID,MAJORID,MAJORNAME) VALUES('1','2','HE THONG THONG TIN')
INSERT INTO tblMajor(FACULTYID,MAJORID,MAJORNAME) VALUES('2','2','TIENG ANH TRUYEN THONG')
INSERT INTO tblMajor(FACULTYID,MAJORID,MAJORNAME) VALUES('1','3','AN TOAN THONG TIN')
INSERT INTO tblMajor(FACULTYID,MAJORID,MAJORNAME) VALUES('3','1','NGANH 1')
INSERT INTO tblMajor(FACULTYID,MAJORID,MAJORNAME) VALUES('3','2','NGANH 2')

--INSERT INTO tblStudent(STUDENTID,FULLNAME,AVERAGESCORE,FACULTYID,MAJORID,AVATAR) VALUES('ID1', N'STUDENT 1', '6.7','1','1','ID1')
--INSERT INTO tblStudent(STUDENTID,FULLNAME,AVERAGESCORE,FACULTYID,MAJORID,AVATAR) VALUES('ID2', N'STUDENT 2', '6.9','3','1','ID2')
--INSERT INTO tblStudent(STUDENTID,FULLNAME,AVERAGESCORE,FACULTYID,MAJORID,AVATAR) VALUES('ID3', N'STUDENT 3', '10','2','2','ID3')
--INSERT INTO tblStudent(STUDENTID,FULLNAME,AVERAGESCORE,FACULTYID,MAJORID,AVATAR) VALUES('ID4', N'STUDENT 4', '8','1','3','ID4')
--INSERT INTO tblStudent(STUDENTID,FULLNAME,AVERAGESCORE,FACULTYID,MAJORID,AVATAR) VALUES('ID5', N'STUDENT 5', '9','2','1','ID5')
--INSERT INTO tblStudent(STUDENTID,FULLNAME,AVERAGESCORE,FACULTYID,MAJORID,AVATAR) VALUES('ID6', N'STUDENT 6', '1','1','2','ID6')

INSERT INTO tblStudent(STUDENTID,FULLNAME,AVERAGESCORE,FACULTYID,MAJORID) VALUES('ID1', N'STUDENT 1', '6.7','1','1')
INSERT INTO tblStudent(STUDENTID,FULLNAME,AVERAGESCORE,FACULTYID,MAJORID) VALUES('ID2', N'STUDENT 2', '6.9','3',null)
INSERT INTO tblStudent(STUDENTID,FULLNAME,AVERAGESCORE,FACULTYID,MAJORID) VALUES('ID3', N'STUDENT 3', '10','2','2')
INSERT INTO tblStudent(STUDENTID,FULLNAME,AVERAGESCORE,FACULTYID,MAJORID) VALUES('ID4', N'STUDENT 4', '8','1','3')
INSERT INTO tblStudent(STUDENTID,FULLNAME,AVERAGESCORE,FACULTYID,MAJORID) VALUES('ID5', N'STUDENT 5', '9','2','1')
INSERT INTO tblStudent(STUDENTID,FULLNAME,AVERAGESCORE,FACULTYID,MAJORID) VALUES('ID6', N'STUDENT 6', '7','1','2')

SELECT * FROM tblFaculty
SELECT * FROM tblStudent
SELECT * FROM tblMajor