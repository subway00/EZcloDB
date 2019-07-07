SELECT * FROM Member
INSERT INTO Member (M_Email, M_Born) VALUES ( '12345'  , '1400-10-10' )
INSERT INTO Member (M_Email, M_Born, M_Gender, M_PW) VALUES ( '12345'  , '1400-10-10', 'F', 'a13334' )
--顯示資料結構
exec sp_columns Test
GO
--重製識別碼
DBCC CHECKIDENT (Member, RESEED, 1)
--清空資料表內容
DELETE  FROM  MEMBER

SELECT M_Email, M_PW FROM Member