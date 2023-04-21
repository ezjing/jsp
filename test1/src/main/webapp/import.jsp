<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-21
  Time: 오전 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date"%>


<html>
<head>
    <title>클래스 import하기</title>
</head>
<body>
  <%
    Date today = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String todayStr = dateFormat.format(today);
    out.println("오늘 날짜 : " + todayStr);
  %>




</body>
</html>
