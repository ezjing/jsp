<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-10
    Time: 오전 10:27
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JSTL - if</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <%--  jstl로 변수 생성 및 데이터 저장, page 영역에 저장  --%>
    <c:set var="number" value="100"></c:set>
    <c:set var="string" value="JSP"></c:set>

    <h4>JSTL의 if 태그로 짝수/홀수 판단하기</h4>
    <%--  jstl을 사용하여 page영역에 저장된 변수 number을 가져와서 2로 나눈 나머지를 0과 같은지 확인  --%>
    <%--  그 결과를 page 영역의 변수 result에 저장  --%>
    <%--<c:if test="${number % 2 eq 0}" var="result">--%>
    <c:if test="${number mod 2 eq 0}" var="result">
        ${number}는 짝수 입니다. <br>
    </c:if>
        result : ${result}

    <h4>문자열 비교와 else 구문 흉내내기</h4>
    <%--  jstl을 사용하여 page 영역에 저장된 변수 string의 값과 문자열을 비교하고 page 영역의 result2 변수에 저장  --%>
    <%--  로그인 상태에 따라서 화면을 다르게 표현할 때 주로 사용  --%>
    <%--<c:if test="${string == 'Java'}" var="result2">--%>
    <c:if test="${string eq 'Java'}" var="result2">
        문자열은 Java입니다. <br>
    </c:if>
<%--  jstl을 사용하여 page 영역에 저장된 result2 변수 값에 not 연산자를 사용하여 if ~ else 문을 구현  --%>
<%--<c:if test="${!result2}">--%>
    <c:if test="${not result2}">
        'Java'가 아닙니다. <br>
    </c:if>

    <h4>조건식 주의사항</h4>
    <c:if test="100" var="result3">
        EL이 아닌 정수를 지정하면 false    <%-- false 라서 문자열 출력 안됨  --%>
    </c:if>
    result3 : ${result3} <br>

    <c:if test="tRuE" var="result4">
        대소문자구분없이 "tRuE"인 경우 true <br>
    </c:if>
    result4 : ${result4} <br>

<%--  EL문 안쪽에 공백이 있는것은 상관없음, EL문 밖에 공백이 있을 경우 false 로 인식  --%>
    <c:if test="${true}" var="result5">
        EL 양쪽에 빈 공백이 있는 경우 false <br>
    </c:if>
    result5 : ${result5} <br>
</div>
</body>
</html>
