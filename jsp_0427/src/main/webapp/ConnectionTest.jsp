<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-27
    Time: 오전 9:44
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bitc.jsp_0427.JDBConnect" %>
<html>
<head>
    <title>JDBC 테스트 1</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <h2>JDBC 테스트 1</h2>
    <%
        JDBConnect jdbc1 = new JDBConnect();
        jdbc1.open();
        jdbc1.close();
    %>
</div>
</body>
</html>
