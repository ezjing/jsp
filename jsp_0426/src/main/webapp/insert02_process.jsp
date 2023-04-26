<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-26
    Time: 오후 12:14
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>PrepareStatement 로 SQL 쿼리 사용하기</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
    <%
        Connection conn = null;
        PreparedStatement pstmt = null;

        request.setCharacterEncoding("UTF-8");
        String postTitle = request.getParameter("title");
        String postId = request.getParameter("userId");
        String postContent = request.getParameter("content");

        try {
            String dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
            String dbUserId = "full505";
            String dbUserPw = "full505";

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);

            String sql = "INSERT INTO board (title, content, id, postdate)";
//            sql += "VALUES ('테스트 제목3', '테스트 컨텐츠3', 'testuser2', NOW())";
            sql += "VALUES (?, ?, ?, NOW())";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, postTitle);
            pstmt.setString(2, postContent);
            pstmt.setString(3, postId); // 외래키로 member와 연동 되어 있기 때문에 member에 없는 id 를 넣으면 오류 발생
            int result = pstmt.executeUpdate();

            out.println("board 테이블에 데이터를 추가가 성공했습니다.<br>");
            out.println(result + "개의 데이터를 추가했습니다.");
        }
        catch (SQLException e) {
            out.println("데이터 베이스 사용 시 오류가 발생했습니다.<br>");
            out.println("SQLException : " + e.getMessage());
        }
        finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            }
            catch (Exception e) {

            }
        }
    %>
</body>
</html>
