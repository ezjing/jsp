<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-04
    Time: 오전 9:26
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 내장 객체(각 영역)에 데이터 넣기
    pageContext.setAttribute("scopeValue", "페이지 영역");
    request.setAttribute("scopeValue", "리퀘스트 영역");
    session.setAttribute("scopeValue", "세션 영역");
    application.setAttribute("scopeValue", "애플리케이션 영역");
%>
<html>
<head>
    <title>표현 언어(EL) - 내장 객체</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
    <h2>ImplicitObjMain 페이지</h2>
    <h3>각 영역에 저장된 속성 읽기</h3>

    <ul>

        <%--  표현 언어로 내장객체 접근 시 Scope 라는 단어 추가됨  --%>
        <li>페이지 영역 : ${ pageScope.scopeValue }</li>
        <li>리퀘스트 영역 : ${ requestScope.scopeValue }</li>
        <li>세션 영역 : ${ sessionScope["scopeValue"] }</li>
        <li>애플리케이션 영역 : ${ applicationScope["scopeValue"] }</li>
    </ul>

    <h3>영역 지정 없이 속성 읽기</h3>
    <ul>
        <%--  영역 지정없이 속성을 읽어오면 페이지 영역의 속성을 가져옴  --%>
        <li>${scopeValue}</li>
    </ul>

    <%--  액션 태그의 forward 명령을 통해서 지정한 페이지로 이동(주소는 ImplicitObjMain, 내용은 ImplicitForwardResult )  --%>
    <jsp:forward page="ImplicitForwardResult.jsp" />
</div>
</body>
</html>
