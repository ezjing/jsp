<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-26
  Time: 오전 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Statement 로 SQL문 실행하기</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
    <div class="container my-4">
        <%
            // 데이터 베이스와 접속 정보를 저장할 Connection 클래스의 변수 생성
            Connection conn = null;
            // SQL 쿼리문을 번역하여 데이터베이스로 전달할 Statement 클래스의 변수 생성
            Statement stmt = null;

            request.setCharacterEncoding("UTF-8");
            // 클라이언트에서 전달된 데이터 가져오기 (주소 아이디 비번)
            String userId = request.getParameter("userId");
            String userPw = request.getParameter("userPw");
            String userName = request.getParameter("userName");
            try {
                String dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
                String dbUserId = "full505";
                String dbUserPw = "full505";

                // 데이터베이스 드라이버 로딩
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);  // 정상적으로 로딩 되면 conn에 데이터 추가

                // Statement 에서 사용하는 SQL 문자열
                // Statement 에서는 String 클래스 타입의 문자열로 SQL 문자열을 완성하고 해당 SQL 쿼리문을 사용함
                String sql = "INSERT INTO member (id, pass, name, regidate) ";  // 마지막 "의 앞에 띄어쓰기 할 것. 쿼리문이 길기때문에 여러줄로 나눠 쓰게 되는데 띄어쓰기를 하지 않으면 붙여서 쓴것처럼 인식됨 ((regidate)VALUES 이런 식으로)
//                sql += "VALUES ('testuser3', '1234', '테스트유저3', NOW()) ";  // 먼저 추가하고 주석처리. 데이터 베이스에 추가 됐는지 확인해 보기
                sql += "VALUES ('" + userId + "', '" + userPw + "', '" + userName + "', NOW()) ";   // 작은따움표는 쿼리문에서 문자열 쓸때 쓰는것이라 바깥에서 감싸줌, +는 문자열끼리 연결시켜주는 연산자(없으면 붙여 쓴거로 인식돼서 오류)

                // createStatement() : 데이터베이스로 SQL 문을 보내기 위한 SQLServerStatement 개체를 만듦. (connection 객체를 통해서 Statement 객체를 생성)
                stmt = conn.createStatement();
                // 데이터 베이스로 SQL 쿼리문을 전달하여 실행
                int result = stmt.executeUpdate(sql);
                out.println("테이블에 데이터 추가가 성공했습니다.");
                out.println(result + "개의 데이터 추가");
            }
            catch (SQLException e) {
                out.println("데이터 베이스 사용 시 오류가 발생했습니다.<br>");
                out.println("SQLException : " + e.getMessage());

            }
            finally {
                try {
                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                }
                catch (Exception e) {

                }
            }
        %>

    </div>
</body>
</html>
