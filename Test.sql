SELECT * FROM Member
SELECT * FROM FileFolder

--顯示資料結構
exec sp_columns Result
GO
--重製識別碼
DBCC CHECKIDENT (FileFolder, RESEED, 0)
--清空資料表內容
DELETE  FROM  FileFolder
------------------------------------------------
--新增欄位
ALTER TABLE MEMBER ADD [M_Active] [bit] NULL
----試卷資訊
SELECT T_Name, T.T_Number, T_BuildTime, R_TestTime 
FROM FileFolder AS F LEFT JOIN Test AS T
ON F.F_Number = T.F_Number
LEFT JOIN Result AS R
ON T.T_Number = R.T_Number
WHERE F.F_Number=4051
---
ALTER TABLE Result ALTER COLUMN R_TestTime date
INSERT INTO Member (M_Email, M_Born) VALUES ( '12345'  , '1400-10-10' )
INSERT INTO Member (M_Email, M_Born, M_Gender, M_PW) VALUES ( '12345'  , '1400-10-10', 'F', 'a13334' )
INSERT INTO Result (R_Right, R_Wrong, T_Number, F_Number
SELECT M_Email, M_PW FROM Member
--刪除Row
DELETE FROM FileFolder WHERE F_Number=96

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

INSERT INTO Test(T_Name) VALUES ('yyyee')
SELECT * FROM Test WHERE T_Name='yyyee'
----帳號資訊
SELECT M_Email, M_Gender, M_Born, 
COUNT(R.R_Number)  AS '測驗次數',
COUNT(R.R_Right) AS '總答對題數',
COUNT(R.R_Wrong) AS '總答錯題數',
COUNT(R.R_Right)/ (COUNT(R.R_Right)+COUNT(R.R_Wrong)) AS '答對率'
FROM Member AS M LEFT JOIN FileFolder AS F
ON M.M_Number=F.M_Number
LEFT JOIN Test AS T
ON F.F_Number=T.F_Number
LEFT JOIN Result AS R
ON T.T_Number=R.T_Number
WHERE M.M_Number=1 
GROUP BY M_Email, M_Gender, M_Born


--SELECT * FROM Result WHERE T_Number IN (5185, 7123)
--GO
SELECT M_Email, M_Gender, M_Born, 
COUNT(R.R_Number)  AS 'FinishTest',
SUM(R.R_Wrong) + SUM(R.R_Right) AS 'TotalQuestions',
SUM(R.R_Right) AS 'RightCount',
ROUND(CONVERT(float, SUM(R.R_Right))/ SUM(R.R_Wrong + R.R_Right) *100, 2) AS 'RightRate'
FROM Member AS M LEFT JOIN FileFolder AS F
ON M.M_Number=F.M_Number
LEFT JOIN Test AS T
ON F.F_Number=T.F_Number
LEFT JOIN Result AS R
ON T.T_Number=R.T_Number
WHERE M.M_Number=2003 
GROUP BY M_Email, M_Gender, M_Born


