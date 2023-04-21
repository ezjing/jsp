<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2023-04-21
  Time: 오후 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>에러 처리 페이지</title>
</head>
<body>
    <h2>서비스 중 일시적인 오류가 발생하였습니다.</h2>
    <p>
        오류명 : <%= exception.getClass().getName() %> <br />
        오류 메시지 : <%= exception.getMessage() %>
    </p>
</body>
</html>
