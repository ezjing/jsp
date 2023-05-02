<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-04-28
    Time: 오전 10:45
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 등록된 세션 정보(아이디 이름)를 삭제
    session.removeAttribute("UserId");
    session.removeAttribute("UserName");

    // 등록된 모든 세션 정보를 삭제(안전을 위해 중복 삭제)
    session.invalidate();

    // 삭제를 마치면 리다이렉트로 다시 로그인폼 페이지로 이동
    response.sendRedirect("LoginForm.jsp");
%>
<html>
<head>
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>

</body>
</html>
