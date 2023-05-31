<%--
  Created by IntelliJ IDEA.
  User: god99
  Date: 2023-05-24
  Time: 오전 1:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
</head>
<body>
<div class="container-md">
    <h3 class="text-center my-5">맛도리 블로그 회원가입</h3>
    <div class="row justify-content-center">
        <div class="col-4">
            <form action="/tasty/Create.do" method="post">
                <label for="user-id" class="form-label">아이디</label>
                <input type="text" class="form-control mb-3" id="user-id" name="userId" placeholder="아이디">
                <label for="user-pw" class="form-label">비밀번호</label>
                <input type="password" class="form-control mb-3" id="user-pw" name="userPw" placeholder="비밀번호">
                <label for="user-pwch" class="form-label">비밀번호 확인</label>
                <input type="password" class="form-control mb-3" id="user-pwch" name="userPwch" placeholder="비밀번호 확인">
                <label for="user-name" class="form-label">이름</label>
                <input type="text" class="form-control mb-3" id="user-name" name="userName" placeholder="이름">
                <label for="user-nick" class="form-label">닉네임</label>
                <input type="text" class="form-control mb-3" id="user-nick" name="userNick" placeholder="닉네임">
                <div class="d-grid gap-2 mt-4">
                    <button type="submit" class="btn btn-primary p-2">회원가입</button>
                    <button type="button" class="btn btn-secondary p-2">취소</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
