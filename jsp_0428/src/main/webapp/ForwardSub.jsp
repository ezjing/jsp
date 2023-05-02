<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-28
    Time: 오후 12:33
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>액션 태그 - forward</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
    <h2>포워드 결과</h2>
    <ul>
        <%--  페이지 자체가 바뀐것이기 때문에 page 영역은 공유 불가, request 영역은 공유 가능  --%>
        <%--  액션태그의 forward 명령으로 페이지가 이동했기 때문에 page 내장객체를 공유할 수 없음  --%>
        <li>
            page 영역 : <%= pageContext.getAttribute("pAttr")%>
        </li>
        <%--  액션태그의 forward 명령으로 페이지가 이동했지만 클라이언트를 거치지 않고 서버끼리 페이지 이동이기 때문에 request 내장 객체를 공유하고 있음  --%>
        <li>
            request 영역 : <%= request.getAttribute("rAttr")%>
        </li>
    </ul>
</div>
</body>
</html>
