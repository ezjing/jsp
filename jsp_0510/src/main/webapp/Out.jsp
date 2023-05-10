<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-10
    Time: 오후 3:05
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JSTL - out</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <%--  jstl 을 사용하여 page 영역의 변수 iTag에 데이터 저장  --%>
    <c:set var="iTag">
        i 태그는 <i>기울임</i>을 표현합니다.
    </c:set>

    <h4>기본 사용</h4>
    <%--  jstl을 사용하여 page 영역에 저장된 변수 iTag를 출력, excapeXml을 기본값인 true로 사용  --%>
    <%--  입력되어 있는 내용을 그대로 데이터로 인식하여 출력  --%>
    <c:out value="${iTag}"></c:out>

    <h4>escapeXml 속성</h4>
    <%--  jstl을 사용하여 page 영역에 저장된 변수 iTag를 출력, excapeXml을 기본값인 false로 사용  --%>
    <%--  입력되어 있는 내용 중 특수기호의 기능을 사용해서 출력  --%>
    <c:out value="${iTag}" escapeXml="false"></c:out>

    <h4>default 속성</h4>
    <%--  jstl을사용하여 default 속성에 데이터 지정  --%>
    <%--  value 속성의 값이 null일 경우 default 의 데이터를 출력함  --%>
    <c:out value="${param.name}" default="이름 없음"></c:out>   <%--  param.name은 선언한적도 없는 비어있는 데이터이기 때문에 null로 인식  --%>
    <c:out value="" default="빈 문자열도 값입니다."></c:out> <%--  빈 문자열은 아에 default 출력 안됨  --%>
</div>
</body>
</html>
