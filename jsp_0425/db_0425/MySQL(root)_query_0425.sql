SHOW DATABASES;

use mysql;

SELECT host, user, authentication_string FROM user;

-- mysql 로그인

-- mysql -u 계정명 -p
-- mysql -u 계정명 -h [접속주소] -p
-- mysql -u 계정명 -h [접속주소] -P [port번호] -p (소문자 p가 패스워드 대문자 P가 포트)


-- 사용자 추가
-- 데이터 베이스 사용자를 추가, 접속 주소를 미 입력 시 기본값으로 localhost 가 사용됨
-- 접속 주소를 'localhost'로 설정 시 해당 컴퓨터에서만 로그인이 가능함
-- 외부에서 접속을 할 경우 접속 주소를 '%'로 설정
-- CREATE user '사용자id'@'접속주소';
-- CREATE user '사용자id'@'접속주소' identified by '비밀번호';

-- 사용자 삭제
-- drop user '사용자id'@'접속주소';

-- 데이터 베이스 생성
-- 최신 버전의 mysql은 기본 문자셋이 utf8이지만 구형 mysql 서버의 경우 기본값이 latin1으로 설정되어있음
-- 데이터 베이스 생성 시 기본 문자셋을 설정하도록 하는 것이 좋음
-- create database 'DB명';
-- create database 'DB명' default character set utf8mb4; (utf8쓰는데 4바이트씩 쓴다는 뜻)

-- 데이터 베이스 삭제
-- drop database 'DB명';

-- DB 사용 권한 설정 확인
-- 지정한 사용자의 데이터 베이스 사용 권한을 확인할 수 있음
-- show grants for '사용자id'@접속주소';

-- DB 사용 권한 설정
-- 사용 권한 설정 시 DB명.*을 사용하면 해당 DB의 모든 테이블에 대한 사용 권한을 설정함
-- grant all privileges on DB명.테이블먕 새 '사용자id'@'접속주소'

-- DB 사용 권한 제거
-- revoke all privilegets on DB명.테이블명 from '사용자id'@'접속주소';




