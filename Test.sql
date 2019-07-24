SELECT * FROM Test
--顯示資料結構
exec sp_columns Test
GO
--重製識別碼
DBCC CHECKIDENT (FileFolder, RESEED, 0)
--清空資料表內容
DELETE  FROM  FileFolder
------------------------------------------------
--新增欄位
ALTER TABLE MEMBER ADD [M_Active] [bit] NULL
INSERT INTO Member (M_Email, M_Born) VALUES ( '12345'  , '1400-10-10' )
INSERT INTO Member (M_Email, M_Born, M_Gender, M_PW) VALUES ( '12345'  , '1400-10-10', 'F', 'a13334' )

SELECT M_Email, M_PW FROM Member

INSERT INTO FileFolder (F_Name, F_Able) VALUES ('789',  0)
INSERT INTO Test (F_Number) VALUES (777)

UPDATE FileFolder SET F_Name='0' WHERE F_Name=''

SELECT T_Name FROM Test WHERE T_Able=1 AND F_Number ='28' ORDER BY T_Number

INSERT INTO Test (T_Name, T_Able, F_Number) VALUES (  'b', 1, 66)

UPDATE Test SET T_Name='999' WHERE T_Name='11' AND T_Able='1'

SELECT F_Name FROM FileFolder WHERE F_Able=1 AND F_Name='11111' ORDER BY F_Number
SELECT T_Number FROM Test WHERE T_Able=1 AND T_Name='6'
UPDATE Test SET T_Name='Fkj' WHERE T_Number=10
UPDATE Test SET T_Name='qwerasd' WHERE T_Number=8 AND T_Able='1'
UPDATE Member SET M_Active=1 WHERE M_Number=1
