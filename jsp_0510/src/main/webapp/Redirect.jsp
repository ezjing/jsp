<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-10
    Time: 오후 2:37
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSTL - redirect</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
<%--  jstl을 사용하여 request 영역에 데이터 저장  --%>
    <c:set var="requestVar" value="MustHave" scope="request"></c:set>

<%--  jstl을 사용하여 OtherPage.jsp 페이지로 리다이렉트 실행  --%>
    <c:redirect url="OtherPage.jsp">   <%--  request영역 데이터 날라감(redirect는 클라이언트와 서버를 이동했기 때문)  --%>
<%--  매개변수로 2개의 데이터를 전달함  --%>
        <c:param name="user_param1" value="출판사"></c:param>
        <c:param name="user_param2" value="골든래빗"></c:param>
    </c:redirect>
</div>
</body>
</html>
