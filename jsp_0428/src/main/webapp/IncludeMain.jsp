<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-28
    Time: 오후 12:09
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String outerPath1 = "./OuterPage1.jsp";
    String outerPath2 = "./OuterPage2.jsp";

    pageContext.setAttribute("pAttr", "동명왕");
    request.setAttribute("rAttr", "온조왕");
%>
<html>
<head>
    <title>지시어와 액션 태그 동작 방식 비교</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
    <h2>디렉티브 태그와와 액션 태그 동작 방식 비교</h2>
    <h3>디렉티브 태그로 페이지 include</h3>
<%--  디렉티브 태그의 include 사용 시 해당 파일을 현재 파일에 복사해서 사용  --%>
<%--  현재 파일에 모든 내용이 다 존재  --%>
<%--  page, request 내장 객체와 각각의 페이지에서 선언한 변수도 함께 사용 가능  --%>
    <%@ include file="./OuterPage1.jsp" %>
    <p>include file = <%=outerPath1%></p>
    <p>외부 파일에 선언한 변수 : <%=newVar1%></p>

    <h3>액션 태그로 페이지 include</h3>
<%--  액션 태그 include 사용 시 해당 파일로 이동 후 화면에 출력한 다음 다시 현재 파일로 돌아옴  --%>
<%--  현재 파일에는 출력된 결과물만 존재함  --%>
<%--  page 내장 객체와 각각의 페이지에서 선언한 변수도 사용할 수 없음  --%>
<%--  request 내장 객체는 함께 사용할 수 있음  --%>
    <jsp:include page="./OuterPage2.jsp" />
    <jsp:include page="<%=outerPath2%>"/>
    <p>외부 파일에 선언한 변수 : <%--=newVar2--%></p>

</div>
</body>
</html>
