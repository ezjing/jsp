<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>

<%--  서버 동작시키면 자동으로 열리는 페이지 이기 때문에 index.jsp를 따로 실행시키진 않는다  --%>
<%
    Connection conn = null;

    String dbUrl = "jdbc:mysql://localhost:3306/testdb?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
    String dbUserId = "full505";
    String dbUserPw = "full505";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUserId, dbUserPw);
        out.println("데이터 베이스에 접속 성공했습니다.");
    }
    catch (SQLException e) {
        out.println("데이터 베이스에 접속 실패했습니다.");
    }
    finally {
        try {
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