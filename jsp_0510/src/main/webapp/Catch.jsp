<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-10
    Time: 오후 3:17
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JSTL - catch</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <h4>자바 코드에서의 예외</h4>
    <%
        int num1 = 100;
    %>
    <c:catch var="eMessage">
        <%
            int result = num1 / 0;
        %>
    </c:catch>
    예외 내용 : ${eMessage}

    <h4>EL에서의 예외</h4>
    <c:set var="num2" value="200"></c:set>

    <c:catch var="eMessage">
        ${"일" + num2}
    </c:catch>
    예외 내용 : ${eMessage}
</div>
</body>
</html>
