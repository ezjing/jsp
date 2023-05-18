<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

<%--  index 뜸과 동시에 list.jsp 로 이동하게끔 설정  --%>
<%
    response.sendRedirect("/mvcBoard/List.do");
%>
</body>
</html>