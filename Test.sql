SELECT * FROM FileFolder
--顯示資料結構
exec sp_columns Member
GO
--重製識別碼
DBCC CHECKIDENT (FileFolder, RESEED, 0)
--清空資料表內容
DELETE  FROM  FileFolder
------------------------------------------------
INSERT INTO Member (M_Email, M_Born) VALUES ( '12345'  , '1400-10-10' )
INSERT INTO Member (M_Email, M_Born, M_Gender, M_PW) VALUES ( '12345'  , '1400-10-10', 'F', 'a13334' )

SELECT M_Email, M_PW FROM Member

INSERT INTO FileFolder (F_Name, F_Able) VALUES ('789',  0)
INSERT INTO Test (T_Able) VALUES (1)

UPDATE FileFolder SET F_Able=0 WHERE F_Name='11'

SELECT F_Name FROM FileFolder WHERE F_Able=1 ORDER BY F_Number

UPDATE FileFolder SET F_Name='999' WHERE F_Name='789' AND F_Able='1'