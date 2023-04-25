SELECT * FROM testdb.board;

INSERT INTO board (title, content, id, postdate, visitcount)
VALUES ('테스트 제목 1', '테스트 컨텐츠 1', 'testuser1', NOW(), 0);	-- num은 시퀸스(ai)로 1씩 올라가도록 설정 했기 때문에 생략 해도 됨

INSERT INTO board (title, content, id, postdate)
VALUES ('테스트 제목 2', '테스트 컨텐츠 2', 'testuser2', NOW()); -- visitcount 기본값으로 0 넣어서 안쓰고 있는중