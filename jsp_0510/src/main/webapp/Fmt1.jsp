<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-10
    Time: 오후 3:32
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--  포맷팅 사용을 위해서 jstl의 fmt를 추가  --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>JSTL - fmt1</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <h4>숫자 포맷 설정</h4>
    <c:set var="number1" value="12345"></c:set>
    콤마 : 0 <fmt:formatNumber value="${number1}"></fmt:formatNumber> <br>
    콤마 : X <fmt:formatNumber value="${number1}" groupingUsed="false"></fmt:formatNumber> <br>
    <fmt:formatNumber value="${number1}" type="currency" var="printNum1"></fmt:formatNumber>
    통화기호 : ${printNum1} <br>
    <fmt:formatNumber value="0.03" type="percent" var="printNum2"></fmt:formatNumber>
    퍼센트 : ${printNum2}

    <h4>문자열을 숫자로 변경</h4>
    <c:set var="number2" value="6,789.01"></c:set>
    <fmt:parseNumber value="${number2}" pattern="00,000.00" var="printNum3"></fmt:parseNumber>
    소수점까지 : ${printNum3} <br>
    <fmt:parseNumber value="${number2}" integerOnly="true" var="printNum4"></fmt:parseNumber>
    정수 부분만 : ${printNum4}

</div>
</body>
</html>
