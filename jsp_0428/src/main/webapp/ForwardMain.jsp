<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-28
    Time: 오후 12:31
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("pAttr", "김유신");
    request.setAttribute("rAttr", "계백");
%>
<html>
<head>
    <title>액션태그 - forward</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
    <%--  포워드를 만나 페이지가 이동 됐기 때문에 "액션 태그를 이용한 포워딩" 이란 문장 출력되지 않음--%>
    <h2>액션 태그를 이용한 포워딩</h2>
    <jsp:forward page="./ForwardSub.jsp"></jsp:forward>
</div>
</body>
</html>
