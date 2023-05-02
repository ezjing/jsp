<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-28
    Time: 오후 12:08
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>OuterPage</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4 border">
    <h2>외부 파일 2</h2>
    <%
        String newVar2 = "백제 온조왕";
    %>
    <ul>
        <li>page 영역 속성 : <%= pageContext.getAttribute("pAttr") %></li>
        <li>request 영역 속성 : <%= request.getAttribute("rAttr") %></li>
    </ul>
</div>
</body>
</html>
