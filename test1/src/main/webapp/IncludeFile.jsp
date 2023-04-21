<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-21
  Time: 오후 12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.LocalDateTime" %>
<%@page import="java.time.LocalDate"%>
<html>
<head>
    <title>다른 파일에 포함될 jsp 파일</title>
</head>
<body>
  <%
    LocalDate today = LocalDate.now();
    LocalDateTime tomorrow = LocalDateTime.now().plusDays(1);
  %>
</body>
</html>
