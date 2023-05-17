<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-17
    Time: 오전 9:47
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="container my-4">
    <%--  method를 get 방식, post 방식 적용 시켜서 실습해볼 것   --%>
    <form action="/servlet/FormProcess.do" method="get">
        <div class="my-3">
            <label for="user-name" class="form-label">사용자 이름 : </label>
            <input type="text" class="form-control" id="user-name" name="userName" placeholder="사용자 이름을 입력하세요">
        </div>
        <div class="my-3">
            <label for="user-email" class="form-label">사용자 이메일 : </label>
            <input type="email" class="form-control" id="user-email" name="userEmail" placeholder="사용자 이메일을 입력하세요">
        </div>
        <div class="my-3">
            <button type="submit" class="btn btn-primary">확인</button>
        </div>
    </form>

</div>
</body>
</html>
