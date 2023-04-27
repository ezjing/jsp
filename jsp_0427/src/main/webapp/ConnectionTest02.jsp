<%@ page import="com.bitc.jsp_0427.JDBConnect" %><%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-27
    Time: 오전 10:20
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JDBC 테스트 2</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <h2>JDBC 테스트 2</h2>
    <%
        String dbDriver = application.getInitParameter("MySQLDriver");
        String dbUrl = application.getInitParameter("dbUrl");
        String opt1 = application.getInitParameter("dbUrlOpt1");
        String opt2 = application.getInitParameter("dbUrlOpt2");
        String opt3 = application.getInitParameter("dbUrlOpt3");
        String dbUserId = application.getInitParameter("dbUserId");
        String dbUserPw = application.getInitParameter("dbUserPw");

// 방법 2 사용 시
//        dbUrl += "?" + opt1 + "&" + opt2 + "&" + opt3;

        JDBConnect jdbc2 = new JDBConnect(dbDriver, dbUrl, dbUserId, dbUserPw);
        jdbc2.open();
        jdbc2.close();
    %>

<%--  문제 1) JDBConnect 클래스와 Statement 클래스 및 ResultSet을 사용하여 데이터 베이스 정보를 가져오는 프로그램을 작성하세요  --%>
<%--  board 테이블의 정보를 가져와서 table 태그로 출력 --%>
</div>
</body>
</html>
