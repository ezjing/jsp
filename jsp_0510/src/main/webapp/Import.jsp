<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-10
    Time: 오후 2:13
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JSTL - import</title>

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
    <%--  jstl의 import는 액션태그의 include와 동일한 기능 (다이렉트 태그와 비교해보기)  --%>
    <%--  param 태그를 사용하여 매개변수를 import할 페이지로 전달할 수 있음  --%>
    <%--  import할 페이지를 page 영역의 변수 contents에 저장  --%>
    <c:import url="OtherPage.jsp" var="contents">
        <c:param name="user_param1" value="JSP"></c:param>
        <c:param name="user_param2" value="기본서"></c:param>
    </c:import>

    <h4>다른 문서 삽입하기</h4>
    <%--  page영역에 저장된 외부 페이지를 불러옴  --%>
    ${contents}

    <h4>외부 자원 삽입하기</h4>
    <iframe src="GoldPage.jsp" style="width: 100%; height: 600px;"></iframe>
</div>
</body>
</html>
