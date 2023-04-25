SELECT host, user, authentication_string FROM user;

-- 사용자 삭제
DROP USER 'test1'@'localhost';
DROP USER 'test2'@'localhost';

-- 사용자 추가
CREATE USER 'full505'@'localhost' IDENTIFIED BY 'full505'; -- 내부에서 접속하는 것
CREATE USER 'full505'@'%' IDENTIFIED BY 'full505';	-- 외부에서 접속하는 것

SHOW DATABASES;

-- 데이터베이스 생성
CREATE DATABASE testdb;

SHOW GRANTS FOR 'full505'@'localhost';	-- 내부 접속권한 확인(localhost 자체적으로 서버를 열고 작업 하므로 내부 접속 권한 필요)
SHOW GRANTS FOR 'full505'@'%';	-- 외부 접속권한 확인(서버컴퓨터 처럼 외부(사용자(클라이언트) 컴퓨터) 접속을 받아들이는 컴퓨터일 경우 이런 권한이 필요)

GRANT ALL PRIVILEGES ON testdb.* TO 'full505'@'localhost'; -- 내부 접속권한 추가
GRANT ALL PRIVILEGES ON testdb1.* TO 'full505'@'localhost';
GRANT ALL PRIVILEGES ON testdb2.* TO 'full505'@'localhost';

GRANT ALL PRIVILEGES ON testdb.* TO 'full505'@'%'; -- 외부 접속권한 추가
GRANT ALL PRIVILEGES ON testdb2.* TO 'full505'@'%';


REVOKE ALL PRIVILEGES ON testdb1.* FROM 'full505'@'localhost'; -- 접속권한 삭제






