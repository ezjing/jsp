SELECT * FROM testdb.member;

INSERT INTO member (id, pass, name, regidate)
VALUES ('testuser2', '1234', '테스트유저2', NOW()); -- NOW() : 현재시간 출력