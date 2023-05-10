<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-10
    Time: 오후 2:57
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <h4>url 태그로 링크 걸기</h4>
    <c:url value="OtherPage.jsp" var="url">
        <c:param name="user_param1" value="Must"></c:param>
        <c:param name="user_param2">Have</c:param>
    </c:url>
    <a href="${url}">OtherPage.jsp 바로가기</a>
</div>
</body>
</html>
