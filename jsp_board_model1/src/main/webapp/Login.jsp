<%--
    Created by IntelliJ IDEA.
    User: it
    Date: 2023-05-03
    Time: 오전 9:40
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>model1 방식 게시판 만들기</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

    <script>
        $(document).ready(function() {
            $("#btn-cancel").on("click", function () {
                history.back();
            });
        });
    </script>
</head>
<body>
<%@ include file="Header.jsp" %>

<main class="container my-4">
    <div class="row">
        <div class="col-sm-4 mx-auto">
            <form action="LoginProcess.jsp" method="post">
                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="user-id" name="userId" placeholder="ID를 입력하세요">
                    <label for="user-id">User ID</label>
                </div>
                <div class="form-floating my-3">
                    <input type="text" class="form-control" id="user-pw" name="userPw" placeholder="Password를 입력하세요">
                    <label for="user-pw">User Password</label>
                </div>
                <div class="my-3 d-grid gap-3">
                    <button type="submit" class="btn btn-primary">로그인</button>
                    <button type="reset" class="btn btn-secondary" id="btn-cancel">취소</button>
                </div>
            </form>
        </div>
    </div>
</main>

<%@ include file="Footer.jsp" %>
</body>
</html>
