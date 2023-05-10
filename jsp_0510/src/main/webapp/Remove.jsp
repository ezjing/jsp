<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-10
    Time: 오전 10:07
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JSTL - remove</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <%--  jstl을 사용하여 각 영역에 데이터 저장  --%>
    <%--  각각의 영역에 따로 데이터가 저장되기 때문에 변수명이 같아도 저장됨  --%>
    <c:set var="scopeVar" value="Page Value"></c:set>
    <c:set var="scopeVar" value="Request Value" scope="request"></c:set>
    <c:set var="scopeVar" value="Session Value" scope="session"></c:set>
    <c:set var="scopeVar" value="Application Value" scope="application"></c:set>

    <h4>출력하기</h4>
    <ul>
        <%--  jstl을 사용하여 각 영역의 변수를 출력  --%>
        <li>scopeVar : ${scopeVar}</li>
        <li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
        <li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
        <li>applicationScope.scopeVar : ${applicationScope.scopeVar}</li>
    </ul>

    <h4>session 영역에서 삭제하기</h4>
    <%--  jstl을 사용하여 session 영역에 저장된 변수 삭제  --%>
    <c:remove var="scopeVar" scope="session"></c:remove>
    <ul>
        <li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
    </ul>

    <h4>scope 지정 없이 삭제하기</h4>
    <%--  jstl을 사용하여 저장된 변수를 삭제 시 영역 지정을 하지 않으면 모든 영역의 해당 변수를 다 삭제  --%>
    <%--  삭제 시에는 영역을 지정하는 것이 안전함  --%>
    <c:remove var="scopeVar"></c:remove>
    <ul>
        <li>scopeVar : ${scopeVar}</li>
        <li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
        <li>applicationScope.scopeVar : ${applicationScope.scopeVar}</li>
    </ul>
</div>
</body>
</html>
