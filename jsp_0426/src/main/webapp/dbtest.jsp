<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-26
  Time: 오전 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %> <%--  자바에 있는거 다 들고 오기  --%>
<html>
<head>
    <title>DB 접속 테스트</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
    <%--  jsp 에서 데이터베이스를 사용 시 java.sql 패키지가 필요함  --%>
    <%--  Connection : 실제로 데이터 베이스와 통신을 연결하기 위한 클래스  --%>
    <%--  Class.forName() : 데이터 베이스와 사용할 데이터 베이스 드라이버 로딩  --%>
    <%--  DriverManager.getConnection() : 데이터베이스와 통신을 연결하기 위한 메소드  --%>

<%
    Connection conn = null;

    try {
        // 접속 주소 설정
        // jdbc사용 : DB종류 :// DB서버URL : 포트번호 / 사용할 DB명 ? DB사용 옵션
        // 포트번호 3306 : mysql 포트번호 (8080은 톱캣 서버)
        // jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC (유니코드 사용하고 utf-8방식, serverTimezone=UTC는 없으면 그리니치천문대 시간 기준으로 출력됨. 있으면 우리나라 시간대 출력)
        String url = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
        String userId = "full505";
        String userPw = "full505";

        // 사용하는 데이터 베이스 드라이버명
        Class.forName("com.mysql.cj.jdbc.Driver");
        // 실제 데이터 베이스 서버에 접속 (db 아이디 비번 다 맞아야함)
        conn = DriverManager.getConnection(url, userId, userPw);
        out.println("데이터베이스 연결이 성공하였습니다.");
    }
    catch (SQLException e) {
        out.println("데이터베이스 연결이 실패하였습니다.");
        out.println("SQLException : " + e.getMessage());
    }
    finally {
        // 데이터 베이스 연결 종료
        // 커넥션 되면 무조건 연결 끊어주기 위해서 사용 (메모리 누수 방지, 쿼리 오류났을때도 연결 끊고 다시 접속 가능)
        try {
            if (conn != null ) {    // 한번이라도 접속하면
                conn.close();   // 접속을 끊어라
            }
        }
        catch (Exception e) {}
    }

    // Statement : 정적 SQL 쿼리문을 사용할 경우 사용
    // 하나의 쿼리문을 사용하면 더이상 사용할 수 없음, close()로 객체를 해제해야 함
    // 복잡하지 않은 간단한 SQL 쿼리문을 실행하는데 적합
    // executeQuery(sql) : SELECT 문을 실행할 경우 사용, 요청한 데이터의 반환을 ResultSet 타입으로 반환
    // executeUpdate(sql) : UPDATE, DELETE, INSERT 문을 실행할 경우 사용, 요청한 데이터를 int 타입으로 반환
    // close() : Statement 객체를 종료

    // 사용법 :
    // Statement stmt = conn.createStatement(); 객체 생성
    // String sql = "SELECT * FROM member WHERE id = 'xxx'";    간단한형태 sql문 만들어서 객체에 대입
    // ResultSet rs = stmt.executeQuery(sql);   sql문 받아오기,
    // 데이터 처리...
    // rs.close();  ResultSet 종료
    // stmt.close();    Statement 종료

    // PrepareStatement : 동적 쿼리문을 사용할 경우 사용
    // SQL 쿼리문에 변수 대신 ? 를 사용하고 해당 위치에 PrepareStatement에서 제공하는 메소드를 사용하여 데이터를 추가하여 전체 SQL 쿼리문을 완성하여 사용
    // PrepareStatement 객체를 여러번 SQL문 변경하여 사용할 수 있음
    // executeQuery() : SELECT 문을 실행할 경우 사용, 요청한 데이터를 ResultSet 타입으로 반환
    // executeUpdate() : UPDATE, DELETE, INSERT 문을 실행할 경우 사용, 요청한 데이터를 int 타입으로 반환
    // close() : PrepareStatement 객체를 종료
    // setString(index, 문자열) : 지정한 위치의 ? 기호를 매개변수로 받은 문자열로 변경함
    // setInt(index, 정수) : 지정한 위치의 ? 기호를 매개변수로 받은 정수로 변경함
    // setLong(index, 큰정수) : 지정한 위치의 ? 기호를 매개변수로 받은 정수로 변경함
    // setDouble, setFloat, setObject, SetDate, setTimestamp : 지정한 위치의 ? 기호를 매개변수로 받은 데이터를 변경함

    // 사용법
    // String sql = "INSERT INTO board (num, title, content, id, postdate, visitcount) ";
    // sql += "VALUES (?, ?, ?, ?, ?, ?) ";
    // PrepareStatement pstmt = conn.prepareStatement(sql);
    // pstmt.setInt(1,1);
    // pstmt.setString(2, "제목");
    // pstmt.setString(3, "내용");
    // pstmt.setString(4, "아이디");
    // pstmt.setString(5, "날짜");
    // pstmt.setInt(6, 0);
    // pstmt.executeQuery();
    // pstmt.close();

    // ResultSet : 데이터 베이스 서버에서 서버로 요청한 데이터를 받아오는 클래스
    // Statement, PrepareStatement 객체를 통해서 SELECT 문의 요청 결과를 저장하는 역할을 함
    // 2차원 배열과 비슷한 구조로 되어 있음
    // getXXX(컬럼 index 번호) : 지정한 컬럼의 지정한 index 번호에 저장된 데이터를 가져옴   XXX는 Int, String, ... 이런것들이다
    // getXXX(컬럼명) : 지정한 컬럼명으로 데이터를 가져옴
    // next() : 다음 행으로 이동
    // previous() : 이전 행으로 이동
    // first() : 첫번째 행으로 이동
    // last() : 마지막 행으로 이동
    // absolute(줄번호) : 지정한 행으로 이동
    // close() : ResulSet 객체 종료

    // 사용법
    // ResultSet rs - stmt.executeQuery(sql);
    // while (rs.next()) {
    //   String data1 = re.getString(0);
    //   String data2 = rx.getString("title");
    // }
    // rs.close();
%>
</body>
</html>
