<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-17
    Time: 오전 10:12
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>서블릿으로 데이터 처리 후 View 로 전달 시 보여줄 페이지</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container my-4">
    <h2>서블릿 하용 후 View로 사용되는 JSP 페이지</h2>

    <ul>
        <li>사용자 이름 : ${userName}</li>
        <li>사용자 이메일 : ${userEmail}</li>
        <li>사용한 방식 : ${type}</li>
    </ul>

    <a href="/servlet/form.jsp" class="btn btn-primary">form.jsp 페이지로</a>
</div>
</body>
</html>
