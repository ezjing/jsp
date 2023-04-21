<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-21
  Time: 오후 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="IsErrorPage.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
      int myAge = Integer.parseInt(request.getParameter("age")) + 10;
      out.println("10년 후 당신의 나이는 " + myAge + "입니다.");
    %>
</body>
</html>
