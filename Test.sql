SELECT * FROM Member
INSERT INTO Member (M_Email, M_Born) VALUES ( '12345'  , '1400-10-10' )
INSERT INTO Member (M_Email, M_Born, M_Gender, M_PW) VALUES ( '12345'  , '1400-10-10', 'F', 'a13334' )
--��ܸ�Ƶ��c
exec sp_columns Test
GO
--���s�ѧO�X
DBCC CHECKIDENT (Member, RESEED, 1)
--�M�Ÿ�ƪ��e
DELETE  FROM  MEMBER

SELECT M_Email, M_PW FROM Member